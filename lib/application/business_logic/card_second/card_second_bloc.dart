import 'dart:async';
import 'dart:developer';
import 'package:bizkit/application/presentation/utils/image_picker/image_picker.dart';
import 'package:bizkit/domain/model/card_second/card_second_create_request_model/card_second_create_request_model.dart';
import 'package:bizkit/domain/model/card_second/card_second_response_model/card_second_response_model.dart';
import 'package:bizkit/domain/model/card_second/gate_all_card_second_model/second_card.dart';
import 'package:bizkit/domain/model/commen/page_query/page_query.dart';
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
  int secondCard = 1;
  final GlobalKey<FormState> autoFillDataKey = GlobalKey<FormState>();
  final GlobalKey<FormState> meetingDataKey = GlobalKey<FormState>();
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
  }

  FutureOr<void> meetingRelatedInfo(MeetingRelatedInfo event, emit) async {
    state.cardSecondCreateRequestModel.selfie = event.selfieImage;
    state.cardSecondCreateRequestModel.occupation = event.occupation;
    state.cardSecondCreateRequestModel.location = event.location;
    state.cardSecondCreateRequestModel.notes = event.notes;
    state.cardSecondCreateRequestModel.whereWeMet = event.occation;
    emit(state.copyWith(isLoading: true, hasError: false, message: null));
    log('${state.cardSecondCreateRequestModel.toJson()}');
    final data = await _cardSecondRepo.cardSecondCreation(
      cardSecondCreateRequestModel: state.cardSecondCreateRequestModel,
    );
    data.fold(
      (l) => emit(state.copyWith(isLoading: false, hasError: true)),
      (r) async {
        emit(
          state.copyWith(
            isLoading: false,
            hasError: false,
            cardSecondResponseModel: r,
          ),
        );
        add(const CardSecondEvent.getAllCardsSecond(isLoad: true));
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
    final selfieImage =
        await ImagePickerClass.getImage(camera: true, cameraDeviceFront: true);
    if (selfieImage != null) {
      emit(
        state.copyWith(
          selfieImageModel: selfieImage,
          isLoading: false,
          cardScanFinish: false,
        ),
      );
    }
    emit(state.copyWith(
      message: 'Image Picking failed',
      isLoading: false,
    ));
  }

  FutureOr<void> pickImageGallery(ScanImage event, emit) async {
    final scanGalleryImage =
        await ImagePickerClass.getImage(camera: event.isCam);
    if (scanGalleryImage != null) {
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
    emit(state.copyWith(scannedImagesSecondCardCreation: list, message: null));
  }

  FutureOr<void> getAllCardsSecond(GetAllCardsSecond event, emit) async {
    if (state.secondCards.isNotEmpty && !event.isLoad) return;
    emit(state.copyWith(isLoading: true, hasError: false, message: null));
    secondCard = 1;
    final data = await _cardSecondRepo.getAllCardsSecond(
        pageQuery: PageQuery(page: secondCard));
    data.fold(
      (l) =>
          emit(state.copyWith(isLoading: false, hasError: true, message: null)),
      (r) => emit(state.copyWith(
        isLoading: false,
        hasError: false,
        secondCards: r.results ?? [],
      )),
    );
  }

  FutureOr<void> updateCardSecond(UpdateCardSecond event, emit) {}

  FutureOr<void> getCardSecondEvent(GetCardSecondEvent event, emit) async {
    emit(state.copyWith(
        secondCardLoading: true, hasError: false, message: null));

    final data = await _cardSecondRepo.getAllCardsSecond(
        pageQuery: PageQuery(page: ++secondCard));
    data.fold(
      (l) => emit(state.copyWith(secondCardLoading: false, hasError: true)),
      (r) => emit(state.copyWith(
        secondCardLoading: false,
        hasError: false,
        secondCards: [
          ...state.secondCards,
          ...r.results ?? [],
        ],
      )),
    );
  }
}
