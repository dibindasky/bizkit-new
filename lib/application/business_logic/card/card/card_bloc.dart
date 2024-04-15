import 'dart:async';
import 'package:bizkit/data/features/pdf/pdf_picker.dart';
import 'package:bizkit/data/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/domain/model/card/card/card/card.dart';
import 'package:bizkit/domain/model/card/cards_in_profile/archeived_card_model/archeived_card.dart';
import 'package:bizkit/domain/model/card/cards_in_profile/blocked_cards_responce_moede/blocked%20cards.dart';
import 'package:bizkit/domain/model/card/cards_in_profile/card_action_rewuest_model/card_action_rewuest_model.dart';
import 'package:bizkit/domain/model/card/get_card_response/card_response.dart';
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
  final PdfPickerImpl pdfPicker;
  int cardPage = 1, archevedCards = 1, deletedCards = 1;

  CardBloc(this.cardService, this.pdfPicker) : super(CardState.initial()) {
    on<GetCards>(getCards);
    on<GetCardsnextPage>(getCardsnextPage);
    on<GetCardyUserId>(getCardyUserId);
    on<GetCardyCardId>(getCardyCardId);
    on<SetDefault>(setDefault);
    on<GetdeleteCards>(getDeleteCards);
    on<GetdeleteCardsEvent>(getdeleteCardsEvent);
    on<CardDelete>(cardDelete);
    on<CardArchive>(cardArchive);
    on<GetArchievedCards>(getArchievedCards);
    on<GetArchievedCardsEvent>(getArchievedCardsEvent);
    on<RestoreArchiveCard>(restoreArchiveCard);
    on<RestoreDeletedCard>(restoreDeletedCard);
    on<Clear>(clear);
  }

  FutureOr<void> clear(Clear event, emit) async {
    return emit(CardState.initial());
  }

  FutureOr<void> getdeleteCardsEvent(GetdeleteCardsEvent event, emit) async {
    emit(state.copyWith(
        deleteCardEventLoading: true, hasError: false, message: null));
    final data = await cardService.getDeletedCardsList(
        pageQuery: PageQuery(page: ++deletedCards));
    data.fold(
        (l) => emit(state.copyWith(
              deleteCardEventLoading: false,
              hasError: true,
              message: null,
            )), (r) {
      emit(state.copyWith(
        deleteCardEventLoading: false,
        hasError: true,
        deletedCards: [
          ...state.deletedCards!,
          ...r.blockedCards!,
        ],
      ));
    });
  }

  FutureOr<void> getDeleteCards(GetdeleteCards event, emit) async {
    deletedCards = 1;
    emit(state.copyWith(
        deleteCardRestored: false,
        deleteCardLoading: true,
        hasError: false,
        message: null));
    final data = await cardService.getDeletedCardsList(
        pageQuery: PageQuery(page: deletedCards));
    data.fold(
        (l) => emit(state.copyWith(
              deleteCardLoading: false,
              hasError: true,
              message: null,
            )), (r) {
      emit(state.copyWith(
        deleteCardLoading: false,
        hasError: false,
        deletedCards: r.blockedCards!,
      ));
    });
  }

  FutureOr<void> getArchievedCards(GetArchievedCards event, emit) async {
    if (state.archievedCards != null && event.isLoad == false) return;
    archevedCards = 1;
    emit(state.copyWith(isLoading: true, hasError: false, message: null));
    final data = await cardService.archievedCardsList(
        pageQuery: PageQuery(page: archevedCards));
    data.fold(
        (l) => emit(
              state.copyWith(isLoading: false, hasError: true, message: null),
            ), (r) {
      emit(
        state.copyWith(
            isLoading: false, hasError: false, archievedCards: r.archiveCards),
      );
    });
  }

  FutureOr<void> getArchievedCardsEvent(event, emit) async {
    emit(state.copyWith(
        archiveCardLoading: true, hasError: false, message: null));

    final data = await cardService.archievedCardsList(
        pageQuery: PageQuery(page: ++archevedCards));
    data.fold(
        (l) => emit(state.copyWith(
            archiveCardLoading: false, hasError: true, message: null)), (r) {
      emit(state.copyWith(
        archiveCardLoading: false,
        hasError: false,
        archievedCards: [...state.archievedCards!, ...r.archiveCards!],
      ));
    });
  }

  FutureOr<void> cardDelete(CardDelete event, emit) async {
    emit(state.copyWith(
        deleteCardLoading: true, hasError: false, message: null));
    final result = await cardService.cardAction(
      id: event.id,
      cardActionRewuestModel: event.cardActionRequestModel,
    );
    result.fold(
        (failure) => emit(state.copyWith(
            deleteCardLoading: false,
            message: 'failed to Delete card',
            hasError: true)), (success) {
      emit(state.copyWith(
          message: 'Card delete successfully', deleteCardLoading: false));
      add(const CardEvent.getCards(call: true));
      add(const CardEvent.getdeleteCards(isLoad: true));
    });
  }

  FutureOr<void> cardArchive(CardArchive event, emit) async {
    emit(state.copyWith(isLoading: true, hasError: false, message: null));
    final result = await cardService.cardAction(
      id: event.id,
      cardActionRewuestModel: event.cardActionRequestModel,
    );
    result.fold(
        (failure) => emit(state.copyWith(
            isLoading: false,
            message: 'failed to archive card',
            hasError: true)), (success) {
      emit(state.copyWith(
        message: 'Card archive successfully',
        isLoading: false,
      ));
      add(const CardEvent.getCards(call: true));
      add(const CardEvent.getArchievedCards(isLoad: true));
    });
  }

  FutureOr<void> restoreArchiveCard(RestoreArchiveCard event, emit) async {
    emit(state.copyWith(isLoading: true, hasError: false, message: null));
    final data = await cardService.restoreArchiveDeleteCard(
      cardId: event.cardId,
      cardActionRewuestModel: event.cardActionRequestModel,
    );
    data.fold(
        (l) => emit(state.copyWith(
              isLoading: false,
              hasError: true,
              message: null,
            )), (r) {
      emit(state.copyWith(
        isLoading: false,
        hasError: false,
        archiveCardRestored: true,
        deleteCardRestored: true,
      ));
      add(const CardEvent.getArchievedCards(isLoad: true));
      add(const CardEvent.getCards(call: true));
    });
  }

  FutureOr<void> restoreDeletedCard(RestoreDeletedCard event, emit) async {
    emit(state.copyWith(
        deleteCardLoading: true, hasError: false, message: null));
    final data = await cardService.restoreArchiveDeleteCard(
      cardId: event.cardId,
      cardActionRewuestModel: event.cardActionRequestModel,
    );
    data.fold(
        (l) => emit(state.copyWith(
              deleteCardLoading: false,
              hasError: true,
              message: null,
            )), (r) {
      emit(state.copyWith(
        deleteCardLoading: false,
        hasError: false,
        archiveCardRestored: true,
        deleteCardRestored: true,
      ));
      add(const CardEvent.getdeleteCards(isLoad: true));
      add(const CardEvent.getCards(call: true));
    });
  }

  FutureOr<void> setDefault(SetDefault event, emit) async {
    final result = await cardService.setDefault(id: event.id);
    result.fold(
        (failure) => emit(state.copyWith(
            message: 'failed to set default card', hasError: true)), (success) {
      emit(state.copyWith(message: 'card set as default'));
      add(const CardEvent.getCards(call: true));
    });
  }

  FutureOr<void> getCardyUserId(GetCardyUserId event, emit) async {
    emit(state.copyWith(
        cardLoading: true, hasError: false, message: null, anotherCard: null));
    final result = await cardService.getCardByUserId(id: event.id);
    result.fold(
        (left) => emit(state.copyWith(
            cardLoading: false, hasError: true, message: left.message)),
        (right) => emit(state.copyWith(
            cardLoading: false,
            anotherCard: right.results != null && right.results!.isNotEmpty
                ? right.results!.first
                : null)));
  }

  FutureOr<void> getCardyCardId(GetCardyCardId event, emit) async {
    emit(state.copyWith(
        cardLoading: true, hasError: false, message: null, anotherCard: null));
    final result = await cardService.getCardByCardId(id: event.id);
    result.fold(
        (left) => emit(state.copyWith(
            cardLoading: false,
            hasError: true,
            message: left.message)), (right) async {
      return emit(state.copyWith(
          cardLoading: false, anotherCard: right));
    });
  }

  FutureOr<void> getCardsnextPage(GetCardsnextPage event, emit) async {
    emit(state.copyWith(pageLoading: true));

    final result =
        await cardService.getCards(qurey: PageQuery(page: ++cardPage));
    result.fold((failure) => emit(state.copyWith(pageLoading: false)),
        (getCardResposnseModel) => emit(state.copyWith(pageLoading: false)));
  }

  FutureOr<void> getCards(GetCards event, emit) async {
    if (state.cards.isNotEmpty && !event.call) return;
    emit(state.copyWith(
      isLoading: true,
      hasError: false,
      message: null,
      deleteCardRestored: false,
    ));
    final business = await SecureStorage.getRole();
    cardPage = 1;
    final result = await cardService.getCards(qurey: PageQuery(page: cardPage));
    result.fold(
        (failure) => emit(state.copyWith(
            hasError: true,
            isLoading: false,
            businessUser: business,
            message: failure.message)), (getCardResposnseModel) {
      CardResponse? defaultCard;
      if (getCardResposnseModel.results != null &&
          getCardResposnseModel.results!.isNotEmpty) {
        final def =
            getCardResposnseModel.results!.where((card) => card.isDefault!);
        defaultCard = def.isEmpty ? null : def.first;
      }
      return emit(state.copyWith(
          businessUser: business,
          isLoading: false,
          cards: getCardResposnseModel.results ?? [],
          defaultCard: defaultCard));
    });
  }
}
