import 'package:bizkit/service/secure_storage/local_storage.dart';

class LocalStoragePreference {
  static const String _userName = 'user_name_key';
  static const String _accessToken = 'access_token_key';
  static const String _refreshToken = 'refresh_token_key';
  static const String _userId = 'user_id_key';

  static void setName(String name) async {
    await LocalStorageService.setString(_userName, name);
  }

  static Future<String> getName() async {
    final name = await LocalStorageService.getString(_userName);
    return name ?? '';
  }

  // static void setAccessToken(String token) async {
  //   await LocalStorageService.setString(_accessToken, token);
  // }

  // static Future<String> getAccessToken() async {
  //   final token = await LocalStorageService.getString(_accessToken);
  //   return token ?? '';
  // }

  // static void setRefreshToken(String token) async {
  //   await LocalStorageService.setString(_refreshToken, token);
  // }

  // static Future<String> getRefreshToken() async {
  //   final token = await LocalStorageService.getString(_refreshToken);
  //   return token ?? '';
  // }

  // static void setUserId(String token) async {
  //   await LocalStorageService.setString(_userId, token);
  // }

  // static Future<String> getUserId() async {
  //   final token = await LocalStorageService.getString(_userId);
  //   return token ?? '';
  // }
}
