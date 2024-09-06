import 'package:bizkit/module/biz_card/domain/repository/service/connections/connections_repo.dart';
import 'package:bizkit/service/api_service/api_service.dart';

class ConnectionsService implements ConnectionsRepo {
  final ApiService apiService = ApiService();
}
