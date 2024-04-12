import 'dart:async';
import 'dart:developer';
import 'package:bizkit/application/presentation/utils/image_picker/image_picker.dart';
import 'package:bizkit/domain/model/card/cards_in_profile/card_action_rewuest_model/card_action_rewuest_model.dart';
import 'package:bizkit/domain/model/card_second/card_second_create_request_model/card_second_create_request_model.dart';
import 'package:bizkit/domain/model/card_second/card_second_response_model/card_second_response_model.dart';
import 'package:bizkit/domain/model/card_second/gate_all_card_second_model/second_card.dart';
import 'package:bizkit/domain/model/card_second/get_second_card_model/get_second_card_model.dart';
import 'package:bizkit/domain/model/commen/page_query/page_query.dart';
import 'package:bizkit/domain/model/commen/success_response_model/success_response_model.dart';
import 'package:bizkit/domain/model/image/image_model.dart';
import 'package:bizkit/domain/model/scanned_image_datas_model/scanned_image_datas_model.dart';
import 'package:bizkit/domain/repository/feature/card_scanning_repo.dart';
import 'package:bizkit/domain/repository/service/card_second.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
part 'card_second_event.dart';
part 'card_second_state.dart';
part 'card_second_bloc.freezed.dart';

@injectable
class CardSecondBloc extends Bloc<CardSecondEvent, CardSecondState> {
  int secondCard = 1, deletedCards = 1;

  final GlobalKey<FormState> cardUpdateKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController copanyController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController webSiteController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController occationController = TextEditingController();
  TextEditingController locatioNController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController updateNameController = TextEditingController();
  TextEditingController updateCompanyController = TextEditingController();
  final CardSecondRepo _cardSecondRepo;
  final CardScanningRepo cardScanningRepo;
  CardSecondBloc(this._cardSecondRepo, this.cardScanningRepo)
      : super(CardSecondState.initial()) {
    on<ScanImage>(pickImageGallery);
    on<ProcessImageScanning>(processImageScanning);
    on<RemoveImageScanning>(removeImageScanning);
    on<SelfieImage>(selfieImage);
    on<GetAllCardsSecond>(getAllCardsSecond);
    on<GetCardSecondEvent>(getCardSecondEvent);
    on<UpdateCardSecond>(updateCardSecond);
    on<AutoFillTExtfieldItems>(autoFillTExtfieldItems);
    on<MeetingRelatedInfo>(meetingRelatedInfo);
    on<DeleteCardSecond>(deleteCardSecond);
    on<GetDeleteCardSecond>(getDeleteCardSecond);
    on<GetDeleteCardSecondEvent>(getDeleteCardSecondEvent);
    on<RestoreDeleteCardSecond>(restoreDeleteCardSecond);
    on<GetSecondCardDetail>(getSecondCardDetail);
    on<DataClearing>(dataClearing);
  }

  FutureOr<void> dataClearing(DataClearing devent, emit) {
    phoneController.clear();
    nameController.clear();
    emailController.clear();
    copanyController.clear();
    webSiteController.clear();
    designationController.clear();
    occationController.clear();
    locatioNController.clear();
    occupationController.clear();
    notesController.clear();
    emit(state.copyWith(
      cardScanFinish: false,
      scannedImagesSecondCardCreation: [],
      scannedImageDatasModel: null,
      selfieImageModel: null,
    ));
  }

  FutureOr<void> getSecondCardDetail(GetSecondCardDetail event, emit) async {
    emit(state.copyWith(isLoading: true, hasError: false));
    final data = await _cardSecondRepo.getCardSecond(id: event.id);
    data.fold((l) => emit(state.copyWith(isLoading: false, hasError: true)),
        (r) {
      emit(state.copyWith(
        isLoading: false,
        hasError: false,
        getSecondCardModel: r,
      ));
    });
  }

  FutureOr<void> restoreDeleteCardSecond(
      RestoreDeleteCardSecond event, emit) async {
    emit(state.copyWith(
      deleteSecondCardLoading: true,
      hasError: false,
      seondCardRestored: false,
    ));
    final data = await _cardSecondRepo.restoreDeleteSecondCardEvent(
      id: event.id,
      cardActionRewuestModel: event.cardActionRewuestModel,
    );
    data.fold(
        (l) => emit(state.copyWith(
              deleteSecondCardLoading: false,
              seondCardRestored: false,
              hasError: true,
            )), (r) {
      emit(state.copyWith(
        deleteSecondCardLoading: false,
        hasError: false,
        seondCardRestored: true,
        message: 'Card restored',
      ));
      add(const CardSecondEvent.getDeleteCardSecond(isLoad: true));
      //add(const CardSecondEvent.getAllCardsSecond(isLoad: true));
    });
  }

