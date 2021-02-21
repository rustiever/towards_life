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
    final data = json.decode(
      await rootBundle.loadString('assets/jsons/detail.json'),
    );
    final int n = data.length as int;
    print(n);
    print(data);
    for (var i = 0; i < (data.length as int); i++) {
      await firestore
          .collection(kuralDetailCollection)
          .doc((i + 1).toString())
          .set(data[i] as Map<String, dynamic>);

      final v = KuralDetail.fromJson(
        (await firestore
                .collection(kuralDetailCollection)
                .doc(
                  (i + 1).toString(),
                )
                .get())
            .data(),
      );
      print(v.number);
    }
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
