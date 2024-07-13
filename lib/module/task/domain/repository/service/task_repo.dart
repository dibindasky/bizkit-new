import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/module/task/domain/model/errors/error_model/error_model.dart';
import 'package:bizkit/module/task/domain/model/requests/accept_or_reject_model/accept_or_reject_model.dart';
import 'package:bizkit/module/task/domain/model/requests/received_requests_responce/received_requests_responce.dart';
import 'package:bizkit/module/task/domain/model/requests/send_requests_responce/send_requests_responce.dart';
import 'package:bizkit/module/task/domain/model/success_responce/success_responce.dart';
import 'package:bizkit/module/task/domain/model/task/all_tasks_responce/all_tasks_responce.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_deadline_model/filter_by_deadline_model.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_deadline_responce/filter_by_deadline_responce.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_type_model/filter_by_type_model.dart';
import 'package:bizkit/module/task/domain/model/task/filter_pinned_task_by_type_model/filter_pinned_task_by_type_model.dart';
import 'package:bizkit/module/task/domain/model/task/filter_pinned_task_by_type_success_responce/filter_pinned_task_by_type_success_responce.dart';
import 'package:bizkit/module/task/domain/model/task/pinned_task/pinned_a_task_model/pinned_a_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/pinned_task/pinned_tasks_responce/pinned_tasks_responce.dart';
import 'package:bizkit/module/task/domain/model/task/pinned_task/unpin_a_task_model/unpin_a_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/self_to_others_type_responce/self_to_others_type_responce.dart';
import 'package:bizkit/module/task/domain/model/task/task_model/task_model.dart';
import 'package:bizkit/module/task/domain/model/task/task_success_responce/task_success_responce.dart';
import 'package:bizkit/module/task/domain/model/userSearch/user_search_model/user_search_model.dart';
import 'package:bizkit/module/task/domain/model/userSearch/user_search_success_responce/user_search_success_responce.dart';
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

  Future<Either<Failure, List<ReceivedRequestsResponce>>> getReceivedRequests();

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
}
