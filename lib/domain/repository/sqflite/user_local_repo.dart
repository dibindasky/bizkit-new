import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/user/user.dart';
import 'package:dartz/dartz.dart';

abstract class UserLocalRepo {
  Future<Either<Failure, List<User>>> getUserData();
  Future<void> addUser(User qurey);
  Future<void> updateUserName(String name);
}
