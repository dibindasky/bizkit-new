import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/module/module_manager/domain/model/profile_model/profile_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepo{
  Future<Either<Failure,ProfileModel>>editNameAndProfileImage({required ProfileModel profileModel});
}