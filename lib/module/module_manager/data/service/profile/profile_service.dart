import 'dart:developer';

import 'package:bizkit/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/module/module_manager/domain/model/profile_model/profile_model.dart';
import 'package:bizkit/module/module_manager/domain/repository/service/profile_repo/profile_repo.dart';
import 'package:bizkit/service/api_service/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProfileService implements ProfileRepo {
  ApiService apiService = ApiService();
  @override
  Future<Either<Failure, ProfileModel>> editNameAndProfileImage(
      {required ProfileModel profileModel}) async {
    try {  
      log('editNameAndProfileImage datas ${profileModel.toJson()}');
      final response=await apiService.patch(
        ApiEndPoints.nameAndImage,
        data: profileModel.toJson(),
      );
      return Right(ProfileModel.fromJson(response.data));

    } on DioException catch(e){
      log('editNameProfileImage Dio Exception $e');
      return  Left(Failure(data: profileModel,message: e.toString()));
    }
    catch (e) {
      log('editNameAndProfileImage ${e.toString()}');
    }
    throw UnimplementedError();
  }
}
