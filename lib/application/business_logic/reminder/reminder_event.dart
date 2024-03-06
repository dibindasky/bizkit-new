part of 'reminder_bloc.dart';

@freezed
class ReminderEvent with _$ReminderEvent {
  const factory ReminderEvent.createReminder(
      {required CreateReminderModel createReminderModel}) = CreateReminder;
  const factory ReminderEvent.editReminder(
      {required CreateReminderModel createReminderModel}) = EditReminder;
}
