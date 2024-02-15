import 'dart:async';
import 'package:bizkit/domain/model/card/card/card/card.dart';
import 'package:bizkit/domain/model/commen/page_query/page_query.dart';
import 'package:bizkit/domain/repository/service/card_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'card_event.dart';
part 'card_state.dart';
part 'card_bloc.freezed.dart';

@injectable
class CardBloc extends Bloc<CardEvent, CardState> {
  final CardRepo cardService;
  int cardPage = 1;

  CardBloc(this.cardService) : super(CardState.initial()) {
    on<GetCards>(getCards);
    on<GetCardsnextPage>(getCardsnextPage);
  }

  FutureOr<void> getCardsnextPage(GetCardsnextPage event, emit) async {
    emit(state.copyWith(pageLoading: true));
    cardPage += 1;
    final result = await cardService.getCards(qurey: PageQuery(page: cardPage));
    result.fold((failure) => emit(state.copyWith(pageLoading: false)),
        (getCardResposnseModel) => emit(state.copyWith(pageLoading: false)));
  }

  FutureOr<void> getCards(GetCards event, emit) async {
    emit(state.copyWith(isLoading: true, hasError: false, message: null));
    cardPage = 1;
    final result = await cardService.getCards(qurey: PageQuery(page: cardPage));
    result.fold(
        (failure) => emit(state.copyWith(
            hasError: true,
            isLoading: false,
            message: failure.message)), (getCardResposnseModel) {
      Card? defaultCard;
      if (getCardResposnseModel.results != null) {
        defaultCard = getCardResposnseModel.results!
            .firstWhere((card) => card.isDefault!);
      }
      return emit(state.copyWith(
          cards: getCardResposnseModel.results ?? [],
          defaultCard: defaultCard));
    });
  }
}
