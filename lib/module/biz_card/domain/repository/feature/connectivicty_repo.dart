import 'package:bizkit/core/model/failure/failure.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';

abstract class ConnectionCkecking {
  Future<Either<Failure, Connectivity>> connecionChecking();
}
