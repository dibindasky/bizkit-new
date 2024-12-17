import 'dart:developer';

import 'package:bizkit/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/task/domain/model/hierarchy/employee_tasks_based_on_type/employee_tasks_based_on_type.dart';
import 'package:bizkit/module/task/domain/model/hierarchy/employees_list_responce/employees_list_responce.dart';
import 'package:bizkit/module/task/domain/model/hierarchy/tasks_counts_model/tasks_counts_model.dart';
import 'package:bizkit/module/task/domain/model/task/get_single_task_model/get_single_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/get_task_responce.dart';
import 'package:bizkit/module/task/domain/model/task/self_to_others_type_responce/self_to_others_type_responce.dart';
import 'package:bizkit/module/task/domain/repository/service/hierarchy_repo.dart';
import 'package:bizkit/service/api_service/api_service.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HierarchyService implements HierarchyRepo {
  final ApiService apiService = ApiService();

  @override
  Future<Either<Failure, SelfToOthersTypeResponce>> filterTasksBasedOnType(
      {required EmployeeTasksBasedOnType filterTasksBasedOnType}) async {
    try {
      log('filterTasksBasedOnType TO JSON == ${filterTasksBasedOnType.toJson()}');
      final response = await apiService.get(
        ApiEndPoints.taskHierarchy,
        data: filterTasksBasedOnType.toJson(),
      );
      log("=> Response filterTasksBasedOnType : ");
      return Right(SelfToOthersTypeResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException filterTasksBasedOnType $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch filterTasksBasedOnType $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, EmployeesListResponce>> getEmployeeslist() async {
    try {
      final response = await apiService.get(
        ApiEndPoints.taskHierarchy,
      );
      log("=> Response getEmployeeslist :  ");
      return Right(EmployeesListResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException getEmployeeslist $e');
      if (e.response?.statusCode == 403) {
        return Left(Failure(
            message: ((e.response?.data as Map<String, dynamic>?)?['error']
                    as String?) ??
                errorMessage,
            data: 403));
      }
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch getEmployeeslist $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, GetTaskResponce>> getTaskDetails(
      {required GetSingleTaskModel taskId}) async {
    try {
      log('getTaskDetails TO JSON == ${taskId.toJson()}');
      final response = await apiService.get(
        ApiEndPoints.taskHierarchy,
        data: taskId.toJson(),
      );
      log("=> Response getTaskDetails : ");
      return Right(GetTaskResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException getTaskDetails $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch getTaskDetails $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> getTasksCounts(
      {required EmpolyeesTasksCountsModel tasksCountsModel}) async {
    try {
      log('getTasksCounts TO JSON == ${tasksCountsModel.toJson()}');
      final response = await apiService.post(
        ApiEndPoints.taskHierarchy,
        data: tasksCountsModel.toJson(),
      );

      final data = response.data as Map<String, dynamic>?;
      log("=> Response getTasksCounts :");
      return Right(SuccessResponseModel(
          data: data?['results'] as Map<String, dynamic>?));
    } on DioException catch (e) {
      log('DioException getTasksCounts $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch getTasksCounts $e');
      return Left(Failure(message: e.toString()));
    }
  }
}
