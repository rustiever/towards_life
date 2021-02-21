import 'package:towardslife/app/data/provider/fireApi.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class FireRepository {
  final FireApiClient apiClient;

  FireRepository({@required this.apiClient}) : assert(apiClient != null);

  void setAll() => apiClient.tryAll();

  Future<QuerySnapshot> fetchContents(String collection,
          {int last = 0}) async =>
      apiClient.fetchContents(collection, last: last);
}
