import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseClient {
  final FirebaseFirestore firestore;

  FirebaseClient(this.firestore);

  Future<QuerySnapshot> fetchContents(String collection, {int last = 0}) async {
    const limit = 10;
    final Query query = firestore
        .collection(collection)
        .orderBy('number')
        .startAfter([last]).limit(limit);
    return query.get();
  }
}
