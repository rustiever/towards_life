import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

import '../../constants/constants.dart';
import '../model/models.dart';

class FireApiClient {
  final FirebaseFirestore firestore;
  FireApiClient({@required this.firestore});

  Future<void> tryAll() async {
    final hel = json.decode(
      await rootBundle.loadString('assets/kn.json'),
    );
    final int n = hel.length as int;
    print(n);
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
    // printInfo(info: n.toString());
    print(Kural.fromJson(hel[54] as Map<String, dynamic>).couplet);
  }

  Future<QuerySnapshot> fetchContents(String collection, {int last = 0}) async {
    const limit = 10;
    final Query query = firestore
        .collection(collection)
        .orderBy('number')
        .startAfter([last]).limit(limit);
    return query.get();
  }
}
