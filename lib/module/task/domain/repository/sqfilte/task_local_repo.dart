import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/assigned_to_detail.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/attachment.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/get_task_responce.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/sub_task.dart';
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
      addTaskFullDetailsToLocalStorageIfNotPresentInStorage({
    required GetTaskResponce taskModel,
  });

  Future<Either<Failure, SuccessResponseModel>>
      addTaskAttachmentsToLocalStorageIfNotPresentInStorage(
          {required List<Attachment> attachments, required int referenceId});

  Future<Either<Failure, SuccessResponseModel>>
      addTaskSubtasksToLocalStorageIfNotPresentInStorage(
          {required List<SubTask> subtasks, required int referenceId});

  Future<Either<Failure, SuccessResponseModel>>
      addTaskAssignedToDetailsToLocalStorageIfNotPresentInStorage(
          {required List<AssignedToDetail> assignedToDetails,
          required int referenceId});

  Future<Either<Failure, SuccessResponseModel>>
      updateTaskFullDetailsFromLocalStorage(
          {required GetTaskResponce taskModel});

  Future<Either<Failure, GetTaskResponce>> getTaskFullDetailsFromLocalStorage(
      {required String taskId});
}
