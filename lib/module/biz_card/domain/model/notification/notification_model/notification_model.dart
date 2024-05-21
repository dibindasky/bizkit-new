import 'package:json_annotation/json_annotation.dart';

import 'notification.dart';

part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel {
  int? count;
  dynamic next;
  dynamic previous;
  @JsonKey(name: 'results')
  List<Notification>? notification;

  NotificationModel({this.count, this.next, this.previous, this.notification});

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return _$NotificationModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}
