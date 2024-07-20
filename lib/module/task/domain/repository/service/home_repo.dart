import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/module/task/domain/model/dashboard/genearate_task_report_success_responce/genearate_task_report_success_responce.dart';
import 'package:bizkit/module/task/domain/model/dashboard/generate_task_report_model/generate_task_report_model.dart';
import 'package:bizkit/module/task/domain/model/dashboard/progres_bar_success_responce/progres_bar_success_responce.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, ProgresBarSuccessResponce>> progresBar();

  Future<Either<Failure, GenearateTaskReportSuccessResponce>>
      genearateTaskReport(
          {required GenerateTaskReportModel genearteTaskReport});
}
