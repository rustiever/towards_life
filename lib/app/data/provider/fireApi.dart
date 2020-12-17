import 'package:TowardsLife/app/constants/constants.dart';
import 'package:TowardsLife/app/data/model/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class FireApiClient {
  final FirebaseFirestore firestore;
  FireApiClient({@required this.firestore});

  void setAll() {
    firestore.collection(kuralCollection).doc('3').set(
          Kural(
                  couplet: null,
                  line1: null,
                  line2: null,
                  number: null,
                  translation: null,
                  transliteration: null,
                  explanation: null)
              .toJson(),
        );
  }
}
