import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/biz_card/domain/model/profile/matchometer/all_matcho_meters/all_matcho_meters.dart';
import 'package:bizkit/module/biz_card/domain/model/profile/matchometer/matcho_meter_model/matcho_meter_model.dart';
import 'package:bizkit/module/biz_card/domain/model/profile/matchometer/update_matcho_meter/update_matcho_meter.dart';
import 'package:dartz/dartz.dart';

abstract class MatchoMeterRepo {
  Future<Either<Failure, SuccessResponseModel>> addMatchoMeter(
      {required List<MatchoMeterModel> matchoMeter});
  Future<Either<Failure, SuccessResponseModel>> updateMatchoMeter(
      {required UpdateMatchoMeter updateMatchoModel});
  Future<Either<Failure, AllMatchoMeters>> getAllMatchoMeter();
}
