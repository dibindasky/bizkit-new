import 'dart:developer';

import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/service/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/module/biz_card/domain/model/user/user.dart';
import 'package:bizkit/module/biz_card/domain/repository/sqflite/user_local_repo.dart';
import 'package:bizkit/service/local_service/sqflite_local_service.dart';
import 'package:bizkit/service/local_service/sql/oncreate_db.dart';
import 'package:bizkit/utils/constants/contants.dart';
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
      final dta = await localService.rawQuery('SELECT * FROM ${Sql.userTable}');
      print(dta.map((e) => e.values.toList()));
      final id = await SecureStorage.getUserId();
      if (id == null) {
        return Left(Failure());
      }
      final String query =
          'SELECT * FROM ${Sql.userTable} WHERE ${User.colId} = $id';
      print("user id $id");
      List<Map<String, Object?>> maps = await localService.rawQuery(query);
      return Right(List.generate(maps.length, (i) {
        final Map<String, Object?> map = Map.from(maps[i]);
        // bool conversion from int
        map[User.colIsBusiness] =
            map[User.colIsBusiness] as int == 1 ? true : false;
        print('getUserData $map');
        return User.fromJson(map);
      }));
    } catch (e) {
      return Left(Failure(message: errorMessage));
    }
  }

  @override
  Future<void> updateUserName(String name) async {
    try {
      final id = await SecureStorage.getUserId();
      await localService.update(
          Sql.userTable, {User.colName: name}, "${User.colLocalId} = ?", [id]);
    } catch (e) {
      log('error in update user name $name\n ${e.toString()}');
    }
  }

  @override
  Future<void> addUser(User user) async {
    try {
      print(user.toJson());
      const query = "SELECT * FROM ${Sql.userTable} WHERE ${User.colId} = ?";
      final bool isPresent = await localService.presentOrNot(query, [user.id!]);
      if (isPresent) return;
      const insertQuery = '''
          INSERT INTO ${Sql.userTable} (
            ${User.colName},
            ${User.colPhone},
            ${User.colEmail},
            ${User.colId},
            ${User.colIsBusiness},
            ${User.colCompanyName},
            ${User.colAddress},
            ${User.colWebsite})
          VALUES (?,?,?,?,?,?,?,?)
          ''';
      // await localService.rawInsert(insertQuery, [
      //   user.name ?? '',
      //   user.phoneNumber ?? '',
      //   user.email ?? '',
      //   user.id ?? 0,
      //   user.isBusiness! ? 1 : 0,
      //   user.companyName ?? '',
      //   user.address ?? '',
      //   user.websiteLink ?? ''
      // ]);
    } catch (e) {
      log('cannot insert user data\n ${e.toString()}');
    }
  }
}
