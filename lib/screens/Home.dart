import 'package:TowardsLife/Models/Kurals.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;
import 'package:flutter_tts/flutter_tts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

enum TtsState { playing, stopped, paused, continued }

class _HomeState extends State<Home> {
  // TODO for web check flutter-tts implementation
  ScrollController _controller = ScrollController();
  FlutterTts flutterTts;
  final CollectionReference kuralCollection =
      Firestore.instance.collection('ThirukKural');
  Kural kural;
  List<Kurals> kurals;
  bool shuffle = false, isLoading = true, isTtsPlaying = false;
  int limit = 5;

  bool moreAvail = true, isMoreLoading = false;

  TtsState ttsState = TtsState.stopped;
  get isPlaying => ttsState == TtsState.playing;

  get isStopped => ttsState == TtsState.stopped;

  get isPaused => ttsState == TtsState.paused;

  get isContinued => ttsState == TtsState.continued;
  @override
  void initState() {
    _controller.addListener(
      () {
        if (_controller.position.pixels ==
            _controller.position.maxScrollExtent) {
          print('no');
          fetchMoreKurals();
        }
      },
    );
    super.initState();
    ttsInit();
    fetchKurals();
  }

  ttsInit() {
    flutterTts = FlutterTts();

    if (!kIsWeb) {
      if (Platform.isAndroid) {
        _getEngines();
      }
    }
  }

  ttsHandler(int index) {
    flutterTts.setStartHandler(() {
      setState(() {
        print("Playing");
        kural.kurals[index].isPlaying = true;
        ttsState = TtsState.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        print("Complete");
        ttsState = TtsState.stopped;
        kural.kurals[index].isPlaying = false;
      });
    });

    flutterTts.setCancelHandler(() {
      setState(() {
        print("Cancel");
        kural.kurals[index].isPlaying = false;
        ttsState = TtsState.stopped;
      });
    });

    if (kIsWeb || Platform.isIOS) {
      flutterTts.setPauseHandler(() {
        setState(() {
          print("Paused");
          kural.kurals[index].isPlaying = false;
          ttsState = TtsState.paused;
        });
      });

      flutterTts.setContinueHandler(() {
        setState(() {
          print("Continued");
          kural.kurals[index].isPlaying = true;
          ttsState = TtsState.continued;
        });
      });
    }

    flutterTts.setErrorHandler((msg) {
      setState(() {
        print("error: $msg");
        kural.kurals[index].isPlaying = false;
        ttsState = TtsState.stopped;
      });
    });
  }

  Future _getEngines() async {
    var engines = await flutterTts.getEngines;
    if (engines != null) {
      for (dynamic engine in engines) {
        print(engine);
      }
    }
  }

  Future _speak(String text) async {
    await flutterTts.setVolume(0.8);
    await flutterTts.setSpeechRate(0.6);
    await flutterTts.setPitch(1.6);
    if (Platform.isAndroid) {
      await flutterTts.setVoice('ta-IN-language');
    }

    await flutterTts.setLanguage(
        await flutterTts.isLanguageAvailable('ta-IN') ? 'ta-IN' : 'en-IN');
    var f = await flutterTts.getVoices;
    // flutterTts.
    // f.forEach((e) => print(e));

    if (text != null) {
      if (text.isNotEmpty) {
        var result = await flutterTts.speak(text);
        if (result == 1) setState(() => ttsState = TtsState.playing);
      }
    }
  }

  Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  Future _pause() async {
    var result = await flutterTts.pause();
    if (result == 1) setState(() => ttsState = TtsState.paused);
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }

  List<DocumentSnapshot> krls = [];
  DocumentSnapshot last;
  fetchKurals() async {
    setState(() {
      isLoading = true;
    });
    Query query = kuralCollection.orderBy('number').limit(limit);

    QuerySnapshot snapshot = await query.getDocuments();

    krls = snapshot.documents;
    last = snapshot.documents[krls.length - 1];

    kural = Kural.fromJson(krls);

    setState(() {
      isLoading = false;
    });
  }

