import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/task/domain/model/hierarchy/employee_tasks_based_on_type/employee_tasks_based_on_type.dart';
import 'package:bizkit/module/task/domain/model/hierarchy/employees_list_responce/employees_list_responce.dart';
import 'package:bizkit/module/task/domain/model/hierarchy/tasks_counts_model/tasks_counts_model.dart';
import 'package:bizkit/module/task/domain/model/task/get_single_task_model/get_single_task_model.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/get_task_responce.dart';
import 'package:bizkit/module/task/domain/model/task/self_to_others_type_responce/self_to_others_type_responce.dart';
import 'package:dartz/dartz.dart';

abstract class HierarchyRepo {
  Future<Either<Failure, SuccessResponseModel>> getTasksCounts(
      {required EmpolyeesTasksCountsModel tasksCountsModel});

  Future<Either<Failure, EmployeesListResponce>> getEmployeeslist();

  Future<Either<Failure, GetTaskResponce>> getTaskDetails(
      {required GetSingleTaskModel taskId});

  Future<Either<Failure, SelfToOthersTypeResponce>> filterTasksBasedOnType(
      {required EmployeeTasksBasedOnType filterTasksBasedOnType});
}
