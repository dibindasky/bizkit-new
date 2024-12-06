import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/pagination_query/pagination_query.dart';
import 'package:bizkit/module/task/domain/model/errors/error_model/error_model.dart';
import 'package:bizkit/module/task/domain/model/folders/edit_task_responce/edit_task_responce.dart';
import 'package:bizkit/module/task/domain/model/folders/remove_user_from_assigned_model/remove_user_from_assigned_model.dart';
import 'package:bizkit/module/task/domain/model/quick_task/complete_quick_task/complete_quick_task.dart';
import 'package:bizkit/module/task/domain/model/quick_task/create_quick_task/create_quick_task.dart';
import 'package:bizkit/module/task/domain/model/quick_task/create_quick_task_responce/create_quick_task_responce.dart';
import 'package:bizkit/module/task/domain/model/quick_task/quick_tasks_responce/quick_tasks_responce.dart';
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
import 'package:dartz/dartz.dart';

abstract class TaskRepo {
  Future<Either<ErrorModel, TaskSuccessResponce>> createTask({
    required TaskModel task,
  });

  Future<Either<Failure, AllTasksResponce>> getAllTasks();

  Future<Either<Failure, SelfToOthersTypeResponce>> filterByType({
    required FilterByTypeModel filterByType,
  });

  Future<Either<Failure, SendRequestsResponce>> getSendRequests();

  Future<Either<Failure, ReceivedRequestsResponce>> getReceivedRequests();

  Future<Either<Failure, FilterByDeadlineResponce>> filterByDeadline({
    required FilterByDeadlineModel filterByDeadline,
  });

  Future<Either<ErrorModel, SuccessResponce>> pinnedATask(
      {required PinnedATaskModel pinnedATask});

  Future<Either<Failure, PinnedTasksResponce>> getAllPinnedTasks();

  Future<Either<Failure, SuccessResponce>> unpinATask({
    required UnpinATaskModel unpinATask,
  });

  Future<Either<Failure, FilterPinnedTaskByTypeSuccessResponce>>
      filterPinnedTaskByType({
    required FilterPinnedTaskByTypeModel filterPinnedTaskByType,
  });

  Future<Either<ErrorModel, SuccessResponce>> acceptOrReject(
      {required AcceptOrRejectModel acceptOrReject});

  Future<Either<Failure, List<UserSearchSuccessResponce>>> participantsSearch({
    required UserSearchModel user,
  });

  Future<Either<Failure, GetTaskResponce>> getTask(
      {required GetSingleTaskModel singleTaskModel});

  Future<Either<Failure, TaskSearchResponce>> taskSearch({
    required UserSearchModel taskSearchItem,
  });

  Future<Either<ErrorModel, SuccessResponce>> editTask(
      {required EditTaskModel taskModel});

  Future<Either<Failure, SuccessResponce>> completeTask(
      {required CompletedTaskModel completedTaskModel});

  Future<Either<Failure, SuccessResponce>> addSubTask(
      {required SubTaskAddModel newsubtask});

  Future<Either<Failure, SuccessResponce>> editSubTask(
      {required EditSubTaskModel editsubtask});

  Future<Either<Failure, SuccessResponce>> deleteSubTask(
      {required DeleteSubTaskModel deletesubtask});

  Future<Either<Failure, SuccessResponce>> killATask(
      {required KillATaskModel killatask});

  Future<Either<Failure, SuccessResponce>> restoreATask(
      {required KillATaskModel restoreTask});

  Future<Either<Failure, SuccessResponce>> spotLightTask(
      {required SpotLightTask spotLightTask});

  Future<Either<Failure, TaskCountsResponce>> getTasksCountsWithoutDate();

  Future<Either<Failure, TaskCountsResponce>> getTasksCountsWithDate(
      {required TasksCountModel tasksCountModel});

  Future<Either<Failure, SuccessResponce>> addNewUserToAssginedUsers(
      {required AddNewAssinedUsersModel addNewAssginedUsersModel});

  Future<Either<Failure, SuccessResponce>> removeUserFromAssginedUsers(
      {required RemoveUserFromAssignedModel removeUserFromAssignedModel});

  Future<Either<Failure, CompletedOrKilledSuccessResponce>>
      getAllCompletedTasks();

  Future<Either<Failure, CompletedOrKilledSuccessResponce>> getAllKilledTasks();

  Future<Either<Failure, CompletedSubTaskSuccessResponce>> completedSubTask(
      {required CompletedSubTask completedSubTask});

  Future<Either<Failure, Map<String, dynamic>>> getTaskTotalTimeAndExpense(
      {required GetSingleTaskModel taskId});

  Future<Either<Failure, CreateQuickTaskResponce>> createQuickTask(
      {required CreateQuickTask createQuickTask});

  Future<Either<Failure, QuickTasksResponce>> getQuickTasks(
      {required PaginationQuery paginationQuery});

  Future<Either<Failure, QuickTasksResponce>> getCompletedQuickTasks(
      {required PaginationQuery paginationQuery});

  Future<Either<Failure, SuccessResponce>> updateQuickTasks(
      {required UpdateQuickTaskModel updateQuickTask});

  Future<Either<Failure, SuccessResponce>> completeQuickTasks(
      {required CompleteQuickTask completeQuickTask});

  Future<Either<Failure, SuccessResponce>> deleteAttachments(
      {required DeleteAttachmentsModel deleteAttachmentsModel});

  Future<Either<ErrorModel, SuccessResponce>> createNewNextActionDate(
      {required EditTaskModel createNewNextActionDateModel});

  Future<Either<ErrorModel, SuccessResponce>> updateNextActionDate(
      {required EditTaskModel updateNextActionDateModel});
}
