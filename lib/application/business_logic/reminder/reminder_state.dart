part of 'reminder_bloc.dart';

@freezed
class ReminderState with _$ReminderState {
  const factory ReminderState({
    required bool isLoading,
    required bool isPageLoading,
    required bool hasError,
    String? message,
  }) = _Initial;
  factory ReminderState.initial() => const ReminderState(
      hasError: false, isLoading: false, isPageLoading: false);
}
