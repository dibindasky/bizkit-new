import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/module/biz_card/domain/model/user/user.dart';
import 'package:dartz/dartz.dart';

abstract class UserLocalRepo {
  Future<Either<Failure, List<User>>> getUserData();
  Future<void> addUser(User qurey);
  Future<void> updateUserName(String name);
}
