import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeView extends StatelessWidget {
  final CollectionReference kuralCollection =
      FirebaseFirestore.instance.collection('Aathichoodi');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(onPressed: () async {
              var v = await rootBundle.loadString('assets/aathicudi.json');
              Map vv = jsonDecode(v);
              List vb = vv['athisudi'];
              print(vb.length);
              vb.forEach((element) async {
                print(element.runtimeType);
                await kuralCollection
                    .doc(element['number'].toString())
                    .set(element);
                print('delete');
              });
              // vv.forEach((key, value) {
              //   print(value);
              // });
            })
          ],
        ),
      ),
    );
  }
}
