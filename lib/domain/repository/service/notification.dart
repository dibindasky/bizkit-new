import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/notification/notification_model/notification_model.dart';
import 'package:dartz/dartz.dart';

abstract class NotificationRepo {
  Future<Either<Failure, NotificationModel>> getNotification();
}
