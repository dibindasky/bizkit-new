import 'dart:developer';

import 'package:bizkit/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/pagination_query/pagination_query.dart';
import 'package:bizkit/module/task/domain/model/errors/error_model/error_model.dart';
import 'package:bizkit/module/task/domain/model/folders/edit_task_responce/edit_task_responce.dart';
import 'package:bizkit/module/task/domain/model/folders/remove_user_from_assigned_model/remove_user_from_assigned_model.dart';
import 'package:bizkit/module/task/domain/model/quick_task/complete_quick_task/complete_quick_task.dart';
import 'package:bizkit/module/task/domain/model/quick_task/create_quick_task/create_quick_task.dart';
import 'package:bizkit/module/task/domain/model/quick_task/create_quick_task_responce/create_quick_task_responce.dart';
import 'package:bizkit/module/task/domain/model/quick_task/quick_task_accept_or_reject/quick_task_accept_or_reject.dart';
import 'package:bizkit/module/task/domain/model/quick_task/quick_tasks_responce/quick_tasks_responce.dart';
import 'package:bizkit/module/task/domain/model/quick_task/received_quick_task_requests/received_quick_task_requests.dart';
import 'package:bizkit/module/task/domain/model/quick_task/update_quick_task_model/update_quick_task_model.dart';
import 'package:bizkit/module/task/domain/model/requests/accept_or_reject_model/accept_or_reject_model.dart';
import 'package:bizkit/module/task/domain/model/requests/received_requests_responce/received_requests_responce.dart';
import 'package:bizkit/module/task/domain/model/requests/send_requests_responce/send_requests_responce.dart';
import 'package:bizkit/module/task/domain/model/success_responce/success_responce.dart';
import 'package:bizkit/module/task/domain/model/task/add_new_assined_users_model/add_new_assined_users_model.dart';
import 'package:bizkit/module/task/domain/model/task/all_tasks_responce/all_tasks_responce.dart';
import 'package:bizkit/module/task/domain/model/task/completed_or_killed_success_responce/completed_or_killed_success_responce.dart';
import 'package:bizkit/module/task/domain/model/task/completed_task_model/completed_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/delete_attachments_model/delete_attachments_model.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_deadline_model/filter_by_deadline_model.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_deadline_responce/filter_by_deadline_responce.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_type_model/filter_by_type_model.dart';
import 'package:bizkit/module/task/domain/model/task/filter_pinned_task_by_type_model/filter_pinned_task_by_type_model.dart';
import 'package:bizkit/module/task/domain/model/task/filter_pinned_task_by_type_success_responce/filter_pinned_task_by_type_success_responce.dart';
import 'package:bizkit/module/task/domain/model/task/get_single_task_model/get_single_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/get_task_responce.dart';
import 'package:bizkit/module/task/domain/model/task/kill_a_task_model/kill_a_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/pinned_task/pinned_a_task_model/pinned_a_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/pinned_task/pinned_tasks_responce/pinned_tasks_responce.dart';
import 'package:bizkit/module/task/domain/model/task/pinned_task/unpin_a_task_model/unpin_a_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/self_to_others_type_responce/self_to_others_type_responce.dart';
import 'package:bizkit/module/task/domain/model/task/spot_light_task/spot_light_task.dart';
import 'package:bizkit/module/task/domain/model/task/sub_task/completed_sub_task/completed_sub_task.dart';
import 'package:bizkit/module/task/domain/model/task/sub_task/completed_sub_task_success_responce/completed_sub_task_success_responce.dart';
import 'package:bizkit/module/task/domain/model/task/sub_task/delete_sub_task_model/delete_sub_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/sub_task/edit_sub_task_model/edit_sub_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/sub_task/sub_task_add_model/sub_task_add_model.dart';
import 'package:bizkit/module/task/domain/model/task/task_model/task_model.dart';
import 'package:bizkit/module/task/domain/model/task/task_search_responce/task_search_responce.dart';
import 'package:bizkit/module/task/domain/model/task/task_success_responce/task_success_responce.dart';
import 'package:bizkit/module/task/domain/model/task/tasks_count_model/task_counts_responce.dart';
import 'package:bizkit/module/task/domain/model/task/tasks_count_model/tasks_count_model.dart';
import 'package:bizkit/core/model/userSearch/user_search_model/user_search_model.dart';
import 'package:bizkit/core/model/userSearch/user_search_success_responce/user_search_success_responce.dart';
import 'package:bizkit/module/task/domain/repository/service/task_repo.dart';
import 'package:bizkit/service/api_service/api_service.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class TaskService implements TaskRepo {
  final ApiService apiService = ApiService();

  // Create new task
  @override
  Future<Either<ErrorModel, TaskSuccessResponce>> createTask(
      {required TaskModel task}) async {
    try {
      log('Create Task To Json ===> ${task.toJson()}');
      final response = await apiService.post(
        ApiEndPoints.taskTestCreateTask,
        data: task.toJson(),
      );
      log("=> Response CreateTask :");
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
      log("=> Response All Tasks : ");

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

  // Filter the task by type
  @override
  Future<Either<Failure, SelfToOthersTypeResponce>> filterByType(
      {required FilterByTypeModel filterByType}) async {
    try {
      log('filterByType TO JSON ---=====---> ${filterByType.toJson()}');
      final response = await apiService.post(
        ApiEndPoints.taskTestFilterByType,
        data: filterByType.toJson(),
      );
      log("=> Response filterByType   ");
      return Right(SelfToOthersTypeResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException filterByType $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch filterByType $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SendRequestsResponce>> getSendRequests() async {
    try {
      final response = await apiService.get(ApiEndPoints.taskTestSendRequests);
      log("=> Response Send Requests :");
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
  Future<Either<ErrorModel, SuccessResponce>> pinnedATask(
      {required PinnedATaskModel pinnedATask}) async {
    try {
      log('pin a task TO JOSN == > ${pinnedATask.toJson()}');
      final response = await apiService.patch(
        ApiEndPoints.taskTestPinnedATask,
        data: pinnedATask.toJson(),
      );
      log("=> Response pinnedATask  ");
      return Right(SuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException pinnedATask $e');
      return Left(ErrorModel(error: e.message ?? errorMessage));
    } catch (e) {
      log('catch pinnedATask $e');
      return Left(ErrorModel(error: '$e'));
    }
  }

  @override
  Future<Either<Failure, PinnedTasksResponce>> getAllPinnedTasks() async {
    try {
      final response = await apiService.get(ApiEndPoints.taskTestPinnedATask);
      log("=> Response All pinned tasks : ");
      return Right(PinnedTasksResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException getAllPinnedTasks $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch getAllPinnedTasks $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponce>> unpinATask(
      {required UnpinATaskModel unpinATask}) async {
    try {
      log('unpin a task TO JOSN == > ${unpinATask.toJson()}');
      final response = await apiService.patch(
        ApiEndPoints.taskTestPinnedATask,
        data: unpinATask.toJson(),
      );
      log("=> Response unpinATask  :");
      return Right(SuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException unpinATask $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch unpinATask $e');
      return Left(Failure(message: e.toString()));
    }
  }

  // Filter the task by the deadline
  @override
  Future<Either<Failure, FilterByDeadlineResponce>> filterByDeadline(
      {required FilterByDeadlineModel filterByDeadline}) async {
    try {
      log('filterByDeadline ToJson => ${filterByDeadline.toJson()}');
      final response = await apiService.post(
        ApiEndPoints.taskTestFilterByDeadline,
        data: filterByDeadline.toJson(),
      );

      log("=> Response filterByDeadline :  ");
      return Right(FilterByDeadlineResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException filterByDeadline $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch filterByDeadline $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, FilterPinnedTaskByTypeSuccessResponce>>
      filterPinnedTaskByType(
          {required FilterPinnedTaskByTypeModel filterPinnedTaskByType}) async {
    try {
      log('filter pinned tasks by type TO JSON  ==== > ${filterPinnedTaskByType.toJson()}');
      final response = await apiService.post(
        ApiEndPoints.taskTestFilterByType,
        data: filterPinnedTaskByType.toJson(),
      );
      log("=> Response Filter Pinned Tasks By Type :  ");
      return Right(
          FilterPinnedTaskByTypeSuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException filterPinnedTaskByType $e');

      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch filterPinnedTaskByType $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorModel, SuccessResponce>> acceptOrReject(
      {required AcceptOrRejectModel acceptOrReject}) async {
    try {
      final response = await apiService.patch(
        ApiEndPoints.taskTestAcceptOrReject,
        data: acceptOrReject.toJson(),
      );
      log("=> Response Accept or Reject  : ");
      return Right(SuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException acceptOrReject $e');
      return Left(ErrorModel(error: e.message ?? errorMessage));
    } catch (e) {
      log('catch acceptOrReject $e');
      return Left(ErrorModel(error: '$e'));
    }
  }

  @override
  Future<Either<Failure, List<UserSearchSuccessResponce>>> participantsSearch(
      {required UserSearchModel user}) async {
    try {
      log('participantsSearch TO JSON ===== > ${user.toJson()}');
      final response = await apiService.post(
        ApiEndPoints.taskTestFindUser,
        data: user.toJson(),
      );

      log("=> Response Search Participants :");

      List<UserSearchSuccessResponce> users = (response.data['data'] as List)
          .map((userData) => UserSearchSuccessResponce.fromJson(userData))
          .toList();

      return Right(users);
    } on DioException catch (e) {
      log('DioException participantsSearch $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch participantsSearch $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, GetTaskResponce>> getTask(
      {required GetSingleTaskModel singleTaskModel}) async {
    try {
      log('getTask Json => ${singleTaskModel.toJson()}');
      final response = await apiService.get(
        ApiEndPoints.taskTestEditTask,
        data: singleTaskModel.toJson(),
      );

      log("=> Response getTask : ");

      return Right(GetTaskResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException getTask $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch getTask $e');

      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TaskSearchResponce>> taskSearch(
      {required UserSearchModel taskSearchItem}) async {
    try {
      // log('taskSearch TO JSON ===== > ${taskSearchItem.toJson()}');
      final response = await apiService.post(
        ApiEndPoints.taskTestTaskSearch,
        data: taskSearchItem.toJson(),
      );
      log('=> Response taskSearch : ');
      return Right(TaskSearchResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException taskSearch $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch taskSearch $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorModel, SuccessResponce>> editTask(
      {required EditTaskModel taskModel}) async {
    try {
      log('Edit Task ToJson === >>>>>> ${taskModel.toJson()}');
      final response = await apiService.patch(
        ApiEndPoints.taskTestEditTask,
        data: taskModel.toJson(),
      );
      log("=> Response Edit Task  :");
      return Right(SuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException editTask $e');
      return Left(ErrorModel(error: e.message ?? errorMessage));
    } catch (e) {
      log('catch editTask $e');
      return Left(ErrorModel(error: '$e'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponce>> addSubTask(
      {required SubTaskAddModel newsubtask}) async {
    try {
      // log('SubTask datas  => ${newsubtask.toJson()}');

      final response = await apiService.patch(
        ApiEndPoints.taskTestSubtask,
        data: newsubtask.toJson(),
      );

      log("=> Response Add New Subtask :");

      return Right(SuccessResponce(
          message: response.data['message'], data: response.data));
    } on DioException catch (e) {
      log('DioException addSubTask $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch addSubTask $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponce>> deleteSubTask(
      {required DeleteSubTaskModel deletesubtask}) async {
    try {
      final response = await apiService.delete(
        ApiEndPoints.taskTestSubtask,
        data: deletesubtask.toJson(),
      );

      log("=> Response Delete Subtask : ");

      return Right(SuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException deleteSubTask $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch deleteSubTask $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponce>> editSubTask(
      {required EditSubTaskModel editsubtask}) async {
    try {
      final response = await apiService.put(
        ApiEndPoints.taskTestSubtask,
        data: editsubtask.toJson(),
      );

      log("=> Response Edit Subtask :");

      return Right(SuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException editSubTask $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch editSubTask $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponce>> killATask(
      {required KillATaskModel killatask}) async {
    try {
      // log('Killed Task TOJSON === > ${killatask.toJson()}');
      final response = await apiService.patch(
        ApiEndPoints.taskTestEditTask,
        data: killatask.toJson(),
      );

      log("=> Response kill A Task :");

      return Right(SuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException killATask $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch killATask $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponce>> spotLightTask(
      {required SpotLightTask spotLightTask}) async {
    try {
      // log("=> spotLightTask : ${spotLightTask.toJson()}");
      final response = await apiService.patch(
        ApiEndPoints.taskTestSpotLightTask,
        data: spotLightTask.toJson(),
      );
      log("=> spotLightTask response :");
      return Right(SuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException spotLightTask $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch spotLightTask $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TaskCountsResponce>> getTasksCountsWithDate(
      {required TasksCountModel tasksCountModel}) async {
    try {
      // log('tasksCountModel.toJson()=> ${tasksCountModel.toJson()}');
      final response = await apiService.post(
        ApiEndPoints.taskTestGetTasksCounts,
        data: tasksCountModel.toJson(),
      );

      log("=> Response get tasks counts with date :");

      return Right(TaskCountsResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException getTasksCountsWithDate $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch getTasksCountsWithDate $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TaskCountsResponce>>
      getTasksCountsWithoutDate() async {
    try {
      final response = await apiService.post(
        ApiEndPoints.taskTestGetTasksCounts,
      );

      log("=> Response get tasks counts without date : ");

      return Right(TaskCountsResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException getTasksCountsWithoutDate $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch getTasksCountsWithoutDate $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ReceivedRequestsResponce>>
      getReceivedRequests() async {
    try {
      final response = await apiService.get(
        ApiEndPoints.taskTestReceivedRequests,
      );

      log("=> Response Received Requests  : ");

      return Right(ReceivedRequestsResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException getReceivedRequests $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch getReceivedRequests $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponce>> completeTask(
      {required CompletedTaskModel completedTaskModel}) async {
    try {
      final response = await apiService.patch(ApiEndPoints.taskTestEditTask,
          data: completedTaskModel.toJson());

      log("=> Response Complete Task  :");

      return Right(SuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException completeTask $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch completeTask $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponce>> addNewUserToAssginedUsers(
      {required AddNewAssinedUsersModel addNewAssginedUsersModel}) async {
    try {
      final response = await apiService.patch(
        ApiEndPoints.taskTestEditTask,
        data: addNewAssginedUsersModel.toJson(),
      );

      log("=> Response Add new user to assgined users  :");

      return Right(SuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException addNewUserToAssginedUsers $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch addNewUserToAssginedUsers $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponce>> removeUserFromAssginedUsers(
      {required RemoveUserFromAssignedModel
          removeUserFromAssignedModel}) async {
    try {
      final response = await apiService.patch(
        ApiEndPoints.taskTestEditTask,
        data: removeUserFromAssignedModel.toJson(),
      );

      log("=> Response Remove user from assgined uers  :");

      return Right(SuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException removeUserFromAssginedUsers $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch removeUserFromAssginedUsers $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CompletedOrKilledSuccessResponce>>
      getAllCompletedTasks() async {
    try {
      final response = await apiService.get(
        ApiEndPoints.taskTestCompletedTasks,
      );

      log("=> Response Get All Completed Taks  :");

      return Right(CompletedOrKilledSuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException getAllCompletedTasks $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch getAllCompletedTasks $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CompletedOrKilledSuccessResponce>>
      getAllKilledTasks() async {
    try {
      final response = await apiService.get(
        ApiEndPoints.taskTestKilledTasks,
      );

      log("=> Response Get All Killed Taks  :");

      return Right(CompletedOrKilledSuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException getAllKilledTasks $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch getAllKilledTasks $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CompletedSubTaskSuccessResponce>> completedSubTask(
      {required CompletedSubTask completedSubTask}) async {
    try {
      log('completedSubTask TO JSON == >${completedSubTask.toJson()} ');
      final response = await apiService.put(
        ApiEndPoints.taskTestSubtask,
        data: completedSubTask.toJson(),
      );

      log("=> Response Completed Subtask  : ");

      return Right(CompletedSubTaskSuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException completedSubTask $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch completedSubTask $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponce>> restoreATask(
      {required KillATaskModel restoreTask}) async {
    try {
      final response = await apiService.post(
        ApiEndPoints.taskTestRestoreTask,
        data: restoreTask.toJson(),
      );

      log("=> Response restore A Task :");

      return Right(SuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException restoreATask $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch restoreATask $e');
      return Left(Failure(message: e.toString()));
    }
  }

  // Get task total time and expense
  @override
  Future<Either<Failure, Map<String, dynamic>>> getTaskTotalTimeAndExpense(
      {required GetSingleTaskModel taskId}) async {
    try {
      // log('Task id for getTaskTotalTimeAndExpense TOJSON -= > ${taskId.toJson()} ');
      final response = await apiService.get(
        ApiEndPoints.taskTestGetTaskTotalTimeAndExpense,
        data: taskId.toJson(),
      );
      log("=> Response getTaskTotalTimeAndExpense : ");

      return Right(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      log('DioException getTaskTotalTimeAndExpense $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch getTaskTotalTimeAndExpense $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponce>> completeQuickTasks(
      {required CompleteQuickTask completeQuickTask}) async {
    try {
      log('Task id for completeQuickTasks TOJSON -= > ${completeQuickTask.toJson()} ');
      final response = await apiService.patch(
        ApiEndPoints.quickTask,
        data: completeQuickTask.toJson(),
      );
      log("=> Response completeQuickTasks ");

      return Right(SuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException completeQuickTasks $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch completeQuickTasks $e');
      return Left(Failure(message: e.toString()));
    }
  }

  /// Create new quick task
  @override
  Future<Either<Failure, CreateQuickTaskResponce>> createQuickTask(
      {required CreateQuickTask createQuickTask}) async {
    try {
      log('Create Quick Task  TO JSON  ==== > ${createQuickTask.toJson()}');
      final response = await apiService.post(
        ApiEndPoints.quickTask,
        data: createQuickTask.toJson(),
      );
      log("=> Response createQuickTask ");

      return Right(CreateQuickTaskResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException createQuickTask $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch createQuickTask $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, QuickTasksResponce>> getQuickTasks(
      {required PaginationQuery paginationQuery}) async {
    try {
      log('getQuickTasks TO JSON  ==> ${paginationQuery.toJson()}');
      final response = await apiService.get(
        ApiEndPoints.quickTask,
        queryParameters: paginationQuery.toJson(),
      );
      log("=> Response getQuickTasks ");

      return Right(QuickTasksResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException getQuickTasks $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch getQuickTasks $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponce>> updateQuickTasks(
      {required UpdateQuickTaskModel updateQuickTask}) async {
    try {
      log('To json  ==> ${updateQuickTask.toJson()}');
      final response = await apiService.patch(
        ApiEndPoints.quickTask,
        data: updateQuickTask.toJson(),
      );
      log("=> Response updateQuickTasks ");

      return Right(SuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException updateQuickTasks $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch updateQuickTasks $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ReceivedQuickTaskRequests>>
      getQuickTasksRequests() async {
    try {
      final response = await apiService.get(
        ApiEndPoints.quickTasksRequests,
      );
      log("=> Response getQuickTasksRequests ");

      return Right(ReceivedQuickTaskRequests.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException getQuickTasksRequests $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch getQuickTasksRequests $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponce>> deleteAttachments(
      {required DeleteAttachmentsModel deleteAttachmentsModel}) async {
    try {
      await apiService.delete(
        ApiEndPoints.deleteAttachments,
        data: deleteAttachmentsModel.toJson(),
      );

      return Right(SuccessResponce(data: 'successully deleted'));
    } on DioException catch (e) {
      log("dio exception of delete attachment ${e.toString()}");
      return Left(Failure(data: e.toString()));
    } catch (e) {
      log(" catch error of delete attachment ${e.toString()}");
      return Left(Failure(data: e.toString()));
    }
  }

  @override
  Future<Either<Failure, QuickTasksResponce>> getCompletedQuickTasks(
      {required PaginationQuery paginationQuery}) async {
    try {
      log('getCompletedQuickTaskss TO JSON  ==> ${paginationQuery.toJson()}');
      final response = await apiService.get(
        ApiEndPoints.quickTask,
        queryParameters: paginationQuery.toJson(),
      );
      log("=> Response getCompletedQuickTasks ");

      return Right(QuickTasksResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException getCompletedQuickTasks $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch getCompletedQuickTasks $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponce>> acceptQuickTask(
      {required QuickTaskAcceptOrReject acceptOrRejct}) async {
    try {
      log('acceptQuickTask TO JSON  ==> ${acceptOrRejct.toJson()}');
      final response = await apiService.patch(
        ApiEndPoints.quickTasksRequests,
        data: acceptOrRejct.toJson(),
      );
      log("=> Response acceptQuickTask ");

      return Right(SuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException acceptQuickTask $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch acceptQuickTask $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponce>> rejectQuickTask(
      {required QuickTaskAcceptOrReject acceptOrRejct}) async {
    try {
      log('rejectQuickTask TO JSON  ==> ${acceptOrRejct.toJson()}');
      final response = await apiService.patch(
        ApiEndPoints.quickTasksRequests,
        data: acceptOrRejct.toJson(),
      );
      log("=> Response rejectQuickTask ");

      return Right(SuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException rejectQuickTask $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch rejectQuickTask $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorModel, SuccessResponce>> createNewNextActionDate(
      {required EditTaskModel createNewNextActionDateModel}) async {
    try {
      log('createNewNextActionDate ToJson === >>>>>> ${createNewNextActionDateModel.toJson()}');
      final response = await apiService.patch(
        ApiEndPoints.taskTestEditTask,
        data: createNewNextActionDateModel.toJson(),
      );
      log("=> Response createNewNextActionDate  :");
      return Right(SuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException createNewNextActionDate $e');
      return Left(ErrorModel(error: e.message ?? errorMessage));
    } catch (e) {
      log('catch createNewNextActionDate $e');
      return Left(ErrorModel(error: '$e'));
    }
  }

  @override
  Future<Either<ErrorModel, SuccessResponce>> updateNextActionDate(
      {required EditTaskModel updateNextActionDateModel}) async {
    try {
      log('updateNextActionDate ToJson === >>>>>> ${updateNextActionDateModel.toJson()}');
      final response = await apiService.patch(
        ApiEndPoints.taskTestEditTask,
        data: updateNextActionDateModel.toJson(),
      );
      log("=> Response updateNextActionDate  :");
      return Right(SuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException updateNextActionDate $e');
      return Left(ErrorModel(error: e.message ?? errorMessage));
    } catch (e) {
      log('catch updateNextActionDate $e');
      return Left(ErrorModel(error: '$e'));
    }
  }
}