  fetchMoreKurals() async {
    print('fetch more');
    if (moreAvail == false) {
      print('no kurals');
      return;
    }

    setState(() {
      isMoreLoading = true;
    });
    Query query = kuralCollection
        .orderBy('number')
        .startAfter([last.data['number']]).limit(limit);

    print(last.data['number']);

    QuerySnapshot snapshot = await query.getDocuments();

    krls.addAll(snapshot.documents);
    kural = Kural.fromJson(krls);

    if (snapshot.documents.length >= limit)
      last = snapshot.documents[snapshot.documents.length - 1];
    else
      moreAvail = false;

    setState(() {
      isMoreLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print('call pls');
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.cyanAccent,
        appBar: AppBar(
          primary: true,
          leading: FlutterLogo(size: 100),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.elliptical(50, 45),
            ),
          ),
          title: Text('Towards Life'),
          // centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () => _speak('less done'),
            ),
            InkWell(
              onDoubleTap: fetchKurals,
              child: IconButton(
                icon: Icon(Icons.shuffle),
                onPressed: () => setState(() => shuffle = true),
              ),
            ),
          ],
        ),
        body: isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      controller: _controller,
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 20),
                      itemBuilder: (BuildContext context, int index) {
                        // print(kural.kurals[1].isPlaying.toString() + '   kk');
                        // print(sam.toString() + ' . sss');
                        kurals = kural.kurals;
                        if (shuffle) {
                          kurals.shuffle();
                          shuffle = false;
                        } //else
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            side: BorderSide(
                              width: 2,
                              color: Colors.cyan.withOpacity(0.8),
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: Column(
                            children: <Widget>[
                              // sam ? Text('true') : Text('false'),
                              // kural.kurals[index].isPlaying
                              //     ? Text('true')
                              //     : Text('false'),
                              Container(
                                height: 30,
                                child: ListView(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, top: 10),
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  children: <Widget>[
                                    Text(
                                      kural.kurals[index].chapter,
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.purple),
                                    ),
                                    Container(
                                      // margin: EdgeInsets.only(bottom: 10),
                                      height: 20,
                                      child: VerticalDivider(
                                        color: Colors.redAccent[400],
                                        // thickness: 2,
                                      ),
                                    ),
                                    Text(
                                      kural.kurals[index].section,
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.purple),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 10,
                                color: Colors.orange,
                              ),
                              ListTile(
                                trailing: InkWell(
                                  child: kural.kurals[index].isPlaying == false
                                      ? Icon(Icons.play_arrow)
                                      : Platform.isIOS
                                          ? Icon(Icons.pause)
                                          : Icon(Icons.stop),
                                  onTap: () {
                                    ttsHandler(index);
                                    setState(() {
                                      if (kural.kurals[index].isPlaying ==
                                          false) {
                                        _speak(kural.kurals[index].kural
                                            .join(' '));
                                      } else {
                                        if (Platform.isIOS) _pause();
                                        _stop();
                                      }
                                      kural.kurals[index].isPlaying =
                                          !kural.kurals[index].isPlaying;
                                    });
                                  },
                                ),
                                contentPadding: EdgeInsets.only(
                                  bottom: 20,
                                  left: 15,
                                ),
                                title: Text(
                                  kural.kurals[index].kural[0],
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.indigoAccent),
                                ),
                                subtitle: Text(
                                  kural.kurals[index].kural[1] +
                                      ' [' +
                                      kural.kurals[index].number.toString() +
                                      index.toString() +
                                      ']',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.indigo),
                                ),
                              ),
                              // Row(
                              //   children: <Widget>[
                              //     IconButton(
                              //       icon: Icon(Icons.shuffle),
                              //       onPressed: () => setState(() => shuffle = true),
                              //     ),
                              //   ],
                              // )
                            ],
                          ),
                        );
                      },
                      itemCount: kural.kurals.length,
                    ),
                  ),
                  isMoreLoading ? CircularProgressIndicator() : Container()
                ],
              ),
      ),
    );
  }
}

