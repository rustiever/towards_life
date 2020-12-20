import 'dart:convert';

import 'package:TowardsLife/app/constants/constants.dart';
import 'package:TowardsLife/app/data/model/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:get/get.dart';

class FireApiClient {
  final FirebaseFirestore firestore;
  FireApiClient({@required this.firestore});

  Future<void> tryAll() async {
    final hel = json.decode(
      await rootBundle.loadString('assets/kuralData.json'),
    );
    final int n = hel.length as int;
    for (var i = 0; i < (hel.length as int); i++) {
      await firestore
          .collection(kuralCollection)
          .doc((i + 1).toString())
          .set(hel[i] as Map<String, dynamic>);

      final Kural v = Kural.fromJson((await firestore
              .collection(kuralCollection)
              .doc((i + 1).toString())
              .get())
          .data());
      print(v.number);
    }
    printInfo(info: n.toString());
    print(Kural.fromJson(hel[54] as Map<String, dynamic>).couplet);
  }
}
