import 'dart:developer';

import 'package:bizkit/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/page_query/page_query.dart';
import 'package:bizkit/module/biz_card/domain/model/notification/notification_model/notification_model.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/notification.dart';
import 'package:bizkit/service/api_service/api_service.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: NotificationRepo)
@injectable
class NotificationService implements NotificationRepo {
  final ApiService _apiService;
  NotificationService(this._apiService);

  @override
  Future<Either<Failure, NotificationModel>> getNotification({
    required PageQuery pageQuery,
  }) async {
    try {
      final responce = await _apiService.get(
        ApiEndPoints.notification,
        queryParameters: pageQuery.toJson(),
      );
      log('getNotification  ${responce.data}');
      return Right(NotificationModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('getNotification DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
    } catch (e) {
      log('getNotification catch $e');
      return Left(Failure(message: errorMessage));
    }
  }
}
