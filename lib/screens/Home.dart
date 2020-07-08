import 'dart:convert';
import 'dart:async';

import 'package:TowardsLife/Models/Kurals.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final CollectionReference t = Firestore.instance.collection('Thirukural');
  Kural kural;
  var kurals;
  bool shuffle = false, loading = true, isPlaying = false;

  Future<void> fetchAssets() async {
    String thirukurals =
        await rootBundle.loadString('assets/kurals/kuralData.json');
    kural = await compute(parseAssets, thirukurals);

    setState(() {
      loading = false;
    });

    // var v = jsonDecode(thirukurals);
    // var f = v['kurals'];
    // var dd =
    //     Map.fromIterable(f, key: (element) => f.indexOf(element).toString());
    // // print(dd);
    // await Firestore.instance
    //     .collection('Thirukural')
    //     .document('kurals')
    //     .setData(dd);

    // List d = kural.chapters;
    // var f = Map.fromIterable(
    //   d,
    //   key: (element) => d.indexOf(element).toString(),
    // );
    // print(f);
    // await t.document('chapters').setData(f);

    // d = kural.sections;
    // f = Map.fromIterable(
    //   d,
    //   key: (element) => d.indexOf(element).toString(),
    // );
    // await t.document('sections').setData(f);

    // var d = kural.kurals;
    // Map<String, dynamic> f = Map.fromIterable(
    //   d,
    //   key: (element) => d.indexOf(element).toString(),
    //   value: (element) => element,
    // );
    // print(f.runtimeType);
    // await t.document('kurals').setData(f);
  }

  static Kural parseAssets(String assets) {
    return Kural.fromJson(jsonDecode(assets));
  }

  @override
  void initState() {
    super.initState();
    fetchAssets();
    // df();
  }

  // df() async {
  //   Future<QuerySnapshot> er =
  //       Firestore.instance.collection('chaps').getDocuments();
  //   //   // .document('document-name')
  //   //   .get()
  //   //   .then((DocumentSnapshot ds) {
  //   // // use ds as a snapshot
  //   // });

  //   // print(er.);
  // }

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
            IconButton(icon: Icon(Icons.search), onPressed: null),
            IconButton(
              icon: Icon(Icons.shuffle),
              onPressed: () => setState(() => shuffle = true),
            )
          ],
        ),
        body: loading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 20),
                itemBuilder: (BuildContext context, int index) {
                  kurals = kural.kurals;
                  if (shuffle) {
                    kurals.shuffle();
                    shuffle = false;
                  } //else
                  return Container(
                    child: Card(
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
                              padding:
                                  EdgeInsets.only(left: 20, right: 20, top: 10),
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
                            trailing: IconButton(
                              alignment: Alignment.center,
                              icon: isPlaying == false
                                  ? Icon(Icons.play_circle_filled)
                                  : Icon(Icons.stop),
                              onPressed: () =>
                                  setState(() => isPlaying = !isPlaying),
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
                    ),
                  );
                },
                // itemCount: kural.kurals.length,
                itemCount: 20,
                separatorBuilder: (BuildContext context, int index) {
                  // return Divider(
                  //   indent: 20,
                  //   endIndent: 20,
                  //   thickness: 1,
                  // );
                  return Container();
                },
              ),
      ),
    );
  }
}
