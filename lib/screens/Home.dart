import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Kural> fetch() async {
    final response = await http.get(
        'https://getthirukkural.appspot.com/api/2.0/kural/rnd?appid=0tq2t66h9besh&format=json');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Kural.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future kural;
  @override
  void initState() {
    super.initState();
    kural = fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          FutureBuilder<Kural>(
              future: kural,
              builder: (context, AsyncSnapshot<Kural> snapshot) {
                if (snapshot.hasData) {
                  var sdf = snapshot.data.line1.toString();
                  print(sdf.split(' '));
                  return Stack(
                    children: [
                      Container(
                        height: 300,
                        width: double.maxFinite,
                        child: Image.asset(
                          'assets/olai1.png',
                          fit: BoxFit.contain,
                          frameBuilder: (BuildContext context, Widget child,
                              int frame, bool wasSynchronouslyLoaded) {
                            if (wasSynchronouslyLoaded) {
                              return child;
                            }
                            return AnimatedOpacity(
                              child: child,
                              opacity: frame == null ? 0 : 1,
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeOut,
                            );
                          },
                        ),
                      ),
                      Positioned(
                        top: 170,
                        left: 50,
                        child: Text(
                          snapshot.data.line1,
                        ),
                      ),
                    ],
                  );
                }
                return CircularProgressIndicator();
              }),
        ],
      ),
    );
  }
}

class Kural {
  final number;
  final line1;
  final line2;
  final trans;

  Kural({this.number, this.line1, this.line2, this.trans});

  factory Kural.fromJson(Map<dynamic, dynamic> data) {
    return Kural(
      number: data['KuralSet']['Kural'][0]['Number'],
      line1: data['KuralSet']['Kural'][0]['Line1'],
      line2: data['KuralSet']['Kural'][0]['Line2'],
      trans: data['KuralSet']['Kural'][0]['Translation'],
    );
  }
}
