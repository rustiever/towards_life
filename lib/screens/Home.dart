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
  dynamic languages;
  String language;
  double volume = 0.5;
  double pitch = 1.0;
  double rate = 0.5;
  final CollectionReference t = Firestore.instance.collection('ThirukKural');
  Kural kural;
  List<Kurals> kurals;
  bool shuffle = false, isLoading = true, isTtsPlaying = false;
  int limit = 10;

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
    _getLanguages();

    if (!kIsWeb) {
      if (Platform.isAndroid) {
        _getEngines();
      }
    }

    flutterTts.setStartHandler(() {
      setState(() {
        print("Playing");
        ttsState = TtsState.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        print("Complete");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setCancelHandler(() {
      setState(() {
        print("Cancel");
        ttsState = TtsState.stopped;
      });
    });

    if (kIsWeb || Platform.isIOS) {
      flutterTts.setPauseHandler(() {
        setState(() {
          print("Paused");
          ttsState = TtsState.paused;
        });
      });

      flutterTts.setContinueHandler(() {
        setState(() {
          print("Continued");
          ttsState = TtsState.continued;
        });
      });
    }

    flutterTts.setErrorHandler((msg) {
      setState(() {
        print("error: $msg");
        ttsState = TtsState.stopped;
      });
    });
  }

  Future _getLanguages() async {
    languages = await flutterTts.getLanguages;
    var f = await flutterTts.getVoices;
    // flutterTts.
    print(f);
    print(languages);
    if (languages != null) setState(() => languages);
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
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);

    await flutterTts.setLanguage(
        await flutterTts.isLanguageAvailable('ta-IN') ? 'ta-IN' : 'en-IN');

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
    Query query = t.orderBy('number').limit(limit);

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
    Query query =
        t.orderBy('number').startAfter([last.data['number']]).limit(limit);

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
            )
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
                        // Kural kural = Kural.fromJson(krls);
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
                                  onDoubleTap: _stop,
                                  child: IconButton(
                                    alignment: Alignment.center,
                                    icon: kural.kurals[index].isPlaying == false
                                        ? Icon(Icons.play_circle_filled)
                                        : Icon(Icons.stop),
                                    onPressed: () => setState(
                                      () {
                                        print(kural.kurals[index].kural
                                            .join(' '));
                                        if (kural.kurals[index].isPlaying ==
                                            false) {
                                          _speak(kural.kurals[index].kural
                                              .join(' '));
                                          // isTtsPlaying
                                        } else {
                                          if (Platform.isIOS)
                                            _pause();
                                          else
                                            _stop();
                                        }
                                        kural.kurals[index].isPlaying =
                                            !kural.kurals[index].isPlaying;
                                      },
                                    ),
                                  ),
                                ),
                                // isThreeLine: true,
                                contentPadding: EdgeInsets.only(
                                  bottom: 20,
                                  left: 15,
                                ),
                                title: Text(
                                  kural.kurals[index].kural[0],
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.indigoAccent),
                                ),
                                subtitle: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                    kural.kurals[index].kural[1] +
                                        ' [' +
                                        kural.kurals[index].number.toString() +
                                        ']',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.indigo),
                                  ),
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
