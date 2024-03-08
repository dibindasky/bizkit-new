import 'dart:developer';

import 'package:bizkit/data/service/api_service.dart';
import 'package:bizkit/domain/model/profile/foregott_password_responce_mdel/foregott_password_responce_mdel.dart';
import 'package:bizkit/domain/model/profile/forgott_password_request_model/forgott_password_request_model.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/domain/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/profile/user_name_changin_request_model/user_name_changin_request_model.dart';
import 'package:bizkit/domain/model/profile/username_change_responce_model/username_change_responce_model.dart';
import 'package:bizkit/domain/repository/service/profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProfileRepo)
@injectable
class ProfileService implements ProfileRepo {
  final ApiService apiService;
  ProfileService(this.apiService);

  @override
  Future<Either<Failure, ForegottPasswordResponceMdel>> resetPassword({
    required ForgottPasswordRequestModel forgottPasswordRequestModel,
  }) async {
    try {
      print('json data>>>===${forgottPasswordRequestModel.toJson()}');
      final responce = await apiService.patch(
        ApiEndPoints.forgottPasswordProfile,
        data: forgottPasswordRequestModel.toJson(),
      );

      return Right(ForegottPasswordResponceMdel.fromJson(responce.data));
    } on DioException catch (e) {
      log('resetPassword DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
    } catch (e) {
      log('resetPassword catch $e');
      return Left(Failure(message: errorMessage));
    }
  }

  @override
  Future<Either<Failure, UsernameChangeResponceModel>> userNameChange({
    required UserNameChanginRequestModel userNameChanginRequestModel,
  }) async {
    try {
      print('json data>>>===${userNameChanginRequestModel.toJson()}');
      final responce = await apiService.patch(
        ApiEndPoints.userNameChange,
        data: userNameChanginRequestModel.toJson(),
      );
      print(
          'userNameChange json data>>>===${userNameChanginRequestModel.toJson()}');
      print('userNameChange data ${responce.data}');
      return Right(UsernameChangeResponceModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('userNameChange DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
    } catch (e) {
      log('userNameChange catch $e');
      return Left(Failure(message: errorMessage));
    }
  }
}
