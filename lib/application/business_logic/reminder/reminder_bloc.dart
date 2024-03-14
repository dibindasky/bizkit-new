import 'dart:async';
import 'package:bizkit/domain/model/commen/page_query/page_query.dart';
import 'package:bizkit/domain/model/reminders/create_reminder_model/create_reminder_model.dart';
import 'package:bizkit/domain/model/reminders/get_reminder_model/reminders.dart';
import 'package:bizkit/domain/repository/service/reminder_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'reminder_event.dart';
part 'reminder_state.dart';
part 'reminder_bloc.freezed.dart';

@injectable
class ReminderBloc extends Bloc<ReminderEvent, ReminderState> {
  final ReminderRepo reminderRepo;
  int getAllPage = 1, getUpcoming = 1, getHistory = 1;
  final TextEditingController labelController = TextEditingController();
  final TextEditingController venueController = TextEditingController();
  final TextEditingController occationController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  ReminderBloc(this.reminderRepo) : super(ReminderState.initial()) {
    on<CreateReminder>(createReminder);
    on<EditReminder>(editReminder);
    on<GetAllRemindersEvent>(getAllRemindersEvent);
    on<GetHistoryRemindersEvent>(getHistoryRemindersEvent);
    on<GetUpcomingRemindersEvent>(getUpcomingRemindersEvent);
    on<GetAllRemindersEventPage>(getAllRemindersEvenPaget);
    on<GetHistoryRemindersEventPage>(getHistoryRemindersEventPage);
    on<GetUpcomingRemindersEventPage>(getUpcomingRemindersEventPage);
    on<GetTodaysRemindersEvent>(getTodaysRemindersEvent);
  }

  FutureOr<void> editReminder(EditReminder event, emit) async {
    emit(state.copyWith(isLoading: true, hasError: false));
    final result = await reminderRepo.editReminder(
        createReminderModel: event.createReminderModel);
    result.fold((l) => emit(state.copyWith(isLoading: false, hasError: true)),
        (r) => emit(state.copyWith(isLoading: false, hasError: false)));
  }

  FutureOr<void> createReminder(CreateReminder event, emit) async {
    emit(
        state.copyWith(isLoading: true, hasError: false, reminderAdded: false));
    final result = await reminderRepo.createReminder(
        createReminderModel: event.createReminderModel);
    result.fold((l) => emit(state.copyWith(isLoading: false, hasError: true)),
        (r) {
      emit(state.copyWith(
          isLoading: false, hasError: false, reminderAdded: true));
      labelController.clear();
      venueController.clear();
      occationController.clear();
      messageController.clear();
      add(const ReminderEvent.getAllRemindersEvent());
    });
  }

  FutureOr<void> getAllRemindersEvent(GetAllRemindersEvent event, emit) async {
    emit(
        state.copyWith(isLoading: true, hasError: false, reminderAdded: false));
    getAllPage = 1;
    final result = await reminderRepo.getAllReminder(
        pageQuery: PageQuery(page: getAllPage));
    result.fold(
        (l) => emit(state.copyWith(isLoading: false, hasError: true)),
        (r) => emit(state.copyWith(
            isLoading: false, hasError: false, allReminderList: r.results)));
  }

  FutureOr<void> getHistoryRemindersEvent(
      GetHistoryRemindersEvent event, emit) async {
    emit(state.copyWith(isLoading: true, hasError: false));
    getHistory = 1;
    final result = await reminderRepo.getHistoryReminder(
        pageQuery: PageQuery(page: getAllPage));
    result.fold(
        (l) => emit(state.copyWith(isLoading: false, hasError: true)),
        (r) => emit(state.copyWith(
            isLoading: false,
            hasError: false,
            historyReminderList: r.results)));
  }

  FutureOr<void> getUpcomingRemindersEvent(
      GetUpcomingRemindersEvent event, emit) async {
    emit(state.copyWith(isLoading: true, hasError: false));
    getUpcoming = 1;
    final result = await reminderRepo.getUpcomingReminder(
        pageQuery: PageQuery(page: getAllPage));
    result.fold(
        (l) => emit(state.copyWith(isLoading: false, hasError: true)),
        (r) => emit(state.copyWith(
            isLoading: false,
            hasError: false,
            upcomingRminderList: r.results)));
  }

  FutureOr<void> getTodaysRemindersEvent(
      GetTodaysRemindersEvent event, emit) async {
    emit(state.copyWith(isLoading: true, hasError: false));
    final result = await reminderRepo.getTodaysReminder();
    result.fold(
        (l) => emit(state.copyWith(isLoading: false, hasError: true)),
        (r) => emit(state.copyWith(
            isLoading: false, hasError: false, toDaysRminderList: r.results)));
  }

  FutureOr<void> getAllRemindersEvenPaget(
      GetAllRemindersEventPage event, emit) async {
    emit(state.copyWith(allReminderLoading: true, hasError: false));
    final result = await reminderRepo.getAllReminder(
        pageQuery: PageQuery(page: ++getAllPage));
    result.fold(
        (l) => emit(state.copyWith(allReminderLoading: false, hasError: true)),
        (r) => emit(state.copyWith(
            allReminderLoading: false,
            hasError: false,
            allReminderList: [...state.allReminderList!, ...r.results ?? []])));
  }

  FutureOr<void> getHistoryRemindersEventPage(
      GetHistoryRemindersEventPage event, emit) async {
    emit(state.copyWith(historyLoading: true, hasError: false));
    final result = await reminderRepo.getHistoryReminder(
        pageQuery: PageQuery(page: ++getHistory));
    result.fold(
        (l) => emit(state.copyWith(historyLoading: false, hasError: true)),
        (r) => emit(state.copyWith(
                historyLoading: false,
                hasError: false,
                historyReminderList: [
                  ...state.historyReminderList!,
                  ...r.results ?? []
                ])));
  }

  FutureOr<void> getUpcomingRemindersEventPage(
      GetUpcomingRemindersEventPage event, emit) async {
    emit(state.copyWith(upcomingReminderLoading: true, hasError: false));
    final result = await reminderRepo.getUpcomingReminder(
        pageQuery: PageQuery(page: ++getUpcoming));
    result.fold(
        (l) => emit(
            state.copyWith(upcomingReminderLoading: false, hasError: true)),
        (r) => emit(state.copyWith(
                upcomingReminderLoading: false,
                hasError: false,
                upcomingRminderList: [
                  ...state.upcomingRminderList!,
                  ...r.results ?? []
                ])));
  }
}
