part of 'notification_bloc.dart';

@freezed
class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.getNotification() = GetNotification;
  const factory NotificationEvent.getNotificationEvent() = GetNotificationEvent;
    const factory NotificationEvent.clear() = Clear;

}
