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
    //on<DeleteCard>(deleteCard);
    on<GetdeleteCards>(getDeleteCards);
    on<GetdeleteCardsEvent>(getdeleteCardsEvent);
    // on<RestroreDeleteCard>(restroreDeleteCard);
    on<CardAction>(cardAction);
    on<GetArchievedCards>(getArchievedCards);
    on<GetArchievedCardsEvent>(getArchievedCardsEvent);
    on<RestoreArchiveDeleteCard>(restoreArchieveCards);
  }

  // FutureOr<void> restroreDeleteCard(RestroreDeleteCard event, emit) async {
  //   emit(state.copyWith(isLoading: true, hasError: false, message: null));
  //   final data = await cardService.restoreDeleteCard(id: event.id);
  //   data.fold(
  //       (l) => emit(
  //           state.copyWith(isLoading: false, hasError: true, message: null)),
  //       (r) {
  //     emit(state.copyWith(
  //       isLoading: false,
  //       hasError: false,
  //       message: r.message,
  //     ));
  //     add(const CardEvent.getdeleteCards(isLoad: true));
  //     add(const CardEvent.getCards(call: true));
  //   });
  // }

  FutureOr<void> getdeleteCardsEvent(GetdeleteCardsEvent event, emit) async {
    emit(state.copyWith(
        deleteCardLoading: true, hasError: false, message: null));
    final data = await cardService.getDeletedCardsList(
        pageQuery: PageQuery(page: ++deletedCards));
    data.fold(
        (l) => emit(state.copyWith(
              deleteCardLoading: false,
              hasError: true,
              message: null,
            )), (r) {
      emit(state.copyWith(
        deleteCardLoading: false,
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
    emit(state.copyWith(isLoading: true, hasError: false, message: null));
    final data = await cardService.getDeletedCardsList(
        pageQuery: PageQuery(page: deletedCards));
    data.fold(
        (l) => emit(state.copyWith(
              isLoading: false,
              hasError: true,
              message: null,
            )), (r) {
      emit(state.copyWith(
        isLoading: false,
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

  FutureOr<void> cardAction(CardAction event, emit) async {
    emit(state.copyWith(isLoading: true, hasError: false, message: null));
    final result = await cardService.cardAction(
      id: event.id,
      cardActionRewuestModel: event.cardActionRewuestModel,
    );
    result.fold(
        (failure) => emit(state.copyWith(
            isLoading: false,
            message: 'failed to archieve card',
            hasError: true)), (success) {
      emit(state.copyWith(message: 'card archeive successfully'));
      add(const CardEvent.getCards(call: true));
      add(const CardEvent.getArchievedCards(isLoad: true));
    });
  }

  FutureOr<void> restoreArchieveCards(
      RestoreArchiveDeleteCard event, emit) async {
    emit(state.copyWith(isLoading: true, hasError: false, message: null));
    final data = await cardService.restoreArchiveDeleteCard(
      cardId: event.cardId,
      cardActionRewuestModel: event.cardActionRewuestModel,
    );
    data.fold(
        (l) => emit(
            state.copyWith(isLoading: false, hasError: true, message: null)),
        (r) {
      emit(state.copyWith(
        isLoading: false,
        hasError: false,
        message: r.message,
      ));
      add(const CardEvent.getArchievedCards(isLoad: true));
      add(const CardEvent.getCards(call: true));
    });
  }

  // FutureOr<void> deleteCard(DeleteCard event, emit) async {
  //   emit(state.copyWith(isLoading: true, hasError: false, message: null));
  //   final result = await cardService.deleteCard(id: event.id);
  //   result.fold(
  //       (failure) => emit(state.copyWith(
  //           isLoading: false,
  //           message: 'failed to delete card',
  //           hasError: true)), (success) {
  //     emit(state.copyWith(message: 'card deleted successfully'));
  //     add(const CardEvent.getCards(call: true));
  //   });
  // }

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
        isLoading: true, hasError: false, message: null, anotherCard: null));
    final result = await cardService.getCardByUserId(id: event.id);
    result.fold(
        (left) => emit(state.copyWith(
            isLoading: false, hasError: true, message: left.message)),
        (right) => emit(state.copyWith(
            isLoading: false,
            anotherCard: right.results != null && right.results!.isNotEmpty
                ? right.results!.first
                : null)));
  }

  FutureOr<void> getCardyCardId(GetCardyCardId event, emit) async {
    emit(state.copyWith(
        isLoading: true, hasError: false, message: null, anotherCard: null));
    final result = await cardService.getCardByCardId(id: event.id);
    result.fold(
        (left) => emit(state.copyWith(
            isLoading: false,
            hasError: true,
            message: left.message)), (right) async {
      // List<Brochure> list = [];
      // print(right.businessDetails!.toJson());
      // print(right.businessDetails?.brochure);
      // if (right.businessDetails != null &&
      //     right.businessDetails!.brochure != null) {
      //   for (var broc in right.businessDetails!.brochure!) {
      //     final path = await pdfPicker.convertBase64ToFile(
      //         broc.file!, DateTime.now().microsecondsSinceEpoch.toString());
      //     if (path != null) {
      //       list.add(Brochure(file: path));
      //     }
      //   }
      //   right.businessDetails!.brochure = list;
      //   print(list.length);
      // }
      return emit(state.copyWith(isLoading: false, anotherCard: right));
    });
  }

  FutureOr<void> getCardsnextPage(GetCardsnextPage event, emit) async {
    emit(state.copyWith(pageLoading: true));
    cardPage += 1;
    final result = await cardService.getCards(qurey: PageQuery(page: cardPage));
    result.fold((failure) => emit(state.copyWith(pageLoading: false)),
        (getCardResposnseModel) => emit(state.copyWith(pageLoading: false)));
  }

  FutureOr<void> getCards(GetCards event, emit) async {
    if (state.cards.isNotEmpty && !event.call) return;
    emit(state.copyWith(isLoading: true, hasError: false, message: null));
    final business = await SecureStorage.getRole();
    cardPage = 1;
    print('get card bloc');
    final result = await cardService.getCards(qurey: PageQuery(page: cardPage));
    result.fold(
        (failure) => emit(state.copyWith(
            hasError: true,
            isLoading: false,
            businessUser: business,
            message: failure.message)), (getCardResposnseModel) {
      print('get card bloc success');
      CardResponse? defaultCard;
      if (getCardResposnseModel.results != null &&
          getCardResposnseModel.results!.isNotEmpty) {
        print('get default card');
        final def =
            getCardResposnseModel.results!.where((card) => card.isDefault!);
        defaultCard = def.isEmpty ? null : def.first;
      }
      print('get card bloc success1');
      emit(state.copyWith(
          businessUser: business,
          isLoading: false,
          cards: getCardResposnseModel.results ?? [],
          defaultCard: defaultCard));
      print('get card bloc success2');
    });
  }
}
