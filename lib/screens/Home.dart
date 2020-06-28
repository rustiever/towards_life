import 'dart:convert';
import 'dart:async';
import 'dart:ffi';
import 'dart:math';
import 'dart:ui';

import 'package:TowardsLife/Models/Kurals.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Kural kural;
  var kurals;
  bool shuffle = false;
  bool loading = true;

  Future<void> fetchAssets() async {
    String thirukurals =
        await rootBundle.loadString('assets/kurals/kuralData.json');
    kural = await compute(parseAssets, thirukurals);

    setState(() {
      loading = false;
    });
  }

  static Kural parseAssets(String assets) {
    return Kural.fromJson(jsonDecode(assets));
  }

  @override
  void initState() {
    super.initState();
    fetchAssets();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.cyanAccent,
        appBar: AppBar(
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: null),
            IconButton(
              icon: Icon(Icons.shuffle),
              onPressed: () => setState(() => shuffle = !shuffle),
            )
          ],
        ),
        body: loading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                itemBuilder: (BuildContext context, int index) {
                  kurals = kural.kurals;
                  if (shuffle) kurals.shuffle(); //else
                  return Card(
                    // margin: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: BorderSide(
                        width: 2,
                        color: Colors.primaries[Random().nextInt(18)]
                            .withOpacity(Random().nextDouble()),
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            // leading: Container(
                            //   height: 80,
                            //   width: 80,
                            //   color: Colors.amberAccent,
                            //   // margin: EdgeInsets.only(left: 15, top: 10),
                            //   child: Center(
                            //     child: Text(
                            //       kural.kurals[index].number.toString(),
                            //       style: TextStyle(fontSize: 25),
                            //     ),
                            //   ),
                            // ),
                            title: Text(kural.kurals[index].kural[0]),
                            subtitle: Text(kural.kurals[index].kural[1] +
                                '[' +
                                kural.kurals[index].number.toString() +
                                ']'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                kural.kurals[index].chapter,
                                style: TextStyle(fontSize: 13),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 5),
                                height: 20,
                                child: VerticalDivider(
                                  thickness: 2,
                                ),
                              ),
                              Text(
                                kural.kurals[index].section,
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: kural.kurals.length,
                // itemCount: 20,
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
