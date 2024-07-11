import 'dart:developer';

import 'package:bizkit/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/module/task/domain/model/errors/error_model/error_model.dart';
import 'package:bizkit/module/task/domain/model/requests/received_requests_responce/received_requests_responce.dart';
import 'package:bizkit/module/task/domain/model/requests/send_requests_responce/send_requests_responce.dart';
import 'package:bizkit/module/task/domain/model/success_responce/success_responce.dart';
import 'package:bizkit/module/task/domain/model/task/all_assigned_tasks_responce/all_assigned_tasks_responce.dart';
import 'package:bizkit/module/task/domain/model/task/all_tasks_responce/all_tasks_responce.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_deadline_model/filter_by_deadline_model.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_deadline_success_responce/filter_by_deadline_success_responce.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_type_model/filter_by_type_model.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_type_success_responce/filter_by_type_success_responce.dart';
import 'package:bizkit/module/task/domain/model/task/task_model/task_model.dart';
import 'package:bizkit/module/task/domain/model/task/task_success_responce/task_success_responce.dart';
import 'package:bizkit/module/task/domain/repository/service/task_repo.dart';
import 'package:bizkit/service/api_service/api_service.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class TaskService implements TaskRepo {
  final ApiService apiService = ApiService();

  // Create new task
  @override
  Future<Either<ErrorModel, TaskSuccessResponce>> createTask(
      {required TaskModel task}) async {
    try {
      final response = await apiService.post(
        ApiEndPoints.taskTestCreateTask,
        data: task.toJson(),
      );
      log("=> Response CreateTask : ${response.data}");
      return Right(TaskSuccessResponce.fromJson(response.data));
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
      log("=> Response All Tasks : ${response.data}");

      List<dynamic> data = response.data;
      List<Tasks> tasks = data.map((task) => Tasks.fromJson(task)).toList();

      return Right(AllTasksResponce(tasks: tasks));
    } on DioException catch (e) {
      log('DioException getAllTasks $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch getAllTasks $e');
      return Left(Failure(message: e.toString()));
    }
  }

  // Edit the task
  // @override
  // Future<Either<ErrorModel, SuccessResponce>> editTask(
  //     {required EditTaskModel editTask}) {
  //   throw UnimplementedError();
  // }

  // Get all assigned tasks
  @override
  Future<Either<Failure, AllAssignedTasksResponce>> getAllAssignedTasks() {
    throw UnimplementedError();
  }

  // Filter the task by the deadline
  // @override
  // Future<Either<Failure, FilterByDeadlineSuccessResponce>> filterByDeadline(
  //     {required FilterByDeadlineModel filterByDeadline}) {
  //   throw UnimplementedError();
  // }

  // Filter the task by type
  @override
  Future<Either<Failure, FilterByTypeSuccessResponce>> filterByType(
      {required FilterByTypeModel filterByType}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, SendRequestsResponce>> getSendRequests() async {
    try {
      final response = await apiService.get(ApiEndPoints.taskTestSendRequests);
      log("=> Response Send Requests : ${response.data}");
      return Right(SendRequestsResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException getSendRequests $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch getSendRequests $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ReceivedRequestsResponce>>>
      getReceivedRequests() async {
    try {
      final response =
          await apiService.get(ApiEndPoints.taskTestReceivedRequests);
      log("=> Response Received Requests : ${response.data}");
      final List<dynamic> data = response.data;
      final receivedRequests =
          data.map((json) => ReceivedRequestsResponce.fromJson(json)).toList();
      return Right(receivedRequests);
    } on DioException catch (e) {
      log('DioException getReceivedRequests $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch getReceivedRequests $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, FilterByDeadlineSuccessResponce>> filterByDeadline(
      {required FilterByDeadlineModel filterByDeadline}) async {
    try {
      log('${filterByDeadline.toJson()}');
      final response = await apiService.post(
        ApiEndPoints.taskTestFilterByDeadline,
        data: filterByDeadline.toJson(),
      );
      log("=> Response Filter by deadline : ${response.data}");
      return Right(FilterByDeadlineSuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException filterByDeadline $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch filterByDeadline $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorModel, SuccessResponce>> pinnedATask() {
    // TODO: implement pinnedATask
    throw UnimplementedError();
  }

  // Received all task requests
  // @override
  // Future<Either<Failure, ReceivedRequestsSuccessResponce>>
  //     getAllReceivedTaskRequests() {
  //   throw UnimplementedError();
  // }
}
