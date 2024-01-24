import 'dart:developer';

import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/repository/connectivity.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';

class ConnectionDateResources implements ConnectionCkecking {
  @override
  Future<Either<Failure, Connectivity>> connecionChecking() {
    try {
      final Connectivity connectivity;
    } catch (e) {
      log('Connectivity checking error $e');
      Right(Failure(message: 'ConnectionCkecking Error'));
    }
  }
}
