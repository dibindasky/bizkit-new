import 'package:bizkit/module/module_manager/data/sqflite/users_local_service.dart';
import 'package:bizkit/module/module_manager/domain/model/access/access.dart';
import 'package:bizkit/module/module_manager/domain/repository/sqflite/users_local_service_repo.dart';
import 'package:bizkit/service/secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AccessController extends GetxController {
  UsersLocalRepo userLocalService = UsersLocalService();

  /// list of access user has
  RxList<Access> accessList = <Access>[].obs;

  /// role of current user
  RxString userRole = 'user'.obs;

  Future<void> initUserData() async {
    await getUserRole();
    await getUserAccess();
  }

  Future<String> getUserRole() async {
    userRole.value = await SecureStorage.getRoll();
    return userRole.value;
  }

  Future<void> getUserAccess() async {
    final response = await userLocalService.getAccessFromLocalStorage();
    response.fold((l) => accessList.value = [], (r) {
      accessList.value = r;
    });
  }
}
