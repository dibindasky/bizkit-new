import 'dart:async';
import 'dart:developer';
import 'package:bizkit/core/model/page_query/page_query.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/biz_card/domain/model/card/cards_in_profile/card_action_rewuest_model/card_action_rewuest_model.dart';
import 'package:bizkit/module/biz_card/domain/model/card_second/add_selfie_model/add_selfie_model.dart';
import 'package:bizkit/module/biz_card/domain/model/card_second/card_second_create_request_model/card_second_create_request_model.dart';
import 'package:bizkit/module/biz_card/domain/model/card_second/card_second_response_model/card_second_response_model.dart';
import 'package:bizkit/module/biz_card/domain/model/card_second/get_all_second_card_model/seond_card_new.dart';
import 'package:bizkit/module/biz_card/domain/model/card_second/get_second_card_model/get_second_card_model.dart';
import 'package:bizkit/module/biz_card/domain/model/card_second/get_second_card_model/selfie.dart';
import 'package:bizkit/module/biz_card/domain/model/contact/add_new_contact/add_new_contact.dart';
import 'package:bizkit/module/biz_card/domain/model/extracted_text_model/text_extractionimage_model/text_extractionimage_model.dart';
import 'package:bizkit/core/model/image/image_model.dart';
import 'package:bizkit/module/biz_card/domain/model/scanned_image_datas_model/scanned_image_datas_model.dart';
import 'package:bizkit/module/biz_card/domain/repository/feature/card_scanning_repo.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/card_second.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/text_extraction_repo.dart';
import 'package:bizkit/packages/contacts/contacts_fetch.dart';
import 'package:bizkit/packages/location/location_service.dart';
import 'package:bizkit/utils/image_picker/image_picker.dart';
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

  //Updation controllers
  TextEditingController updateNameController = TextEditingController();
  TextEditingController updateCompanyController = TextEditingController();
  TextEditingController updateEmailController = TextEditingController();
  TextEditingController updatephoneController = TextEditingController();
  TextEditingController updatewebSiteController = TextEditingController();
  TextEditingController updatedesignationController = TextEditingController();
  TextEditingController updateoccationController = TextEditingController();
  TextEditingController updatelocatioNController = TextEditingController();
  TextEditingController updateoccupationController = TextEditingController();
  TextEditingController updatenotesController = TextEditingController();
  final CardSecondRepo _cardSecondRepo;
  final CardScanningRepo cardScanningRepo;
  final LocationService locationRepo;
  final TextExtractionRepo textExtractionRepo;
  final ContactFetchService contactsRepo;
  CardSecondBloc(
    this._cardSecondRepo,
    this.cardScanningRepo,
    this.locationRepo,
    this.textExtractionRepo,
    this.contactsRepo,
  ) : super(CardSecondState.initial()) {
    on<ScanImage>(scanImage);
    on<ProcessImageScanning>(processImageScanning);
    on<ProcessImageScanningInfo>(processImageScanningInfo);
    on<RemoveImageScanning>(removeImageScanning);
    on<SelfieImage>(selfieImage);
    on<SelfieimageClear>(selfieimageClear);
    on<AutoFillTExtfieldItems>(autoFillTExtfieldItems);
    on<MeetingRelatedInfo>(meetingRelatedInfo);
    on<GetAllCardsSecond>(getAllCardsSecond);
    on<GetCardSecondEvent>(getCardSecondEvent);
    on<DeleteCardSecond>(deleteCardSecond);
    on<GetDeleteCardSecond>(getDeleteCardSecond);
    on<GetDeleteCardSecondEvent>(getDeleteCardSecondEvent);
    on<RestoreDeleteCardSecond>(restoreDeleteCardSecond);
    on<GetSecondCardDetail>(getSecondCardDetail);
    on<UpdateCardSecond>(updateCardSecond);
    on<Clear>(clear);
    on<ImageClear>(imageClear);
    on<CardFeildClearing>(cardFeildClearing);
    on<LocationGeting>(locationGeting);
    on<ContactSaveToPhone>(contactSaveToPhone);
    on<SeccondCardShare>(seccondCardShare);
    on<RemoveSelfieIndexImages>(removeSelfieIndexImages);
    on<AddSelfieIndexImages>(addSelfieIndexImages);
  }

  FutureOr<void> addSelfieIndexImages(AddSelfieIndexImages event, emit) async {
    emit(state.copyWith(
      isLoading: true,
      cardScanFinish: false,
      hasError: false,
      message: null,
      updated: false,
    ));
    await _cardSecondRepo.addSelfieImage(selfies: event.addSelfieModel);
    add(CardSecondEvent.updateCardSecond(
        secondCard: event.secondCard, id: event.id));
  }

  FutureOr<void> removeSelfieIndexImages(RemoveSelfieIndexImages event, emit) {
    _cardSecondRepo.removeSelfieImage(id: event.id);
  }

  FutureOr<void> seccondCardShare(SeccondCardShare event, emit) async {
    emit(state.copyWith(
      isLoading: true,
      cardScanFinish: false,
      hasError: false,
    ));
    final data = await _cardSecondRepo.secondCardShareAsAImage(id: event.id);
    data.fold((l) => emit(state.copyWith(isLoading: false, hasError: true)),
        (r) => emit(state.copyWith(isLoading: false, hasError: false)));
  }

  FutureOr<void> contactSaveToPhone(ContactSaveToPhone event, emit) async {
    emit(state.copyWith(
        cardScanFinish: false,
        contactAddError: false,
        contactAddLoading: true,
        contactAdded: false));
    final data =
        await contactsRepo.addNewContact(addNewContact: event.addNewContact);
    data.fold(
        (l) => emit(state.copyWith(
              cardScanFinish: false,
              contactAddError: true,
              contactAddLoading: false,
              contactAdded: false,
            )),
        (r) => emit(state.copyWith(
              contactAddError: false,
              contactAddLoading: false,
              contactAdded: true,
              cardScanFinish: false,
            )));
  }

  FutureOr<void> processImageScanningInfo(
      ProcessImageScanningInfo event, emit) async {
    emit(state.copyWith(
      scannedImageDatasModel: null,
      isLoading: true,
      imagePickError: false,
      hasError: false,
      cardScanFinish: false,
    ));
    List<String> images = [];
    images = event.images
        .map((e) =>
            e.base64.startsWith('data') ? e.base64.substring(22) : e.base64)
        .toList();
    final result = await textExtractionRepo.extractText(
        image: TextExtractionimageModel(images: images));
    result.fold(
        (l) => emit(state.copyWith(
              cardScanFinish: false,
            )), (r) {
      final texts = ScannedImageDatasModel(
        emails: r.emails,
        names: r.names,
        phone: r.phoneNumbers,
        websites: r.websites,
        designations: r.designations,
        unknown: [],
      );
      emailController.text =
          r.emails != null && r.emails!.isNotEmpty ? r.emails!.first : '';
      nameController.text =
          r.names != null && r.names!.isNotEmpty ? r.names!.first : '';
      phoneController.text =
          r.phoneNumbers != null && r.phoneNumbers!.isNotEmpty
              ? r.phoneNumbers!.first
              : '';
      designationController.text =
          r.designations != null && r.designations!.isNotEmpty
              ? r.designations!.first
              : '';
      emit(state.copyWith(
        scannedImageDatasModel: texts,
        message: null,
        cardScanFinish: true,
        isLoading: false,
      ));
    });
  }

  FutureOr<void> locationGeting(LocationGeting event, emit) async {
    emit(state.copyWith(contactAdded: false));
    if (state.locationAdress != null) return;
    emit(state.copyWith(
        cardScanFinish: false,
        locationfetchError: false,
        locationFetchLoading: true,
        contactAdded: false));
    final location = await locationRepo.getLoation();
    location.fold(
      (l) => emit(state.copyWith(
        locationAdress: null,
        cardScanFinish: false,
        contactAdded: false,
        locationfetchError: true,
        locationFetchLoading: false,
      )),
      (r) {
        locatioNController.text = r;
        if (locatioNController.text == '') {
          emit(state.copyWith(
            contactAdded: false,
            locationAdress: '',
            cardScanFinish: false,
            locationfetchError: false,
            locationFetchLoading: false,
          ));
        }
        emit(state.copyWith(
          contactAdded: false,
          locationAdress: r,
          cardScanFinish: false,
          locationfetchError: false,
          locationFetchLoading: false,
        ));
      },
    );
  }

  FutureOr<void> selfieimageClear(SelfieimageClear event, emit) {
    List<ImageModel>? list = List.from(state.selfieImageModel);
    log('${event.index}');
    list.removeAt(event.index);
    emit(
      state.copyWith(
        selfieImageModel: list,
        selfieImagePickerror: false,
        cardScanFinish: false,
      ),
    );
  }

  FutureOr<void> cardFeildClearing(CardFeildClearing event, emit) {
    nameController.clear();
    state.locationAdress == null;
    emailController.clear();
    copanyController.clear();
    phoneController.clear();
    webSiteController.clear();
    designationController.clear();
    occationController.clear();
    locatioNController.clear();
    occupationController.clear();
    notesController.clear();
  }

  FutureOr<void> imageClear(ImageClear event, emit) {
    emit(state.copyWith(
      cardScanFinish: false,
      scannedImageDatasModel: null,
      selfieImageModel: [],
      scannedImagesSecondCardCreation: [],
    ));
  }

  FutureOr<void> clear(Clear devent, emit) {
    emit(CardSecondState.initial());
  }

  FutureOr<void> getSecondCardDetail(GetSecondCardDetail event, emit) async {
    emit(state.copyWith(
      isLoading: true,
      hasError: false,
      cardScanFinish: false,
    ));
    final data = await _cardSecondRepo.getCardSecond(id: event.id);
    data.fold(
        (l) => emit(state.copyWith(
              isLoading: false,
              hasError: true,
              cardScanFinish: false,
            )), (r) {
      emit(state.copyWith(
        isLoading: false,
        cardScanFinish: false,
        hasError: false,
        getSecondCardModel: r,
      ));
    });
  }

  FutureOr<void> restoreDeleteCardSecond(
      RestoreDeleteCardSecond event, emit) async {
    emit(state.copyWith(
      isLoading: true,
      cardScanFinish: false,
      hasError: false,
      seondCardRestored: false,
    ));
    final data = await _cardSecondRepo.restoreDeleteSecondCardEvent(
      id: event.id,
      cardActionRewuestModel: event.cardActionRewuestModel,
    );
    data.fold(
        (l) => emit(state.copyWith(
              isLoading: false,
              cardScanFinish: false,
              seondCardRestored: false,
              hasError: true,
            )), (r) {
      emit(state.copyWith(
        isLoading: false,
        cardScanFinish: false,
        hasError: false,
        seondCardRestored: true,
        message: 'Card restored',
      ));
      add(const CardSecondEvent.getDeleteCardSecond(isLoad: true));
      add(const CardSecondEvent.getAllCardsSecond(isLoad: true));
    });
  }

  FutureOr<void> getDeleteCardSecondEvent(
      GetDeleteCardSecondEvent event, emit) async {
    emit(state.copyWith(
      cardScanFinish: false,
      deleteSecondCardEventLoading: true,
      hasError: false,
      seondCardRestored: false,
    ));
    final data = await _cardSecondRepo.getDeleteSecondCardEvent(
        pageQuery: PageQuery(page: ++deletedCards));
    data.fold(
        (l) => emit(state.copyWith(
            cardScanFinish: false,
            deleteSecondCardEventLoading: false,
            hasError: true)), (r) {
      emit(state.copyWith(
        deleteSecondCardEventLoading: false,
        hasError: false,
        cardScanFinish: false,
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
      cardScanFinish: false,
      secondCardDeleted: false,
    ));
    final data = await _cardSecondRepo.getDeleteSecondCard(
        pageQuery: PageQuery(page: deletedCards));
    data.fold(
        (l) => emit(state.copyWith(
              secondCardDeleted: false,
              deleteSecondCardLoading: false,
              hasError: true,
              cardScanFinish: false,
            )), (r) {
      log('getDeleteSecondCard length ${r.secondCards?.length}');
      emit(
        state.copyWith(
          secondCardDeleted: false,
          deleteSecondCardLoading: false,
          hasError: false,
          cardScanFinish: false,
          deleteSecondCards: r.secondCards ?? [],
        ),
      );
    });
  }

  FutureOr<void> deleteCardSecond(DeleteCardSecond event, emit) async {
    emit(state.copyWith(
      cardScanFinish: false,
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
        secondCardLoading: false,
        hasError: true,
        cardScanFinish: false,
        secondCardDeleted: false,
      )),
      (r) {
        emit(
          state.copyWith(
            cardScanFinish: false,
            secondCardLoading: false,
            hasError: false,
            secondCardDeleted: true,
          ),
        );
        add(const CardSecondEvent.getAllCardsSecond(isLoad: true));
      },
    );
  }

  FutureOr<void> meetingRelatedInfo(MeetingRelatedInfo event, emit) async {
    state.cardSecondCreateRequestModel.selfie =
        event.selfieImage!.map((e) => Selfie(selfie: e.base64)).toList();
    state.cardSecondCreateRequestModel.occupation = event.occupation;
    state.cardSecondCreateRequestModel.location = event.location;
    state.cardSecondCreateRequestModel.notes = event.notes;
    state.cardSecondCreateRequestModel.whereWeMet = event.occation;
    emit(state.copyWith(
      contactAdded: false,
      locationfetchError: false,
      isLoading: true,
      hasError: false,
      message: null,
      selfieImagePickerror: false,
      cardScanFinish: false,
      secondCardcreated: false,
    ));
    final data = await _cardSecondRepo.cardSecondCreation(
      cardSecondCreateRequestModel: state.cardSecondCreateRequestModel,
    );
    data.fold(
      (l) => emit(state.copyWith(
        selfieImagePickerror: false,
        cardScanFinish: false,
        isLoading: false,
        hasError: true,
        secondCardcreated: false,
      )),
      (r) async {
        emit(
          state.copyWith(
            isLoading: false,
            cardScanFinish: false,
            hasError: false,
            cardSecondResponseModel: r,
            secondCardcreated: true,
          ),
        );
        add(const CardSecondEvent.getAllCardsSecond(isLoad: true));
        add(const CardSecondEvent.cardFeildClearing());
      },
    );
  }

  FutureOr<void> autoFillTExtfieldItems(AutoFillTExtfieldItems event, emit) {
    emit(state.copyWith(cardScanFinish: false));
    state.cardSecondCreateRequestModel.image = event.scannedImage;
    state.cardSecondCreateRequestModel.name = event.name;
    state.cardSecondCreateRequestModel.company = event.company;
    state.cardSecondCreateRequestModel.designation = event.designation;
    state.cardSecondCreateRequestModel.phoneNumber = event.number;
    state.cardSecondCreateRequestModel.website = event.website;
    state.cardSecondCreateRequestModel.email = event.email;
  }

  FutureOr<void> selfieImage(SelfieImage event, emit) async {
    emit(state.copyWith(
        cardScanFinish: false,
        contactAdded: false,
        pickSelfieCardLoading: true,
        selfieImagePickerror: false,
        locationfetchError: false));
    final selfieImage = await ImagePickerClass.getImage(
      camera: event.isCam,
      cameraDeviceFront: event.cameraDeviceFront,
    );
    if (selfieImage != null) {
      emit(
        state.copyWith(
          cardScanFinish: false,
          selfieImagePickerror: false,
          pickSelfieCardLoading: false,
          selfieImageModel: [selfieImage, ...state.selfieImageModel],
        ),
      );
    } else {
      emit(state.copyWith(
        selfieImageModel: [],
        cardScanFinish: false,
        pickSelfieCardLoading: false,
        selfieImagePickerror: true,
      ));
    }
  }

  FutureOr<void> scanImage(ScanImage event, emit) async {
    emit(state.copyWith(
        pickImageLoading: true, imagePickError: false, cardScanFinish: false));
    final scanGalleryImage = await ImagePickerClass.getImage(
        camera: event.isCam, cameraDeviceFront: event.isFront);
    if (scanGalleryImage != null) {
      emit(
        state.copyWith(
          imagePickError: false,
          scannedImagesSecondCardCreation: [
            ...state.scannedImagesSecondCardCreation,
            scanGalleryImage,
          ],
          pickImageLoading: false,
          cardScanFinish: false,
        ),
      );
    } else {
      emit(state.copyWith(
        pickImageLoading: false,
        cardScanFinish: false,
        imagePickError: true,
      ));
    }
  }

  FutureOr<void> processImageScanning(ProcessImageScanning event, emit) async {
    emit(state.copyWith(
      scannedImageDatasModel: null,
      isLoading: true,
      imagePickError: false,
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
    emit(state.copyWith(imagePickError: false));
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
        updated: false,
        seondCardRestored: false,
        cardScanFinish: false,
        secondCardDeleted: false,
        locationAdress: null,
        secondCardcreated: false));
    secondCard = 1;
    final data = await _cardSecondRepo.getAllCardsSecond(
        pageQuery: PageQuery(page: secondCard));
    data.fold(
      (l) => emit(state.copyWith(
        locationAdress: null,
        secondCardLoading: false,
        hasError: true,
        message: null,
        updated: false,
        seondCardRestored: false,
        secondCardDeleted: false,
        secondCardcreated: false,
        cardScanFinish: false,
      )),
      (r) => emit(state.copyWith(
        locationAdress: null,
        secondCardLoading: false,
        hasError: false,
        updated: false,
        secondCards: r.results ?? [],
        seondCardRestored: false,
        secondCardDeleted: false,
        secondCardcreated: false,
        cardScanFinish: false,
      )),
    );
  }

  FutureOr<void> updateCardSecond(UpdateCardSecond event, emit) async {
    emit(state.copyWith(
      isLoading: true,
      cardScanFinish: false,
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
              cardScanFinish: false,
            )), (r) {
      emit(state.copyWith(
        isLoading: false,
        cardScanFinish: false,
        hasError: false,
        updated: true,
        cardSecondResponseModel: r,
      ));
      add(const CardSecondEvent.getAllCardsSecond(isLoad: true));
    });
  }

  FutureOr<void> getCardSecondEvent(GetCardSecondEvent event, emit) async {
    emit(state.copyWith(
      secondCardEventLoading: true,
      hasError: false,
      message: null,
      cardScanFinish: false,
      updated: false,
    ));
    final data = await _cardSecondRepo.getAllCardsSecond(
        pageQuery: PageQuery(page: ++secondCard));
    data.fold(
      (l) => emit(state.copyWith(
        secondCardEventLoading: false,
        hasError: true,
      )),
      (r) => emit(state.copyWith(
        secondCardEventLoading: false,
        hasError: false,
        secondCards: [
          ...state.secondCards,
          ...r.results ?? [],
        ],
      )),
    );
  }
}