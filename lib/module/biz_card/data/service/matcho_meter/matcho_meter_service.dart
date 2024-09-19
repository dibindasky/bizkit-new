import 'dart:developer';
import 'package:bizkit/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/biz_card/domain/model/profile/matchometer/all_matcho_meters/all_matcho_meters.dart';
import 'package:bizkit/module/biz_card/domain/model/profile/matchometer/all_matcho_meters/matcho_meter.dart';
import 'package:bizkit/module/biz_card/domain/model/profile/matchometer/update_matcho_meter/update_matcho_meter.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/matcho_meter/matcho_meter_repo.dart';
import 'package:bizkit/service/api_service/api_service.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class MatchoMeterService implements MatchoMeterRepo {
  final ApiService _apiService = ApiService();
  @override
  Future<Either<Failure, SuccessResponseModel>> addMatchoMeter(
      {required List<MatchoMeter> matchoMeter}) async {
    try {
      final responce = await _apiService.post(ApiEndPoints.matchoMeter,
          data: List.generate(
            matchoMeter.length,
            (index) => {
              'question': matchoMeter[index].question,
              'answers': matchoMeter[index].answers
            },
          ));
      log('addMatchoMeter Responce  ==> success ');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('addMatchoMeter DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('addMatchoMeter catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, AllMatchoMeters>> getAllMatchoMeter() async {
    try {
      final responce = await _apiService.get(ApiEndPoints.matchoMeter);
      log('getAllMatchoMeter Responce  ==> success ');
      return Right(AllMatchoMeters.fromJson(responce.data));
    } on DioException catch (e) {
      log('getAllMatchoMeter DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('getAllMatchoMeter catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> updateMatchoMeter(
      {required UpdateMatchoMeter updateMatchoModel}) async {
    try {
      final responce = await _apiService.patch(ApiEndPoints.matchoMeter,
          data: updateMatchoModel.toJson());
      log('updateMatchoMeter Responce  ==> success ');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('updateMatchoMeter DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('updateMatchoMeter catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }
}
