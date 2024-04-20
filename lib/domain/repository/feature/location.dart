import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:dartz/dartz.dart';

abstract class LocationRepo {
  Future<Either<Failure, String>> getLoation();
}
