import 'dart:async';
import 'package:bizkit/domain/model/card_second/gate_all_card_second_model/second_card.dart';
import 'package:bizkit/domain/repository/service/card_second.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'card_second_event.dart';
part 'card_second_state.dart';
part 'card_second_bloc.freezed.dart';

@injectable
class CardSecondBloc extends Bloc<CardSecondEvent, CardSecondState> {
  final CardSecondRepo _cardSecondRepo;
  CardSecondBloc(this._cardSecondRepo) : super(CardSecondState.initial()) {
    on<GetAllCardsSecond>(getAllCardsSecond);
    on<GetCardSecondEvent>(getCardSecondEvent);
    on<UpdateCardSecond>(updateCardSecond);
  }

  FutureOr<void> updateCardSecond(UpdateCardSecond event, emit) {}

  FutureOr<void> getCardSecondEvent(GetCardSecondEvent event, emit) {}

  FutureOr<void> getAllCardsSecond(GetAllCardsSecond event, emit) async {
    emit(state.copyWith(isLoading: true, hasError: false, message: null));
    final data = await _cardSecondRepo.getAllCardsSecond();
    data.fold(
      (l) =>
          emit(state.copyWith(isLoading: false, hasError: true, message: null)),
      (r) => emit(state.copyWith(
        isLoading: false,
        hasError: true,
        secondCards: r.results,
      )),
    );
  }
}
