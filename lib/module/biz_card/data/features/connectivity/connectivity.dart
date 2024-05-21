import 'dart:async';
import 'dart:developer';

import 'package:bizkit/core/model/failure/failure.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';

@override
Future<Either<Failure, Connectivity>> connecionChecking() async {
  try {
    final Connectivity connectivity = Connectivity();
    late StreamSubscription connectivityStreamSubscription;

    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        // if internet is connected
      } else {
        // if mobile is not connected to mobile data or wifi then emit no internet
      }
    });

    // You need to return a value here
    return Right(
        connectivity); // Or you can return a Left(Failure(...)) if needed
  } catch (e) {
    log('Connectivity checking error $e');
    return left(Failure(message: 'ConnectionCkecking Error'));
  }
}
