import 'dart:developer';

import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/user/user.dart';
import 'package:bizkit/domain/repository/sqflite/user_local_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

@LazySingleton(as: UserLocalRepo)
@injectable
class UserLocalService implements UserLocalRepo {
  @override
  Future<void> onCreate(Database db, int version, String query) async {
    await db.execute(query);
  }

  @override
  Future<Either<Failure, List<User>>> getUserData(
      Database db, String sql) async {
    try {
      List<Map<String, Object?>> maps = await db.rawQuery(sql);
      return Right(List.generate(maps.length, (i) {
        final Map<String, Object?> map = Map.from(maps[i]);
        // bool conversion from int
        map[User.colIsBusiness] =
            map[User.colIsBusiness] as int == 1 ? true : false;
        print('user details from sql \n ${map}');
        return User.fromJson(map);
      }));
    } catch (e) {
      print('userget exception => $e');
      return Left(Failure(message: errorMessage));
    }
  }

  @override
  Future<void> addUser(Database db, String qurey) async {
    try {
      await db.rawInsert(qurey);
    } catch (e) {
      log('cannot insert user data\n ${e.toString()}');
    }
  }
}