// import 'dart:async';
// import 'dart:io' show Platform;
// import 'package:flutter/foundation.dart' show kIsWeb;

// import 'package:flutter/material.dart';
// import 'package:flutter_tts/flutter_tts.dart';

// void main() => runApp(Home());

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// enum TtsState { playing, stopped, paused, continued }

// class _HomeState extends State<Home> {
//   FlutterTts flutterTts;
//   dynamic languages;
//   String language;
//   double volume = 0.5;
//   double pitch = 1.0;
//   double rate = 0.5;

//   String _newVoiceText;

//   TtsState ttsState = TtsState.stopped;

//   var swap = true;

//   get isPlaying => ttsState == TtsState.playing;

//   get isStopped => ttsState == TtsState.stopped;

//   get isPaused => ttsState == TtsState.paused;

//   get isContinued => ttsState == TtsState.continued;

//   @override
//   initState() {
//     super.initState();
//     initTts();
//   }

//   initTts() {
//     flutterTts = FlutterTts();

//     _getLanguages();

//     if (!kIsWeb) {
//       if (Platform.isAndroid) {
//         _getEngines();
//       }
//     }

//     flutterTts.setStartHandler(() {
//       setState(() {
//         print("Playing");
//         ttsState = TtsState.playing;
//       });
//     });

//     flutterTts.setCancelHandler(() {
//       setState(() {
//         print("Cancel");
//         ttsState = TtsState.stopped;
//       });
//     });

//     if (kIsWeb || Platform.isIOS) {
//       flutterTts.setPauseHandler(() {
//         setState(() {
//           print("Paused");
//           ttsState = TtsState.paused;
//         });
//       });

//       flutterTts.setContinueHandler(() {
//         setState(() {
//           print("Continued");
//           ttsState = TtsState.continued;
//         });
//       });
//     }

//     flutterTts.setErrorHandler((msg) {
//       setState(() {
//         print("error: $msg");
//         ttsState = TtsState.stopped;
//       });
//     });
//   }

//   Future _getLanguages() async {
//     languages = await flutterTts.getLanguages;
//     if (languages != null) setState(() => languages);
//   }

//   Future _getEngines() async {
//     var engines = await flutterTts.getEngines;
//     if (engines != null) {
//       for (dynamic engine in engines) {
//         print(engine);
//       }
//     }
//   }

//   Future _speak() async {
//     await flutterTts.setVolume(volume);
//     await flutterTts.setSpeechRate(rate);
//     await flutterTts.setPitch(pitch);

//     if (_newVoiceText != null) {
//       if (_newVoiceText.isNotEmpty) {
//         var result = await flutterTts.speak(_newVoiceText);
//         if (result == 1) setState(() => ttsState = TtsState.playing);
//       }
//     }
//   }

//   Future _stop() async {
//     var result = await flutterTts.stop();
//     if (result == 1) setState(() => ttsState = TtsState.stopped);
//   }

//   Future _pause() async {
//     var result = await flutterTts.pause();
//     if (result == 1) setState(() => ttsState = TtsState.paused);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     flutterTts.stop();
//   }

//   List<DropdownMenuItem<String>> getLanguageDropDownMenuItems() {
//     var items = List<DropdownMenuItem<String>>();
//     for (dynamic type in languages) {
//       items.add(
//           DropdownMenuItem(value: type as String, child: Text(type as String)));
//     }
//     return items;
//   }

//   void changedLanguageDropDownItem(String selectedType) {
//     setState(() {
//       language = selectedType;
//       flutterTts.setLanguage(language);
//     });
//   }

