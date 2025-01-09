import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/task/domain/model/dashboard/get_recent_tasks_responce/get_recent_tasks_responce.dart';
import 'package:bizkit/module/task/domain/model/quick_task/quick_tasks_responce/assigned_to.dart';
import 'package:bizkit/module/task/domain/model/quick_task/quick_tasks_responce/quick_tasks.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/assigned_to_detail.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/attachment.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/get_task_responce.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/sub_task.dart';
import 'package:bizkit/module/task/domain/model/task/next_action_date_responce/next_action_date_responce.dart';
import 'package:dartz/dartz.dart';
import 'package:bizkit/module/task/domain/model/task/self_to_others_type_responce/task.dart'
    as task;

abstract class TaskLocalRepo {
  Future<Either<Failure, SuccessResponseModel>> addRecentTaskToLocalStorage({
    required String recentTaskId,
    required String recentTaskType,
  });

  Future<Either<Failure, SuccessResponseModel>>
      deleteRecentTaskFromLocalStorage();

  Future<Either<Failure, GetRecentTasksResponce>>
      getRecentsTasksFromLocalStorage();

  Future<Either<Failure, SuccessResponseModel>> addTaskToLocalStorage(
      {required task.Task taskModel});

  Future<Either<Failure, SuccessResponseModel>> updateTaskFromLocalStorage(
      {required task.Task taskModel});

  Future<Either<Failure, SuccessResponseModel>>
      addTaskToLocalStorageIfNotPresentInStorage(
          {required task.Task taskModel});

  Future<Either<Failure, List<task.Task>>> getTasksFromLocalStorage({
    required String filterByDeadline,
    required int page,
    required int pageSize,
  });

  Future<Either<Failure, SuccessResponseModel>> addTaskFulDetailsToLocalStorage(
      {required GetTaskResponce taskModel});

  Future<Either<Failure, SuccessResponseModel>>
      addTaskFullDetailsToLocalStorageIfNotPresentInStorage({
    required GetTaskResponce taskModel,
  });

  Future<Either<Failure, SuccessResponseModel>>
      addTaskAttachmentsToLocalStorageIfNotPresentInStorage({
    required List<Attachment> attachments,
    required int referenceId,
    required String taskId,
    required String currentUserId,
  });

  Future<Either<Failure, SuccessResponseModel>>
      addTaskNextActionDatesToLocalStorage({
    required List<NextActionDateResponce> nextActionDates,
    required String taskId,
    required String currentUserId,
  });

  Future<Either<Failure, SuccessResponseModel>>
      addTaskSubtasksToLocalStorageIfNotPresentInStorage({
    required List<SubTask> subtasks,
    required int referenceId,
    required String taskId,
    required String currentUserId,
  });

  Future<Either<Failure, SuccessResponseModel>>
      addTaskAssignedToDetailsToLocalStorageIfNotPresentInStorage({
    required List<AssignedToDetail> assignedToDetails,
    required String taskId,
    required int referenceId,
    required String currentUserId,
  });

  Future<Either<Failure, SuccessResponseModel>>
      updateTaskFullDetailsFromLocalStorage(
          {required GetTaskResponce taskModel});

  Future<Either<Failure, GetTaskResponce>> getTaskFullDetailsFromLocalStorage(
      {required String taskId});

  Future<Either<Failure, SuccessResponseModel>> addQuickTaskToLocalStorage(
      {required QuickTasks quickTask});

  Future<Either<Failure, SuccessResponseModel>> updateQuickTaskFromLocalStorage(
      {required QuickTasks quickTask});

  Future<Either<Failure, SuccessResponseModel>> addQuickTaskToLocalIfNotExists(
      {required QuickTasks quickTask});

  Future<Either<Failure, SuccessResponseModel>>
      addQuickTaskAssignedToDetailsToLocalIfNotExists({
    required List<QuickTaskAssignedToResponce> assignedToDetails,
    required int referenceId,
    required String quickTaskId,
    required String currentUserId,
  });

  Future<Either<Failure, List<QuickTasks>>> getQuickTaskList(
      {required bool isCompleted});

  // Future<Either<Failure, List<QuickTasks>>> getQuickTasksFromLocalStorage({
  //   required int page,
  //   required int pageSize,
  //   bool completedTasks = false,
  // });
}
