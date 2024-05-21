import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/page_query/page_query.dart';
import 'package:bizkit/module/biz_card/domain/model/notification/notification_model/notification_model.dart';
import 'package:dartz/dartz.dart';

abstract class NotificationRepo {
  Future<Either<Failure, NotificationModel>> getNotification({
    required PageQuery pageQuery,
  });
}
