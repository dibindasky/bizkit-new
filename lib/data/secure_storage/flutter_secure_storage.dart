import 'dart:developer';
import 'package:bizkit/domain/model/token/token_model.dart';
import 'package:bizkit/domain/model/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecureStorage {
  static const String accessKey = 'access_key';
  static const String refreshKey = 'refresh_key';
  static const String idKey = 'user_id_key';
  static const String isLoged = 'is_logedIn';
  static const String isBusinessKey = 'is_business';
  static const String userNameKey = 'user_name';
  static const String userEmailKey = 'user_email';
  static const String userCompanyKey = 'user_compnay';
  static const String userPhoneKey = 'user_phone';
  static const String userAddressKey = 'user_address';
  static const String userWebsiteKey = 'user_website';
  static const String isVerifiedKey = 'is_verified';
  static const String hasCardKey = 'has_card';
  static const String hasReminderKey = 'has_reminder';
  static const String onboardSetBool = 'on_board';
  static const String showCaseSetBool = 'show_case_widget';

  static Future<SharedPreferences> _getPrefs() async =>
      await SharedPreferences.getInstance();

  static Future<void> clearLogin() async {
    final prefs = await _getPrefs();
    log('clear all storage =>()');
    await prefs.setString(accessKey, '');
    await prefs.setString(refreshKey, '');
    await prefs.setString(idKey, '');
    await prefs.setString(userNameKey, '');
    await prefs.setString(accessKey, '');
    await prefs.setString(isLoged, '1');
    await prefs.setString(userNameKey, '');
    await prefs.setBool(isVerifiedKey, false);
    await prefs.setString(isBusinessKey, '');
    await prefs.setBool(hasCardKey, false);
    await prefs.setBool(hasReminderKey, false);
    // await prefs.;
  }

  static Future<void> saveToken({required TokenModel tokenModel}) async {
    final prefs = await _getPrefs();
    log('save token =>() ${tokenModel.accessToken}');
    await prefs.setString(accessKey, tokenModel.accessToken ?? '');
    await prefs.setString(refreshKey, tokenModel.refreshToken ?? '');
    await prefs.setString(idKey, tokenModel.id?.toString() ?? '');
  }

  static Future<TokenModel> getToken() async {
    final prefs = await _getPrefs();
    log('get token =>()');
    final accessToken = prefs.getString(accessKey);
    final refreshToken = prefs.getString(refreshKey);
    log('accessToken =>() $accessToken');
    return TokenModel(accessToken: accessToken, refreshToken: refreshToken);
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

  static Future<void> setLogin(
      {required String name, required bool isVerified}) async {
    final prefs = await _getPrefs();
    log('set login =>()');
    await prefs.setString(isLoged, '1');
    await prefs.setString(userNameKey, name);
    await prefs.setBool(isVerifiedKey, isVerified);
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

  static Future<bool> isVerified() async {
    final prefs = await _getPrefs();
    log('get verified =>()');
    final verified = prefs.getBool(isVerifiedKey);
    log('get verified =>() $verified');
    return verified ?? false;
  }

  static Future<String> getName() async {
    final prefs = await _getPrefs();
    log('get name =>()');
    final name = prefs.getString(userNameKey);
    log('get name =>() $name');
    return name ?? '';
  }

  static Future<int?> getUserId() async {
    final prefs = await _getPrefs();
    final id = prefs.getString(idKey);
    return id == '' || id == null ? null : int.parse(id);
  }

  static Future<void> setRole({required bool isBusiness}) async {
    final prefs = await _getPrefs();
    log('set isBusiness token =>() $isBusiness');
    await prefs.setString(isBusinessKey, isBusiness ? '1' : '0');
  }

  static Future<bool> getRole() async {
    final prefs = await _getPrefs();
    final role = prefs.getString(isBusinessKey);
    return role == '1';
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

  static Future<void> setHasReminder({required bool hasReminder}) async {
    final prefs = await _getPrefs();
    await prefs.setBool(hasReminderKey, hasReminder);
  }

  static Future<bool> getHasReminder() async {
    final prefs = await _getPrefs();
    final role = prefs.getBool(hasReminderKey);
    return role ?? false;
  }

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

  static Future<void> setUserDetails({required User user}) async {
    final prefs = await _getPrefs();
    prefs.setString(userEmailKey, user.email ?? "");
    prefs.setString(userPhoneKey, user.phoneNumber ?? "");
    prefs.setString(userWebsiteKey, user.websiteLink ?? "");
    prefs.setString(userCompanyKey, user.companyName ?? "");
    prefs.setString(userNameKey, user.name ?? "");
    prefs.setString(userAddressKey, user.address ?? "");
  }

  static Future<User> getUserDetails() async {
    final prefs = await _getPrefs();
    return User(
        companyName: prefs.getString(userCompanyKey),
        email: prefs.getString(userEmailKey),
        phoneNumber: prefs.getString(userPhoneKey),
        websiteLink: prefs.getString(userWebsiteKey),
        address: prefs.getString(userAddressKey),
        name: prefs.getString(userNameKey));
  }
}
