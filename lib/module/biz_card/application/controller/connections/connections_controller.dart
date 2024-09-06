import 'package:bizkit/module/biz_card/data/service/connections/connections_service.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/connections/connections_repo.dart';
import 'package:get/get.dart';

class ConnectionsController extends GetxController {
  final ConnectionsRepo connectionService = ConnectionsService();
}
