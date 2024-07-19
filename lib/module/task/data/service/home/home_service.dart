import 'dart:developer';

import 'package:bizkit/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/module/task/domain/model/dashboard/progres_bar_success_responce/progres_bar_success_responce.dart';
import 'package:bizkit/module/task/domain/repository/service/home_repo.dart';
import 'package:bizkit/service/api_service/api_service.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeService implements HomeRepo {
  final ApiService apiService = ApiService();

  @override
  Future<Either<Failure, ProgresBarSuccessResponce>> progresBar() async {
    try {
      final response = await apiService.get(
        ApiEndPoints.taskTestProgresBar,
      );
      log("=> Response home screen progres bar : ${response.data}");
      return Right(ProgresBarSuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException progresBar $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch progresBar $e');
      return Left(Failure(message: e.toString()));
    }
  }
}
