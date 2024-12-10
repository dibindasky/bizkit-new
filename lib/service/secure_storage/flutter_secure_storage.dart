import 'dart:developer';
import 'package:bizkit/core/model/token/access_token/token_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecureStorage {
  static const String accessKey = 'access_key';
  static const String refreshKey = 'refresh_key';
  static const String idKey = 'user_id_key';
  static const String isLoged = 'is_loggedin';
  static const String userNameKey = 'user_name';
  static const String onboardSetBool = 'on_board';
  static const String role = 'role';
  static const String showCaseSetBool = 'show_case_widget';
  static const String hasCardKey = 'has_card';
  static const String hasConnectionKey = 'has_connection';

  static Future<SharedPreferences> _getPrefs() async =>
      await SharedPreferences.getInstance();

  static Future<void> clearLogin() async {
    final prefs = await _getPrefs();
    log('clear all storage =>()');
    await prefs.setString(refreshKey, '');
    await prefs.setString(idKey, '');
    await prefs.setString(accessKey, '');
    await prefs.setString(isLoged, '0');
    await prefs.setString(userNameKey, '');
  }

  static Future<void> saveToken({required TokenModel tokenModel}) async {
    final prefs = await _getPrefs();
    log('save token =>() ${tokenModel.accessToken}');
    await prefs.setString(accessKey, tokenModel.accessToken ?? '');
    await prefs.setString(refreshKey, tokenModel.refreshToken ?? '');
    await prefs.setString(userNameKey, tokenModel.name?.toString() ?? '');
    await prefs.setString(idKey, tokenModel.uid ?? '');
    await prefs.setString(role, tokenModel.role ?? 'user');
  }

  static Future<TokenModel> getToken() async {
    final prefs = await _getPrefs();
    log('get token =>()');
    final accessToken = prefs.getString(accessKey);
    final refreshToken = prefs.getString(refreshKey);
    final userName = prefs.getString(userNameKey);
    final uid = prefs.getString(idKey);
    final rol = prefs.getString(role);
    log('accessToken =>() $accessToken');
    return TokenModel(
        accessToken: accessToken,
        refreshToken: refreshToken,
        name: userName,
        role: rol,
        uid: uid);
  }

  static Future<void> setrole({required String rol}) async {
    final prefs = await _getPrefs();
    log('set rol =>() $rol');
    await prefs.setString(role, rol);
  }

  static Future<String> getRoll() async {
    final prefs = await _getPrefs();
    log('get role =>()');
    final rol = prefs.getString(role);
    log('get role =>($role)');
    return rol ?? 'user';
  }

  static Future<void> setUserName({required String userName}) async {
    final prefs = await _getPrefs();
    log('set access token =>() $userName');
    await prefs.setString(userNameKey, userName);
  }

  static Future<void> setAccessToken({required String accessToken}) async {
    final prefs = await _getPrefs();
    log('set access token =>() $accessToken');
    await prefs.setString(accessKey, accessToken);
  }

  static Future<void> setLogin() async {
    final prefs = await _getPrefs();
    log('set login =>()');
    await prefs.setString(isLoged, '1');
  }

  static Future<bool> getLogin() async {
    final prefs = await _getPrefs();
    log('get login =>()');
    final login = prefs.getString(isLoged);
    log('get login =>() ${login == '1'}');
    return login == '1';
  }

  static Future<void> setOnBoardBool() async {
    final prefs = await _getPrefs();
    prefs.setString(onboardSetBool, '1');
  }

  static Future<bool> getOnBoardBool() async {
    final prefs = await _getPrefs();
    final onboardBool = prefs.getString(onboardSetBool);
    log('onboard ====>> $onboardBool');
    return onboardBool == '1';
  }

  static Future<String> getName() async {
    final prefs = await _getPrefs();
    log('get name =>()');
    final name = prefs.getString(userNameKey);
    log('get name =>() $name');
    return name ?? '';
  }

  static Future<String?> getUserId() async {
    final prefs = await _getPrefs();
    return prefs.getString(idKey);
  }

  // static Future<bool> setUserId(String userId) async {
  //   final prefs = await _getPrefs();
  //   return prefs.setString(idKey, userId);
  // }

  // Show case function
  static Future<void> setHomeShowCaseViwed(String key) async {
    final prefs = await _getPrefs();
    await prefs.setBool(key, true);
  }

  static Future<bool> getHomeShowCaseViwed(String key) async {
    final prefs = await _getPrefs();
    final viewed = prefs.getBool(key);
    return viewed ?? false;
  }

  static Future<void> setHasCard({required bool hasCard}) async {
    final prefs = await _getPrefs();
    await prefs.setBool(hasCardKey, hasCard);
  }

  static Future<bool> getHasCard() async {
    final prefs = await _getPrefs();
    final role = prefs.getBool(hasCardKey);
    return role ?? false;
  }

  static Future<void> setHasConnection({required bool hasCard}) async {
    final prefs = await _getPrefs();
    await prefs.setBool(hasConnectionKey, hasCard);
  }

  static Future<bool> getHasConnection() async {
    final prefs = await _getPrefs();
    final hasConnection = prefs.getBool(hasConnectionKey);
    return hasConnection ?? false;
  }
}
