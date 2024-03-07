part of 'reminder_bloc.dart';

@freezed
class ReminderState with _$ReminderState {
  const factory ReminderState({
    required bool isLoading,
    required bool isPageLoading,
    required bool hasError,
    required bool allReminderLoading,
    required bool reminderAdded,
    required bool historyLoading,
    required bool upcomingReminderLoading,
    List<Reminders>? allReminderList,
    List<Reminders>? historyReminderList,
    List<Reminders>? upcomingRminderList,
    List<Reminders>? toDaysRminderList,
    String? message,
  }) = _Initial;
  factory ReminderState.initial() => const ReminderState(
      allReminderLoading: false,
      reminderAdded: false,
      historyLoading: false,
      upcomingReminderLoading: false,
      hasError: false,
      isLoading: false,
      isPageLoading: false);
}
