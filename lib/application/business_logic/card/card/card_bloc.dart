import 'dart:async';
import 'package:bizkit/data/features/pdf/pdf_picker.dart';
import 'package:bizkit/data/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/domain/model/card/card/card/card.dart';
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
  int cardPage = 1;

  CardBloc(this.cardService, this.pdfPicker) : super(CardState.initial()) {
    on<GetCards>(getCards);
    on<GetCardsnextPage>(getCardsnextPage);
    on<GetCardyUserId>(getCardyUserId);
    on<GetCardyCardId>(getCardyCardId);
    on<SetDefault>(setDefault);
    on<DeleteCard>(deleteCard);
    // on<ArchiveCard>(archiveCard);
  }

  // FutureOr<void> archiveCard(ArchiveCard event, emit) async {
  //   retutn emit(state);
  // }

  FutureOr<void> deleteCard(DeleteCard event, emit) async {
    emit(state.copyWith(isLoading: true, hasError: false, message: null));
    final result = await cardService.deleteCard(id: event.id);
    result.fold(
        (failure) => emit(state.copyWith(
            isLoading: false,
            message: 'failed to delete card',
            hasError: true)), (success) {
      emit(state.copyWith(message: 'card deleted successfully'));
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
        defaultCard = getCardResposnseModel.results!
            .firstWhere((card) => card.isDefault!);
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
