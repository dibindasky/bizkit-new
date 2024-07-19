import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/module/task/domain/model/dashboard/progres_bar_success_responce/progres_bar_success_responce.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, ProgresBarSuccessResponce>> progresBar();
}
