import 'package:bizkit/service/secure_storage/local_storage.dart';

class LocalStoragePreference {
  static const String _userName = 'user_name_key';
  static const String _lastUsedModule = 'module_last_used';

  static void setName(String name) async {
    await LocalStorageService.setString(_userName, name);
  }

  static Future<String> getName() async {
    final name = await LocalStorageService.getString(_userName);
    return name ?? '';
  }

  static void setLastUsedModule(String module) async {
    await LocalStorageService.setString(_lastUsedModule, module);
  }

  static Future<String?> getLastUsedModule() async {
    final module = await LocalStorageService.getString(_lastUsedModule);
    return module;
  }

}
