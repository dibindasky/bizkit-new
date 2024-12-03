import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/module/module_manager/domain/model/macho_meter_model/macho_meter_model.dart';
import 'package:bizkit/module/task/domain/model/success_responce/success_responce.dart';
import 'package:dartz/dartz.dart';

abstract class MatchoMeterRepo {
  Future<Either<Failure, List<MachoMeterModel>>> getUserMatchoMeterDatas();
  Future<Either<Failure, List<MachoMeterModel>>> getSuperAdminDatas();
  Future<Either<Failure, SuccessResponce>> addAnswerForQuestion(
      {required List<MachoMeterModel> machoMeterModel});
  Future<Either<Failure, SuccessResponce>> editAnswerForQuestion(
      {required MachoMeterModel machoMeterModel});
}
