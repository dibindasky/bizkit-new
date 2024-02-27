import 'dart:developer';

import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/data/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/data/sqflite/sqflite_local_service.dart';
import 'package:bizkit/data/sqflite/sql/oncreate_db.dart';
import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/user/user.dart';
import 'package:bizkit/domain/repository/sqflite/user_local_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserLocalRepo)
@injectable
class UserLocalService implements UserLocalRepo {
  final LocalService localService;

  UserLocalService(this.localService);

  @override
  Future<Either<Failure, List<User>>> getUserData() async {
    try {
      final id = await SecureStorage.getUserId();
      if (id == null) {
        return Left(Failure());
      }
      final String query =
          'SELECT * FROM ${Sql.userTable} WHERE ${User.colId} = $id';
      List<Map<String, Object?>> maps = await localService.rawQuery(query);
      return Right(List.generate(maps.length, (i) {
        final Map<String, Object?> map = Map.from(maps[i]);
        // bool conversion from int
        map[User.colIsBusiness] =
            map[User.colIsBusiness] as int == 1 ? true : false;
        map[User.colIsVerified] =
            map[User.colIsVerified] as int == 1 ? true : false;
        print(map);
        return User.fromJson(map);
      }));
    } catch (e) {
      return Left(Failure(message: errorMessage));
    }
  }

  @override
  Future<void> addUser(User user) async {
    try {
      print(user.toJson());
      const query = "SELECT * FROM ${Sql.userTable} WHERE ${User.colId} = ?";
      final bool isPresent = await localService.presentOrNot(query, [user.id!]);
      if (isPresent) return;
      final map = user.toJson();
      // while inserting convert bool to int
      map[User.colIsBusiness] = user.isBusiness! ? 1 : 0;
      map[User.colIsVerified] = user.isVerified! ? 1 : 0;
      map.remove(User.colLocalId);
      await localService.insert(Sql.userTable, map);
    } catch (e) {
      log('cannot insert user data\n ${e.toString()}');
    }
  }
}
