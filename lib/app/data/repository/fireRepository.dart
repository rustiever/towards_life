import 'package:TowardsLife/app/data/provider/fireApi.dart';
import 'package:meta/meta.dart';

class FireRepository {
  final FireApiClient apiClient;

  FireRepository({@required this.apiClient}) : assert(apiClient != null);

  void setAll() => apiClient.setAll();
}
