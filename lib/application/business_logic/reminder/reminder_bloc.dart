import 'dart:async';
import 'package:bizkit/domain/model/reminders/create_reminder_model/create_reminder_model.dart';
import 'package:bizkit/domain/repository/service/reminder_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'reminder_event.dart';
part 'reminder_state.dart';
part 'reminder_bloc.freezed.dart';

@injectable
class ReminderBloc extends Bloc<ReminderEvent, ReminderState> {
  final ReminderRepo reminderRepo;
  ReminderBloc(this.reminderRepo) : super(ReminderState.initial()) {
    on<CreateReminder>(createReminder);
    on<EditReminder>(editReminder);
  }

  FutureOr<void> editReminder(EditReminder event, emit) async {
    emit(state.copyWith(isLoading: true, hasError: false));
    final result = await reminderRepo.editReminder(
        createReminderModel: event.createReminderModel);
    result.fold((l) => emit(state.copyWith(isLoading: false, hasError: true)),
        (r) => emit(state.copyWith(isLoading: false, hasError: false)));
  }

  FutureOr<void> createReminder(CreateReminder event, emit) async {
    emit(state.copyWith(isLoading: true, hasError: false));
    final result = await reminderRepo.createReminder(
        createReminderModel: event.createReminderModel);
    result.fold((l) => emit(state.copyWith(isLoading: false, hasError: true)),
        (r) => emit(state.copyWith(isLoading: false, hasError: false)));
  }
}
