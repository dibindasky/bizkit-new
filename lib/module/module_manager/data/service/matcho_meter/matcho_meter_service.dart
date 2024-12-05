import 'dart:developer';
import 'package:bizkit/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/module/module_manager/domain/model/macho_meter_model/macho_meter_model.dart';
import 'package:bizkit/module/module_manager/domain/repository/service/matcho_meter/matcho_meter_repo.dart';
import 'package:bizkit/module/task/domain/model/success_responce/success_responce.dart';
import 'package:bizkit/service/api_service/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class MatchoMeterservice implements MatchoMeterRepo {
  final ApiService apiService = ApiService();
  @override
  Future<Either<Failure, List<MachoMeterModel>>>
      getUserMatchoMeterDatas() async {
    try {
      final response = await apiService.get(ApiEndPoints.matchoMeter);
      var matchoMeterList = (response.data
          as Map<String, dynamic>?)?['matcho_meter'] as List<dynamic>?;

      List<MachoMeterModel> listMatchoMeter = [];

      for (var data in matchoMeterList ?? []) {
        log(data.toString());
        listMatchoMeter
            .add(MachoMeterModel.fromJson(data as Map<String, dynamic>));
      }

      return Right(listMatchoMeter);
    } on DioException catch (e) {
      log("getUserMatchoMeterDatas ${e.toString()}");
      return Left(Failure(data: e));
    } catch (e) {
      log("getUserMatchoMeterDatas ${e.toString()}");
      return Left(Failure(data: e));
    }
  }

  @override
  Future<Either<Failure, List<MachoMeterModel>>> getSuperAdminDatas() async {
    try {
      final response = await apiService.get(ApiEndPoints.superAdminMatchoMeter);
      List<MachoMeterModel> listSuperAdminDatas = [];
      for (var data in (response.data as List<dynamic>?) ?? []) {
        log("getSuperAdminDatas ==> ${data.toString()}");
        listSuperAdminDatas.add(MachoMeterModel.fromJson(data));
      }
      return Right(listSuperAdminDatas);
    } on DioException catch (e) {
      log(" getSuperAdminDatas ${e.toString()}");
      return Left(Failure(data: e.toString()));
    } catch (e) {
      log(" getSuperAdminDatas ${e.toString()}");
      return Left(Failure(data: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponce>> addAnswerForQuestion(
      {required List<MachoMeterModel> machoMeterModel}) async {
    try {
      final List<Map<String, dynamic>> data =
          machoMeterModel.map((model) => model.answerToJson()).toList();

      final response =
          await apiService.post(ApiEndPoints.matchoMeter, data: data);

      log("addAnswerForQuestion ==> success");
      return Right(SuccessResponce(
          message: 'success',
          data: (response.data as Map<String, dynamic>?)?['matcho_meter_id']
              as String?));
    } on DioException catch (e) {
      log(" addAnswerForQuestion ${e.toString()}");
      return Left(Failure(data: e.toString()));
    } catch (e) {
      log(" addAnswerForQuestion ${e.toString()}");
      return Left(Failure(data: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponce>> editAnswerForQuestion(
      {required MachoMeterModel machoMeterModel}) async {
    try {
      log(" editAnswerForQuestion==> ${machoMeterModel.toJson().toString()}");
      await apiService.patch(ApiEndPoints.matchoMeter,
          data: machoMeterModel.answerToJson());

      log("editAnswerForQuestion ==> sucess");

      return Right(SuccessResponce(message: 'success'));
    } on DioException catch (e) {
      log(" editAnswerForQuestion ${e.toString()}");
      return Left(Failure(data: e.toString()));
    } catch (e) {
      log(" editAnswerForQuestion ${e.toString()}");
      return Left(Failure(data: e.toString()));
    }
  }
}
