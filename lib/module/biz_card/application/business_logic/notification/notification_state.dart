part of 'notification_bloc.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState({
    required bool isLoading,
    required bool hasError,
    String? message,
    required bool notificationLoading,
    List<Notification>? notification,
  }) = _Initial;
  factory NotificationState.initial() => const NotificationState(
        isLoading: false,
        hasError: false,
        notificationLoading: false,
      );
}
