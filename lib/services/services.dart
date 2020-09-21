import 'package:TowardsLife/Models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Service {
  Service._private();
  static final instance = Service._private();
  final CollectionReference kuralCollection =
      FirebaseFirestore.instance.collection('ThirukKural');
  QueryDocumentSnapshot last;
  int limit = 20;
  bool moreAvail = true;

  Future<Kural> fetch(reset) async {
    if (reset) last = null;
    if (last != null) {
      return await _fetchMoreKurals();
    } else {
      return await _fetchKurals();
    }
  }

  Future<Kural> _fetchKurals() async {
    Query query = kuralCollection.orderBy('number').limit(limit);
    QuerySnapshot snapshot = await query.get();
    List<QueryDocumentSnapshot> krls = snapshot.docs;
    last = snapshot.docs[krls.length - 1];
    return Kural.fromJson(krls);
  }

  Future<Kural> _fetchMoreKurals() async {
    print('fetch more kural func');

    Query query = kuralCollection
        .orderBy('number')
        .startAfter([last.data()['number']]).limit(limit);

    if (moreAvail) {
      QuerySnapshot snapshot = await query.get();
      // krls.addAll(snapshot.docs);
      if (snapshot.docs.length >= limit)
        last = snapshot.docs[snapshot.docs.length - 1];
      else
        moreAvail = false;
      return Kural.fromJson(snapshot.docs);
    }
    return null;
  }
}
