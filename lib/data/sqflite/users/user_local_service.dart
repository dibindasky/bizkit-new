import 'dart:developer';

import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/data/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/user/user.dart';
import 'package:bizkit/domain/repository/sqflite/user_local_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

@LazySingleton(as: UserLocalRepo)
@injectable
class UserLocalService implements UserLocalRepo {
  static const userTable = 'Users';
  @override
  Future<void> onCreate(Database db) async {
    const String queryUserTableCreation = '''
      CREATE TABLE IF NOT EXISTS $userTable (
        ${User.colLocalId} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${User.colId} INTEGER,
        ${User.colName} TEXT,
        ${User.colEmail} TEXT,
        ${User.colPhone} TEXT,
        ${User.colCompanyName} TEXT,
        ${User.colAddress} TEXT,
        ${User.colIsBusiness} INTEGER DEFAULT 0
      )
    ''';
    await db.execute(queryUserTableCreation);
  }

  @override
  Future<Either<Failure, List<User>>> getUserData(Database db) async {
    try {
      final id = await SecureStorage.getUSerId();
      if (id == null) {
        return Left(Failure());
      }
      final String query = 'SELECT * FROM $userTable WHERE ${User.colId} = $id';
      List<Map<String, Object?>> maps = await db.rawQuery(query);
      return Right(List.generate(maps.length, (i) {
        final Map<String, Object?> map = Map.from(maps[i]);
        // bool conversion from int
        map[User.colIsBusiness] =
            map[User.colIsBusiness] as int == 1 ? true : false;
        return User.fromJson(map);
      }));
    } catch (e) {
      return Left(Failure(message: errorMessage));
    }
  }

  @override
  Future<void> addUser(Database db, User user) async {
    try {
      final map = user.toJson();
      // while inserting convert bool to int
      map[User.colIsBusiness] = user.isBusiness! ? 1 : 0;
      await db.insert(userTable, map);
    } catch (e) {
      log('cannot insert user data\n ${e.toString()}');
    }
  }
}
