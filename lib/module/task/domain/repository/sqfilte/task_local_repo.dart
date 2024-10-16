import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/get_task_responce.dart';
import 'package:dartz/dartz.dart';
import 'package:bizkit/module/task/domain/model/task/self_to_others_type_responce/task.dart'
    as task;

abstract class TaskLocalRepo {
  Future<Either<Failure, SuccessResponseModel>> addTaskToLocalStorage(
      {required task.Task taskModel});

  Future<Either<Failure, SuccessResponseModel>> updateTaskFromLocalStorage(
      {required task.Task taskModel});

  Future<Either<Failure, SuccessResponseModel>>
      addTaskToLocalStorageIfNotPresentInStorage(
          {required task.Task taskModel});

  Future<Either<Failure, SuccessResponseModel>> addTaskFulDetailsToLocalStorage(
      {required GetTaskResponce taskModel});

  Future<Either<Failure, SuccessResponseModel>>
      addTaskFullDetailsToLocalStorageIfNotPresentInStorage(
          {required GetTaskResponce taskModel});

  Future<Either<Failure, SuccessResponseModel>>
      updateTaskFullDetailsFromLocalStorage(
          {required GetTaskResponce taskModel});

  Future<Either<Failure, GetTaskResponce>> getTaskFullDetailsFromLocalStorage(
      {required String taskId});
}
