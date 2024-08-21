import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/module/task/domain/model/dashboard/genearate_report_model/genearate_report_model.dart';
import 'package:bizkit/module/task/domain/model/dashboard/genearate_task_report_success_responce/genearate_task_report_success_responce.dart';
import 'package:bizkit/module/task/domain/model/dashboard/get_recent_tasks_responce/get_recent_tasks_responce.dart';
import 'package:bizkit/module/task/domain/model/dashboard/get_report_model/get_report_model.dart';
import 'package:bizkit/module/task/domain/model/dashboard/get_report_success_responce/get_report_success_responce.dart';

import 'package:bizkit/module/task/domain/model/dashboard/progres_bar_success_responce/progres_bar_success_responce.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, ProgresBarSuccessResponce>> progresBar();

  Future<Either<Failure, GetReportSuccessResponce>> getReport(
      {required GetReportModel getReportModel});

  Future<Either<Failure, GenearateTaskReportSuccessResponce>> generateReport(
      {required GenearateReportModel generateReportModel});

  Future<Either<Failure, GetRecentTasksResponce>> getRecentTasks();
}
