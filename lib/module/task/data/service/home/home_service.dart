import 'dart:developer';

import 'package:bizkit/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/module/task/domain/model/dashboard/genearate_report_model/genearate_report_model.dart';
import 'package:bizkit/module/task/domain/model/dashboard/genearate_task_report_success_responce/genearate_task_report_success_responce.dart';
import 'package:bizkit/module/task/domain/model/dashboard/get_recent_tasks_responce/get_recent_tasks_responce.dart';
import 'package:bizkit/module/task/domain/model/dashboard/get_report_model/get_report_model.dart';
import 'package:bizkit/module/task/domain/model/dashboard/get_report_success_responce/get_report_success_responce.dart';
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

  @override
  Future<Either<Failure, GenearateTaskReportSuccessResponce>> generateReport(
      {required GenearateReportModel generateReportModel}) async {
    try {
      log('Generate report toJson ===> ${generateReportModel.toJson()}');
      final response = await apiService.post(
        ApiEndPoints.taskTestGenerateTaskReport,
        data: generateReportModel.toJson(),
      );
      log("=> Response generate report  :${response.data} ");
      return Right(GenearateTaskReportSuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException generateReport $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch generateReport $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, GetReportSuccessResponce>> getReport(
      {required GetReportModel getReportModel}) async {
    try {
      final response = await apiService.post(
        ApiEndPoints.taskTestProvideTaskReport,
        data: getReportModel.toJson(),
      );
      log("=> Response get report : ${response.data}");
      return Right(GetReportSuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException getReport $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch getReport $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, GetRecentTasksResponce>> getRecentTasks() async {
    try {
      final response = await apiService.get(
        ApiEndPoints.taskTestGetRecentTasks,
      );
      log("=> Response get recent tasks :");
      return Right(GetRecentTasksResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException getRecentTasks $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch getRecentTasks $e');
      return Left(Failure(message: e.toString()));
    }
  }
}