  FutureOr<void> getDeleteCardSecondEvent(
      GetDeleteCardSecondEvent event, emit) async {
    emit(state.copyWith(deleteSecondCardLoading: true, hasError: false));
    final data = await _cardSecondRepo.getDeleteSecondCardEvent(
        pageQuery: PageQuery(page: ++deletedCards));
    data.fold(
        (l) => emit(
            state.copyWith(deleteSecondCardLoading: false, hasError: true)),
        (r) {
      emit(state.copyWith(
        deleteSecondCardLoading: false,
        hasError: false,
        deleteSecondCards: [
          ...state.deleteSecondCards!,
          ...r.secondCards ?? []
        ],
      ));
    });
  }

  FutureOr<void> getDeleteCardSecond(GetDeleteCardSecond event, emit) async {
    if (state.deleteSecondCards != null && !event.isLoad) return;
    deletedCards = 1;
    emit(state.copyWith(
      deleteSecondCardLoading: true,
      hasError: false,
      secondCardDeleted: false,
    ));
    final data = await _cardSecondRepo.getDeleteSecondCard(
        pageQuery: PageQuery(page: deletedCards));
    data.fold(
        (l) => emit(state.copyWith(
              secondCardDeleted: false,
              deleteSecondCardLoading: false,
              hasError: true,
            )), (r) {
      emit(
        state.copyWith(
          secondCardDeleted: false,
          deleteSecondCardLoading: false,
          hasError: false,
          deleteSecondCards: r.secondCards ?? [],
        ),
      );
    });
  }

  FutureOr<void> deleteCardSecond(DeleteCardSecond event, emit) async {
    emit(state.copyWith(
      secondCardLoading: true,
      hasError: false,
      secondCardDeleted: false,
    ));
    final data = await _cardSecondRepo.deleteSecondCard(
      cardActionRewuestModel: event.cardActionRewuestModel,
      id: event.id,
    );
    data.fold(
      (l) => emit(state.copyWith(
          secondCardLoading: false, hasError: true, secondCardDeleted: false)),
      (r) {
        emit(
          state.copyWith(
            secondCardLoading: false,
            hasError: false,
            message: 'Selcted Card Deleted',
            secondCardDeleted: true,
          ),
        );
        add(const CardSecondEvent.getAllCardsSecond(isLoad: true));
        //add(const CardSecondEvent.getDeleteCardSecond(isLoad: true));
      },
    );
  }

  FutureOr<void> meetingRelatedInfo(MeetingRelatedInfo event, emit) async {
    state.cardSecondCreateRequestModel.selfie = event.selfieImage;
    state.cardSecondCreateRequestModel.occupation = event.occupation;
    state.cardSecondCreateRequestModel.location = event.location;
    state.cardSecondCreateRequestModel.notes = event.notes;
    state.cardSecondCreateRequestModel.whereWeMet = event.occation;
    emit(state.copyWith(
        isLoading: true,
        hasError: false,
        message: null,
        secondCardcreated: false));
    log('${state.cardSecondCreateRequestModel.toJson()}');
    final data = await _cardSecondRepo.cardSecondCreation(
      cardSecondCreateRequestModel: state.cardSecondCreateRequestModel,
    );
    data.fold(
      (l) => emit(state.copyWith(
          isLoading: false, hasError: true, secondCardcreated: false)),
      (r) async {
        emit(
          state.copyWith(
            isLoading: false,
            hasError: false,
            cardSecondResponseModel: r,
            secondCardcreated: true,
          ),
        );
        add(const CardSecondEvent.getAllCardsSecond(isLoad: true));
      },
    );
  }

  FutureOr<void> autoFillTExtfieldItems(
      AutoFillTExtfieldItems event, emit) async {
    state.cardSecondCreateRequestModel.image = event.scannedImage;
    state.cardSecondCreateRequestModel.name = event.name;
    state.cardSecondCreateRequestModel.company = event.company;
    state.cardSecondCreateRequestModel.designation = event.designation;
    state.cardSecondCreateRequestModel.phoneNumber = event.number;
    state.cardSecondCreateRequestModel.website = event.website;
    state.cardSecondCreateRequestModel.email = event.email;
  }

