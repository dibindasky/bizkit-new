import 'dart:async';
import 'package:bizkit/module/biz_card/data/secure_storage/flutter_secure_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'promt_event.dart';
part 'promt_state.dart';
part 'promt_bloc.freezed.dart';

@injectable
class PromtBloc extends Bloc<PromtEvent, PromtState> {
  PromtBloc() : super(PromtState.initial()) {
    on<ClosePrompt>(closePrompt);
    on<CheckPrompt>(checkPrompt);
  }

  FutureOr<void> closePrompt(ClosePrompt event, emit) async {
    emit(state.copyWith(show: false));
  }

  FutureOr<void> checkPrompt(CheckPrompt event, emit) async {
    await Future.delayed(const Duration(seconds: 3));
    final hasCard = await SecureStorage.getHasCard();
    final hasReminder = await SecureStorage.getHasConnection();
    if (!hasCard || !hasReminder) {
      emit(state.copyWith(
          hasCard: hasCard,
          hasReminder: false,
          show: true,
          message: !hasCard
              ? 'Create your Bizkit Card'
              : 'Create Bizkit Connections'));
    } else {
      emit(state.copyWith(show: false));
    }
  }
}
