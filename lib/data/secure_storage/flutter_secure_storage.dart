import 'dart:developer';

import 'package:bizkit/domain/model/token/token_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const String accessKey = 'access_key';
  static const String refreshKey = 'refresh_key';
  static const String idKey = 'user_id_key';
  static const String isLoged = 'is_logedIn';
  static const String isBusinessKey = 'is_business';

  static const secureStorage = FlutterSecureStorage();

  static Future<void> saveToken({required TokenModel tokenModel}) async {
    log('save token =>() ${tokenModel.accessToken}');
    await secureStorage.write(
        key: accessKey, value: tokenModel.accessToken ?? '');
    await secureStorage.write(
        key: refreshKey, value: tokenModel.refreshToken ?? '');
    await secureStorage.write(
        key: idKey,
        value: tokenModel.id != null ? tokenModel.id.toString() : '');
  }

  static Future<TokenModel> getToken() async {
    log('get token =>()');
    final accessToken = await secureStorage.read(key: accessKey);
    final refreshToken = await secureStorage.read(key: refreshKey);
    log('accessToken =>() $accessToken');
    return TokenModel(accessToken: accessToken, refreshToken: refreshToken);
  }

  static Future<void> setAccessToken({required String accessToken}) async {
    log('set access token =>() $accessToken');
    await secureStorage.write(key: accessKey, value: accessToken);
  }

  static Future<void> setLogin() async {
    log('set token =>()');
    await secureStorage.write(key: isLoged, value: '1');
  }

  static Future<void> clearLogin() async {
    log('delete all secureStorage =>()');
    await secureStorage.deleteAll();
  }

  static Future<bool> getLogin() async {
    log('get login =>()');
    final login = await secureStorage.read(key: isLoged);
    log('get login =>() ${login == '1'}');
    return login == '1';
  }

  static Future<int?> getUserId() async {
    final id = await secureStorage.read(key: idKey);
    return id == '' || id == null ? null : int.parse(id);
  }

  static Future<void> setRole({required bool isBusiness}) async {
    log('set isBusiness token =>() $isBusiness');
    await secureStorage.write(
        key: isBusinessKey, value: isBusiness ? '1' : '0');
  }

  static Future<bool> getrole() async {
    final role = await secureStorage.read(key: isBusinessKey);
    return role == '1';
  }
}