//   void _onChange(String text) {
//     setState(() {
//       _newVoiceText = text;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//             appBar: AppBar(
//               title: Text('Flutter TTS'),
//             ),
//             body: ListView.builder(
//               itemCount: 2,
//               itemBuilder: (BuildContext context, int index) {
//                 flutterTts.setCompletionHandler(() {
//                   setState(() {
//                     print("Complete");
//                     swap = !swap;
//                     ttsState = TtsState.stopped;
//                   });
//                 });
//                 return Column(children: [
//                   IconButton(
//                     icon: swap
//                         ? Icon(Icons.play_arrow)
//                         : Icon(Icons.pause_circle_outline),
//                     onPressed: () {
//                       setState(() {
//                         swap = !swap;
//                         _speak();
//                       });
//                     },
//                   ),
//                   _inputSection(),
//                   _btnSection(),
//                   languages != null ? _languageDropDownSection() : Text(""),
//                   _buildSliders()
//                 ]);
//               },
//             )));
//   }

//   Widget _inputSection() => Container(
//       alignment: Alignment.topCenter,
//       padding: EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
//       child: TextField(
//         onChanged: (String value) {
//           _onChange(value);
//         },
//       ));

//   Widget _btnSection() {
//     if (!kIsWeb && Platform.isAndroid) {
//       return Container(
//           padding: EdgeInsets.only(top: 50.0),
//           child:
//               Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//             _buildButtonColumn(Colors.green, Colors.greenAccent,
//                 Icons.play_arrow, 'PLAY', _speak),
//             _buildButtonColumn(
//                 Colors.red, Colors.redAccent, Icons.stop, 'STOP', _stop),
//           ]));
//     } else {
//       return Container(
//           padding: EdgeInsets.only(top: 50.0),
//           child:
//               Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//             _buildButtonColumn(Colors.green, Colors.greenAccent,
//                 Icons.play_arrow, 'PLAY', _speak),
//             _buildButtonColumn(
//                 Colors.red, Colors.redAccent, Icons.stop, 'STOP', _stop),
//             _buildButtonColumn(
//                 Colors.blue, Colors.blueAccent, Icons.pause, 'PAUSE', _pause),
//           ]));
//     }
//   }

//   Widget _languageDropDownSection() => Container(
//       padding: EdgeInsets.only(top: 50.0),
//       child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//         DropdownButton(
//           value: language,
//           items: getLanguageDropDownMenuItems(),
//           onChanged: changedLanguageDropDownItem,
//         )
//       ]));

//   Column _buildButtonColumn(Color color, Color splashColor, IconData icon,
//       String label, Function func) {
//     return Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           IconButton(
//               icon: Icon(icon),
//               color: color,
//               splashColor: splashColor,
//               onPressed: () => func()),
//           Container(
//               margin: const EdgeInsets.only(top: 8.0),
//               child: Text(label,
//                   style: TextStyle(
//                       fontSize: 12.0,
//                       fontWeight: FontWeight.w400,
//                       color: color)))
//         ]);
//   }

//   Widget _buildSliders() {
//     return Column(
//       children: [_volume(), _pitch(), _rate()],
//     );
//   }

//   Widget _volume() {
//     return Slider(
//         value: volume,
//         onChanged: (newVolume) {
//           setState(() => volume = newVolume);
//         },
//         min: 0.0,
//         max: 1.0,
//         divisions: 10,
//         label: "Volume: $volume");
//   }

//   Widget _pitch() {
//     return Slider(
//       value: pitch,
//       onChanged: (newPitch) {
//         setState(() => pitch = newPitch);
//       },
//       min: 0.5,
//       max: 2.0,
//       divisions: 15,
//       label: "Pitch: $pitch",
//       activeColor: Colors.red,
//     );
//   }

//   Widget _rate() {
//     return Slider(
//       value: rate,
//       onChanged: (newRate) {
//         setState(() => rate = newRate);
//       },
//       min: 0.0,
//       max: 1.0,
//       divisions: 10,
//       label: "Rate: $rate",
//       activeColor: Colors.green,
//     );
//   }
// }
