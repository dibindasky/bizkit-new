import 'dart:developer';

import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/data/service/api_service.dart';
import 'package:bizkit/domain/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/notification/notification_model/notification_model.dart';
import 'package:bizkit/domain/repository/service/notification.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: NotificationRepo)
@injectable
class NotificationService implements NotificationRepo {
  final ApiService _apiService;
  NotificationService(this._apiService);

  @override
  Future<Either<Failure, NotificationModel>> getNotification() async {
    try {
      final responce = await _apiService.get(
        ApiEndPoints.notification,
      );
      return Right(NotificationModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('resetPassword DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
    } catch (e) {
      log('resetPassword catch $e');
      return Left(Failure(message: errorMessage));
    }
  }
}
