import 'package:TowardsLife/Models/athisudiModel.dart';
import 'package:TowardsLife/Models/models.dart';
import 'package:TowardsLife/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Service {
  Service._private();
  static final instance = Service._private();
  QueryDocumentSnapshot last;
  int limit = 20;
  bool moreAvail = true;

  Future<Object> fetch(
      {bool reset, Type type, CollectionReference collectionReference}) async {
    if (reset) last = null;
    List<QueryDocumentSnapshot> data;

    if (last != null) {
      data = await _fetchMoreKurals(collectionReference);
    } else {
      data = await _fetchKurals(collectionReference);
    }
    if (data != null) {
      switch (type) {
        case Type.kural:
          return Kural.fromDocumentSnapshot(data);
        case Type.choodi:
          return AthisudiModel.fromDocumentSnapshot(data);
        case Type.proverbs:
          return null;
      }
    }

    return null;
  }

  Future<List<QueryDocumentSnapshot>> _fetchKurals(
      CollectionReference collection) async {
    final Query query = collection.orderBy('number').limit(limit);
    final QuerySnapshot snapshot = await query.get();
    final List<QueryDocumentSnapshot> krls = snapshot.docs;
    last = snapshot.docs[krls.length - 1];
    // print(l.fromJson(krls));
    // return Kural.fromJson(krls);
    return krls;
  }

  Future<List<QueryDocumentSnapshot>> _fetchMoreKurals(
      CollectionReference collection) async {
    print('fetch more kural func');

    Query query = collection
        .orderBy('number')
        .startAfter([last.data()['number']]).limit(limit);

    if (moreAvail) {
      QuerySnapshot snapshot = await query.get();
      // krls.addAll(snapshot.docs);
      if (snapshot.docs.length >= limit)
        last = snapshot.docs[snapshot.docs.length - 1];
      else
        moreAvail = false;
      return snapshot.docs;
    }
    print('nulllll');
    return null;
  }
}
