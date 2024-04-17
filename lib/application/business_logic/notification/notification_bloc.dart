import 'dart:async';
import 'dart:developer';
import 'package:bizkit/domain/model/commen/page_query/page_query.dart';
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
  int notification = 1;
  NotificationBloc(this.notificationRepo) : super(NotificationState.initial()) {
    on<GetNotification>(getNotification);
    on<GetNotificationEvent>(notificationEvent);
    on<Clear>(clear);
  }

  FutureOr<void> clear(Clear event, emit) async {
    return emit(NotificationState.initial());
  }

  FutureOr<void> notificationEvent(NotificationEvent event, emit) async {
    log('notificationEvent first');
    emit(state.copyWith(
        notificationLoading: true, hasError: false, message: null));
    log('notificationEvent scnd');
    final data = await notificationRepo.getNotification(
        pageQuery: PageQuery(page: ++notification));
    data.fold(
        (l) => emit(
              state.copyWith(
                  notificationLoading: false, hasError: true, message: null),
            ), (r) {
      log('notificationEvent thrd success');
      emit(state.copyWith(
        notificationLoading: false,
        hasError: false,
        notification: [
          ...state.notification ?? [],
          ...r.notification ?? [],
        ],
      ));
    });
  }

  FutureOr<void> getNotification(GetNotification event, emit) async {
    log('Call for notification');
    //if (state.notification!.isNotEmpty && !event.isLoad) return;
    emit(state.copyWith(isLoading: true, hasError: false, message: null));
    notification = 1;
    final data =
        await notificationRepo.getNotification(pageQuery: PageQuery(page: 1));
    data.fold(
        (l) => emit(
            state.copyWith(isLoading: false, hasError: true, message: null)),
        (r) {
      log('getNotification r.notification?.length bloc ${r.notification?.length}');
      emit(state.copyWith(
        isLoading: false,
        hasError: false,
        notification: r.notification ?? [],
      ));
    });
  }
}
