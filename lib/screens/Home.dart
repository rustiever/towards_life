import 'dart:convert';
import 'dart:async';

import 'package:TowardsLife/Models/Details.dart';
import 'package:TowardsLife/Models/Kurals.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static Collection collection;
  static Kural kural;

  Future<List<dynamic>> fetchAssets() async {
    String details = await rootBundle.loadString('assets/kurals/detail.json');
    String kurals =
        await rootBundle.loadString('assets/kurals/thirukkural.json');
    List<String> assets = List();
    assets.addAll([details, kurals]);

    return compute(parseAssets, assets);
  }

  static List<dynamic> parseAssets(List<String> assets) {
    // final Map<String, dynamic> details = ;
    // final Map<String, dynamic> kurals = ;
    // collection = Collection.fromJson(details);
    // kural = Kural.fromJson(kurals);
    // print(kural.kural.length);
    return [jsonDecode(assets[0]), jsonDecode(assets[1])];
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                    Colors.blueAccent.withOpacity(0.9), BlendMode.colorDodge),
                image: AssetImage(
                  'assets/images/Tamil.jpeg',
                ),
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: <Widget>[
                FutureBuilder<List<dynamic>>(
                    future: fetchAssets(),
                    builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                      // if (snapshot.connectionState == ConnectionState.done) {
                      //   // var fg = json.decode(snapshot.data.toString());
                      //   // print(fg['tamil']);
                      //   return Stack(
                      //     children: [
                      //       Container(
                      //         height: 300,
                      //         width: double.maxFinite,
                      //         child: Image.asset(
                      //           'assets/portrait.jpg',
                      //           fit: BoxFit.contain,
                      //           frameBuilder: (BuildContext context, Widget child,
                      //               int frame, bool wasSynchronouslyLoaded) {
                      //             if (wasSynchronouslyLoaded) {
                      //               return child;
                      //             }
                      //             return AnimatedOpacity(
                      //               child: child,
                      //               opacity: frame == null ? 0 : 1,
                      //               duration: const Duration(seconds: 1),
                      //               curve: Curves.easeOut,
                      //             );
                      //           },
                      //         ),
                      //       ),
                      //       Positioned(
                      //         top: 170,
                      //         left: 50,
                      //         child: Text(
                      //           'gone',
                      //         ),
                      //       ),
                      //     ],
                      //   );
                      // }
                      // return CircularProgressIndicator();
                      if (snapshot.connectionState == ConnectionState.done) {
                        kural = Kural.fromJson(snapshot.data[1]);
                        collection = Collection.fromJson(snapshot.data[0]);
                        return Center(
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  collection?.tamil,
                                  // style: TextStyle(fontFamily: 'NotoSansTamil'),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text('Error');
                        //Todo handle error
                      }
                      return Center(child: Text('Loading'));
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
