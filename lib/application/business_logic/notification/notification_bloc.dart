import 'dart:async';
import 'package:bizkit/domain/model/notification/notification_model/notification.dart';
import 'package:bizkit/domain/repository/service/notification.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
part 'notification_event.dart';
part 'notification_state.dart';
part 'notification_bloc.freezed.dart';

@injectable
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepo notificationRepo;
  NotificationBloc(this.notificationRepo) : super(NotificationState.initial()) {
    on<GetNotification>(getNotification);
    on<NotificationEvent>(notificationEvent);
  }

  FutureOr<void> notificationEvent(NotificationEvent event, emit) async {
    emit(state.copyWith(
        notificationLoading: true, hasError: false, message: null));
    final data = await notificationRepo.getNotification();
    data.fold(
        (l) => emit(
              state.copyWith(
                  notificationLoading: false, hasError: true, message: null),
            ), (r) {
      emit(state.copyWith(
        notificationLoading: false,
        hasError: false,
        notification: [...state.notification!, ...r.notification!],
      ));
    });
  }

  FutureOr<void> getNotification(GetNotification event, emit) async {
    emit(state.copyWith(
        notificationLoading: true, hasError: false, message: null));
    final data = await notificationRepo.getNotification();
    data.fold(
        (l) => emit(state.copyWith(
            notificationLoading: false, hasError: true, message: null)), (r) {
      emit(state.copyWith(
        notificationLoading: false,
        hasError: false,
        notification: r.notification,
      ));
    });
  }
}