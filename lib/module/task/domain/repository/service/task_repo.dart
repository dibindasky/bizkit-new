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
import 'package:bizkit/module/task/domain/model/task/pinned_task/pinned_a_task_model/pinned_a_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/pinned_task/pinned_tasks_responce/pinned_tasks_responce.dart';
import 'package:bizkit/module/task/domain/model/task/pinned_task/unpin_a_task_model/unpin_a_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/task_model/task_model.dart';
import 'package:bizkit/module/task/domain/model/task/task_success_responce/task_success_responce.dart';
import 'package:dartz/dartz.dart';

abstract class TaskRepo {
  Future<Either<ErrorModel, TaskSuccessResponce>> createTask({
    required TaskModel task,
  });

  Future<Either<Failure, AllTasksResponce>> getAllTasks();

  Future<Either<Failure, AllAssignedTasksResponce>> getAllAssignedTasks();

  Future<Either<Failure, FilterByTypeSuccessResponce>> filterByType({
    required FilterByTypeModel filterByType,
  });

  Future<Either<Failure, SendRequestsResponce>> getSendRequests();

  Future<Either<Failure, List<ReceivedRequestsResponce>>> getReceivedRequests();

  Future<Either<Failure, FilterByDeadlineSuccessResponce>> filterByDeadline({
    required FilterByDeadlineModel filterByDeadline,
  });

  Future<Either<ErrorModel, SuccessResponce>> pinnedATask(
      {required PinnedATaskModel pinnedATask});

  Future<Either<Failure, PinnedTasksResponce>> getAllPinnedTasks();

  Future<Either<Failure, SuccessResponce>> unpinATask({
    required UnpinATaskModel unpinATask,
  });

  // Future<Either<ErrorModel, SuccessResponce>> editTask({
  //   required EditTaskModel editTask,
  // });

  // Future<Either<Failure, ReceivedRequestsSuccessResponce>>
  //     getAllReceivedTaskRequests();
}
