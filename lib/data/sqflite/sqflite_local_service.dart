import 'dart:developer';
import 'package:bizkit/data/sqflite/sql/oncreate_db.dart';
import 'package:bizkit/domain/repository/sqflite/user_local_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart';

@LazySingleton()
@injectable
class LocalService {
  final UserLocalRepo userLocalService;

  LocalService(this.userLocalService);

  static const _databaseName = "bizkit.db";
  static const _databaseVersion = 1;

  static sql.Database? _database;

  Future<sql.Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<sql.Database?> _initDatabase() async {
    var databasesPath = await sql.getDatabasesPath();
    String path = join(databasesPath, _databaseName);

    return await sql.openDatabase(path,
        version: _databaseVersion,
        onCreate: (sql.Database db, int version) async =>
            await Sql.onCreate(db));
  }

  // get data in sql
  Future<List<Map<String, Object?>>> rawQuery(String query) async {
    try {
      final db = await database;
      return await db.rawQuery(query);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  // insert data
  Future insert(String table, Map<String, dynamic> map) async {
    try {
      final db = await database;
      return await db.insert(table, map);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  // update data
  Future update(String table, Map<String, dynamic> map) async {
    try {
      final db = await database;
      return await db.update(table, map);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  // check a value is present or not in table
  Future<bool> presetOrNot(String query) async {
    try {
      final db = await database;
      final count = sql.Sqflite.firstIntValue(await db.rawQuery(query));
      if (count! > 0) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log('presentOrNot = > ${e.toString()}');
      rethrow;
    }
  }
}
