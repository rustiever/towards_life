import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:towards_life/app/api/client/firebase_client.dart';

class FireRepository {
  final FirebaseClient apiClient;

  FireRepository({required this.apiClient});

  Future<QuerySnapshot> fetchContents(
    String collection, {
    int last = 0,
  }) async =>
      apiClient.fetchContents(collection, last: last);
}
