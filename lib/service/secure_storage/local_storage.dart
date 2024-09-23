import 'package:bizkit/service/local_service/sqflite_local_service.dart';
import 'package:bizkit/service/local_service/sql/oncreate_db.dart';
import 'package:bizkit/service/secure_storage/flutter_secure_storage.dart';

class LocalStorageService {
  static LocalService localService = LocalService();
  static String uid = '';

  /// get user id
  static Future<String> get getUid async {
    if (uid != '') return uid;
    return await SecureStorage.getUserId() ?? '';
  }

  /// store key value pair String
  static Future<void> setString(String key, String value) async {
    try {
      {
        final uid = await getUid;
        const query =
            '''SELECT COUNT(*) FROM ${Sql.localStorageTable} WHERE id = ? AND key = ?''';
        final listParams = [uid, key];
        final present = await localService.presentOrNot(query, listParams);
        if (!present) {
          await localService.rawInsert(
              '''INSERT INTO ${Sql.localStorageTable} (key, id, value) VALUES (?,?,?)''',
              [key, uid, value]);
        } else {
          const query =
              '''UPDATE ${Sql.localStorageTable} SET value = ? WHERE id = ? AND key = ?''';
          await localService.rawUpdate(query, [value, uid, key]);
        }
      }
    } catch (e) {
      return;
    }
  }

  /// store key value pain int
  static Future<void> setInt(String key, int value) async {
    try {
      {
        final uid = await getUid;
        const query =
            '''SELECT COUNT(*) FROM ${Sql.localStorageTable} WHERE id = ? AND key = ?''';
        final listParams = [uid, key];
        final present = await localService.presentOrNot(query, listParams);
        if (!present) {
          await localService.rawInsert(
              '''INSERT INTO ${Sql.localStorageTable} (key, id, value) VALUES (?,?,?)''',
              [key, uid, value.toString()]);
        } else {
          const query =
              '''UPDATE ${Sql.localStorageTable} SET value = ? WHERE id = ? AND key = ?''';
          await localService.rawUpdate(query, [value.toString(), uid, key]);
        }
      }
    } catch (e) {
      return;
    }
  }

  /// store key value pain bool
  static Future<bool> setBool(String key, bool value) async {
    try {
      {
        final uid = await getUid;
        const query =
            '''SELECT COUNT(*) FROM ${Sql.localStorageTable} WHERE id = ? AND key = ?''';
        final listParams = [uid, key];
        final present = await localService.presentOrNot(query, listParams);
        if (!present) {
          await localService.rawInsert(
              '''INSERT INTO ${Sql.localStorageTable} (key, id, value) VALUES (?,?,?)''',
              [key, uid, value.toString()]);
        } else {
          const query =
              '''UPDATE ${Sql.localStorageTable} SET value = ? WHERE id = ? AND key = ?''';
          await localService.rawUpdate(query, [value.toString(), uid, key]);
        }
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  /// get String? value using key
  static Future<String?> getString(String key) async {
    try {
      final uid = await getUid;
      const query =
          '''SELECT * FROM ${Sql.localStorageTable} WHERE id = ? AND key = ?''';
      final data = await localService.rawQuery(query, [uid, key]);
      if (data.isEmpty) return null;
      return data.first['value'] as String?;
    } catch (e) {
      return null;
    }
  }

  /// get int? value using key
  static Future<int?> getInt(String key) async {
    try {
      final uid = await getUid;
      const query =
          '''SELECT * FROM ${Sql.localStorageTable} WHERE id = ? AND key = ?''';
      final data = await localService.rawQuery(query, [uid, key]);
      if (data.isEmpty) return null;
      final value = data.first['value'] as String?;
      if (value == null) return null;
      return int.parse(value);
    } catch (e) {
      return null;
    }
  }

  /// get bool? value using key
  static Future<bool?> getBool(String key) async {
    try {
      final uid = await getUid;
      const query =
          '''SELECT * FROM ${Sql.localStorageTable} WHERE id = ? AND key = ?''';
      final data = await localService.rawQuery(query, [uid, key]);
      if (data.isEmpty) return null;
      return (data.first['value'] as String?) == 'true';
    } catch (e) {
      return null;
    }
  }
}
