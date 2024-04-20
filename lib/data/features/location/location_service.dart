import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/repository/feature/location.dart';
import 'package:dartz/dartz.dart';

class LocationService implements LocationRepo {
  @override
  Future<Either<Failure, String>> getLoation() {
    // TODO: implement getLoation
    throw UnimplementedError();
  }
}
