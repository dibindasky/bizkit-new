import 'dart:developer';

import 'package:bizkit/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/module/task/domain/model/errors/error_model/error_model.dart';
import 'package:bizkit/module/task/domain/model/success_responce/success_responce.dart';
import 'package:bizkit/module/task/domain/model/task/all_assigned_tasks_responce/all_assigned_tasks_responce.dart';
import 'package:bizkit/module/task/domain/model/task/all_tasks_responce/all_tasks_responce.dart';
import 'package:bizkit/module/task/domain/model/task/edit_task_model/edit_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_deadline_model/filter_by_deadline_model.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_deadline_success_responce/filter_by_deadline_success_responce.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_type_model/filter_by_type_model.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_type_success_responce/filter_by_type_success_responce.dart';
import 'package:bizkit/module/task/domain/model/task/received_requests_success_responce/received_requests_success_responce.dart';
import 'package:bizkit/module/task/domain/model/task/task_model/task_model.dart';
import 'package:bizkit/module/task/domain/model/task_success_response/task_success_response.dart';
import 'package:bizkit/module/task/domain/repository/service/task_repo.dart';
import 'package:bizkit/service/api_service/api_service.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class TaskService implements TaskRepo {
  final ApiService apiService = ApiService();

  // Create new task
  @override
  Future<Either<ErrorModel, TaskSuccessResponse>> createTask(
      {required TaskModel task}) async {
    try {
      final response = await apiService.post(
        ApiEndPoints.taskTestBaseUrl,
        data: task.toJson(),
      );
      log("=> Response CreateTask : ${response.data}");
      return Right(TaskSuccessResponse.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException createTask $e');
      return Left(ErrorModel(error: e.message ?? errorMessage));
    } catch (e) {
      log('catch createTask $e');
      return Left(ErrorModel(error: '$e'));
    }
  }

  // Get list of all tasks of user
  @override
  Future<Either<Failure, AllTasksResponce>> getAllTasks() async {
    try {
      final response = await apiService.get(ApiEndPoints.taskTestgetAllTasks);

      log("=> Response getAllTasks : ${response.data}");

      return Right(AllTasksResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException getAllTasks $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch getAllTasks $e');
      return Left(Failure(message: e.toString()));
    }
  }

  // Edit the task
  @override
  Future<Either<ErrorModel, SuccessResponce>> editTask(
      {required EditTaskModel editTask}) {
    throw UnimplementedError();
  }

  // Get all assigned tasks
  @override
  Future<Either<Failure, AllAssignedTasksResponce>> getAllAssignedTasks() {
    throw UnimplementedError();
  }

  // Filter the task by the deadline
  @override
  Future<Either<Failure, FilterByDeadlineSuccessResponce>> filterByDeadline(
      {required FilterByDeadlineModel filterByDeadline}) {
    throw UnimplementedError();
  }

  // Filter the task by type
  @override
  Future<Either<Failure, FilterByTypeSuccessResponce>> filterByType(
      {required FilterByTypeModel filterByType}) {
    throw UnimplementedError();
  }

  // Received all task requests
  @override
  Future<Either<Failure, ReceivedRequestsSuccessResponce>>
      getAllReceivedTaskRequests() {
    throw UnimplementedError();
  }
}