  FutureOr<void> selfieImage(SelfieImage event, emit) async {
    emit(state.copyWith(cardScanFinish: false));
    final selfieImage = await ImagePickerClass.getImage(
      camera: true,
      cameraDeviceFront: true,
    );
    if (selfieImage != null) {
      emit(
        state.copyWith(
          selfieImageModel: selfieImage,
          isLoading: false,
          cardScanFinish: false,
        ),
      );
    } else {
      emit(state.copyWith(
        message: 'Image Picking failed',
        isLoading: false,
        cardScanFinish: false,
      ));
    }
  }

  FutureOr<void> pickImageGallery(ScanImage event, emit) async {
    final scanGalleryImage =
        await ImagePickerClass.getImage(camera: event.isCam);
    if (scanGalleryImage != null) {
      log('scan image count ${state.scannedImagesSecondCardCreation.length}');
      emit(
        state.copyWith(
          scannedImagesSecondCardCreation: [
            ...state.scannedImagesSecondCardCreation,
            scanGalleryImage,
          ],
          cardScanFinish: false,
        ),
      );
    }
    emit(state.copyWith(message: 'Image Picking failed', isLoading: false));
  }

  FutureOr<void> processImageScanning(ProcessImageScanning event, emit) async {
    emit(state.copyWith(
      isLoading: true,
      hasError: false,
      cardScanFinish: false,
    ));
    final result = await cardScanningRepo
        .processAndSortFromImage(state.scannedImagesSecondCardCreation);
    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        hasError: true,
        cardScanFinish: false,
      )),
      (scannedImageText) => emit(state.copyWith(
        scannedImageDatasModel: scannedImageText,
        message: null,
        cardScanFinish: true,
        isLoading: false,
      )),
    );
  }

  FutureOr<void> removeImageScanning(RemoveImageScanning event, emit) async {
    final List<ImageModel> list = [];
    for (ImageModel img in state.scannedImagesSecondCardCreation) {
      if (state.scannedImagesSecondCardCreation[event.index] != img) {
        list.add(img);
      }
    }
    emit(state.copyWith(
        scannedImagesSecondCardCreation: list,
        message: null,
        cardScanFinish: false));
  }

  FutureOr<void> getAllCardsSecond(GetAllCardsSecond event, emit) async {
    if (state.secondCards.isNotEmpty && !event.isLoad) return;
    emit(state.copyWith(
        secondCardLoading: true,
        hasError: false,
        message: null,
        seondCardRestored: false,
        secondCardDeleted: false,
        secondCardcreated: false));
    secondCard = 1;
    final data = await _cardSecondRepo.getAllCardsSecond(
        pageQuery: PageQuery(page: secondCard));
    data.fold(
      (l) => emit(state.copyWith(
        secondCardLoading: false,
        hasError: true,
        message: null,
        seondCardRestored: false,
        secondCardDeleted: false,
        secondCardcreated: false,
      )),
      (r) => emit(state.copyWith(
        secondCardLoading: false,
        hasError: false,
        secondCards: r.results ?? [],
        seondCardRestored: false,
        secondCardDeleted: false,
        secondCardcreated: false,
      )),
    );
  }

  FutureOr<void> updateCardSecond(UpdateCardSecond event, emit) async {
    emit(state.copyWith(
      isLoading: true,
      hasError: false,
      message: null,
      updated: false,
    ));
    final data = await _cardSecondRepo.updateCardSecond(
      secondCard: event.secondCard,
      id: event.id,
    );
    data.fold(
        (l) => emit(state.copyWith(
              isLoading: false,
              updated: false,
              hasError: true,
            )), (r) {
      emit(state.copyWith(
        isLoading: false,
        hasError: false,
        updated: true,
        cardSecondResponseModel: r,
      ));
      add(const CardSecondEvent.getAllCardsSecond(isLoad: true));
    });
  }

  FutureOr<void> getCardSecondEvent(GetCardSecondEvent event, emit) async {
    emit(state.copyWith(
      secondCardLoading: true,
      hasError: false,
      message: null,
      updated: false,
    ));
    final data = await _cardSecondRepo.getAllCardsSecond(
        pageQuery: PageQuery(page: ++secondCard));
    data.fold(
      (l) => emit(state.copyWith(
        secondCardLoading: false,
        hasError: true,
        updated: false,
      )),
      (r) => emit(state.copyWith(
        secondCardLoading: false,
        hasError: false,
        secondCards: [
          ...state.secondCards,
          ...r.results ?? [],
        ],
        updated: false,
      )),
    );
  }
}
