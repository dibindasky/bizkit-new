part of 'reminder_bloc.dart';

@freezed
class ReminderEvent with _$ReminderEvent {
  const factory ReminderEvent.createReminder(
      {required CreateReminderModel createReminderModel}) = CreateReminder;
  const factory ReminderEvent.editReminder(
      {required CreateReminderModel createReminderModel}) = EditReminder;
  const factory ReminderEvent.getAllRemindersEvent() = GetAllRemindersEvent;
  const factory ReminderEvent.getAllRemindersEventPage() =
      GetAllRemindersEventPage;
  const factory ReminderEvent.getHistoryRemindersEvent() =
      GetHistoryRemindersEvent;
  const factory ReminderEvent.getHistoryRemindersEventPage() =
      GetHistoryRemindersEventPage;
  const factory ReminderEvent.getUpcomingRemindersEvent() =
      GetUpcomingRemindersEvent;
  const factory ReminderEvent.getUpcomingRemindersEventPage() =
      GetUpcomingRemindersEventPage;
  const factory ReminderEvent.getTodaysRemindersEvent() =
      GetTodaysRemindersEvent;
  const factory ReminderEvent.getReminderDetails({required int id}) =
      GetReminderDetails;
  const factory ReminderEvent.getCardReminder(
      {required CardIdModel cardIdModel}) = GetCardReminder;
  const factory ReminderEvent.getCardReminderNext(
      {required CardIdModel cardIdModel}) = GetCardReminderNext;
}
