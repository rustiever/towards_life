import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:towards_life/app/data/provider/fireApi.dart';

class FireRepository {
  final FireApiClient apiClient;

  FireRepository({required this.apiClient});

  void setAll() => apiClient.tryAll();

  Future<QuerySnapshot> fetchContents(String collection,
          {int last = 0}) async =>
      apiClient.fetchContents(collection, last: last);
}
