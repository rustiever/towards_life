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
    return [jsonDecode(assets[0]), jsonDecode(assets[1])];
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.white70,
        appBar: AppBar(),
        body: FutureBuilder<List<dynamic>>(
          future: fetchAssets(),
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              collection = Collection.fromJson(snapshot.data[0]);
              kural = Kural.fromJson(snapshot.data[1]);
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    print('hello');
                    return Card(
                      child: ListTile(
                        leading: Text(kural.kural[index].number.toString()),
                        title: Text(kural.kural[index].line1 +
                            '\n' +
                            kural.kural[index].line2),
                        subtitle: Row(
                          children: <Widget>[
                            Text(collection.section.detail[2].name),
                            Container(
                              height: 20,
                              child: VerticalDivider(
                                color: Colors.blueAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  // itemCount: kural.kural.length,
                  itemCount: 20,
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      indent: 20,
                      endIndent: 20,
                      thickness: 1,
                    );
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return Text('Error');
              //Todo handle error
            }
            return Center(
              child: Text('Loading'),
            );
          },
        ),
      ),
    );
  }
}
