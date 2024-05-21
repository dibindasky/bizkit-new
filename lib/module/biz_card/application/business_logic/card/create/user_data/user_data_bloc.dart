import 'dart:async';
import 'package:bizkit/module/biz_card/data/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/module/biz_card/domain/model/card/card/accolade/accolade.dart';
import 'package:bizkit/module/biz_card/domain/model/card/card/accolade/accolade_image_adding_model/accolade_image_adding_model.dart';
import 'package:bizkit/module/biz_card/domain/model/card/card/card/card.dart';
import 'package:bizkit/module/biz_card/domain/model/card/card/dates_to_remember/dates_to_remember.dart';
import 'package:bizkit/module/biz_card/domain/model/card/card/image_card/image_card.dart';
import 'package:bizkit/module/biz_card/domain/model/card/card/personal_data/personal_details.dart';
import 'package:bizkit/module/biz_card/domain/model/card/card/personal_data/personal_details_images/personal_details_images.dart';
import 'package:bizkit/module/biz_card/domain/model/card/card/photo/photo.dart';
import 'package:bizkit/module/biz_card/domain/model/card/card/social_media/social_media_handle.dart';
import 'package:bizkit/module/biz_card/domain/model/card/company/get_business_category_response_model/category.dart';
import 'package:bizkit/module/biz_card/domain/model/card_first/creation/card_first_creation_model/card_first_creation_model.dart';
import 'package:bizkit/module/biz_card/domain/model/card_first/creation/card_first_creation_model/personal_photo.dart';
import 'package:bizkit/module/biz_card/domain/model/card_first/creation/patch_personal_data/patch_personal_data.dart';
import 'package:bizkit/module/biz_card/domain/model/extracted_text_model/text_extractionimage_model/text_extractionimage_model.dart';
import 'package:bizkit/core/model/image/image_model.dart';
import 'package:bizkit/module/biz_card/domain/model/scanned_image_datas_model/scanned_image_datas_model.dart';
import 'package:bizkit/module/biz_card/domain/repository/feature/card_scanning_repo.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/card_patch_repo.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/card_repo.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/text_extraction_repo.dart';
import 'package:bizkit/module/biz_card/domain/repository/sqflite/user_local_repo.dart';
import 'package:bizkit/utils/image_picker/image_picker.dart';
import 'package:flutter/material.dart' as mat;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'user_data_event.dart';
part 'user_data_state.dart';
part 'user_data_bloc.freezed.dart';

@injectable
class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  final CardScanningRepo cardScanningImpl;
  final UserLocalRepo userLocalService;
  final CardRepo cardService;
  final CardPatchRepo cardPatchRepo;
  final TextExtractionRepo textExtractionRepo;

  final mat.TextEditingController nameController = mat.TextEditingController();
  final mat.TextEditingController phoneController = mat.TextEditingController();
  final mat.TextEditingController emailController = mat.TextEditingController();
  final mat.TextEditingController homeAddress = mat.TextEditingController();
  final mat.TextEditingController bloodGroup = mat.TextEditingController();
  final mat.TextEditingController designationController =
      mat.TextEditingController();
  final mat.TextEditingController birthDaycontroller =
      mat.TextEditingController();
  final mat.TextEditingController businessCategoryController =
      mat.TextEditingController();

  UserDataBloc(this.cardScanningImpl, this.userLocalService, this.cardService,
      this.textExtractionRepo, this.cardPatchRepo)
      : super(UserDataState.initial()) {
    on<PickImageScanning>(pickImageScanning);
    on<ProcessImageScanning>(processImageScanning);
    on<RemoveImageScanning>(removeImageScanning);
    on<GetUserDetail>(getUserDetail);
    on<GetBusinessCategories>(getBusinessCategories);
    on<PickUserPhotos>(pickUserPhotos);
    on<RemoveUserPhoto>(removeUserPhoto);
    on<AddAccolade>(addAccolade);
    on<RemoveAccolade>(removeAccolade);
    on<AddSocialMedia>(addSocialMedia);
    on<RemoveSocialMedia>(removeSocialMedia);
    on<AddDateToRemember>(addDateToRemember);
    on<RemoveDateToRemember>(removeDateToRemember);
    on<RemovePersonalImage>(removePersonalImage);
    on<RemoveAccoladeImage>(removeAccoladeImage);
    on<AddPersonalImage>(addPersonalImage);
    on<CreatePersonalData>(createPersonalData);
    on<CreateCard>(createCard);
    on<GetCurrentCard>(getCurrentCard);
    on<Clear>(clear);
  }

  FutureOr<void> createCard(CreateCard event, emit) async {
    emit(state.copyWith(
        datesToRememberAdded: false,
        fromBusinessCategoryGet: false,
        socialMediaAdded: false,
        personalImageAdded: false,
        accoladeAdded: false,
        scanningDone: false,
        isLoading: true,
        hasError: false,
        message: null,
        cardAdded: false));
    final result = await cardService.createCard(
        cardFirstCreationModel: event.cardFirstCreationModel);
    result.fold((l) {
      return emit(
          state.copyWith(isLoading: false, hasError: true, message: l.message));
    }, (r) {
      SecureStorage.setHasCard(hasCard: true);
      emit(state.copyWith(
        isLoading: false,
        message: r.message,
        cardAdded: true,
      ));
      add(UserDataEvent.clear());
    });
  }

  FutureOr<void> createPersonalData(CreatePersonalData event, emit) async {
    emit(state.copyWith(
        isLoading: true,
        fromBusinessCategoryGet: false,
        hasError: false,
        scanningDone: false,
        message: null,
        cardAdded: false,
        personalData: null,
        datesToRememberAdded: false,
        socialMediaAdded: false,
        accoladeAdded: false));
    final PatchPersonalData personalData = PatchPersonalData(
      businessCategoryId:
          state.currentCard?.personalDetails?.businessCategoryId,
      bloodGroup: bloodGroup.text.isNotEmpty
          ? bloodGroup.text
          : state.currentCard?.personalDetails?.bloodGroup,
      dateOfBirth: birthDaycontroller.text.isNotEmpty
          ? birthDaycontroller.text
          : state.currentCard?.personalDetails?.dateOfBirth,
      homeAddress: homeAddress.text.isNotEmpty
          ? homeAddress.text
          : state.currentCard?.personalDetails?.homeAddress,
      designation: designationController.text.isNotEmpty
          ? designationController.text
          : state.currentCard?.personalDetails?.designation,
      email: emailController.text.isNotEmpty
          ? emailController.text
          : state.currentCard?.personalDetails?.email,
      name: nameController.text.isNotEmpty
          ? nameController.text
          : state.currentCard?.personalDetails?.name,
      phoneNumber: phoneController.text.isNotEmpty
          ? phoneController.text
          : state.currentCard?.personalDetails?.phoneNumber,
      // photos: state.currentCard?.personalDetails?.photos
    );
    final result = await cardService.patchPersonalDetails(
        patchPersonalData: personalData,
        personalDataId: state.currentCard!.personalDetailsId!);
    result.fold(
        (failure) => emit(state.copyWith(
            personalData: null, hasError: true, isLoading: false)),
        (personalDetails) => emit(state.copyWith(
            message: null, personalData: personalDetails, isLoading: false)));
  }

  FutureOr<void> clear(Clear event, emit) async {
    nameController.clear();
    phoneController.clear();
    emailController.clear();
    homeAddress.clear();
    bloodGroup.clear();
    designationController.clear();
    birthDaycontroller.clear();
    businessCategoryController.clear();
    emit(UserDataState.initial());
  }

  FutureOr<void> getCurrentCard(GetCurrentCard event, emit) async {
    emit(state.copyWith(
        scannedImageDatasModel: ScannedImageDatasModel(
          emails: event.card.extractedTextModel?.emails,
          names: event.card.extractedTextModel?.names,
          phone: event.card.extractedTextModel?.phoneNumbers,
          websites: event.card.extractedTextModel?.websites,
        ),
        cardAdded: false,
        fromBusinessCategoryGet: false,
        message: null,
        scanningDone: false,
        accoladeAdded: false,
        datesToRememberAdded: false,
        socialMediaAdded: false,
        currentCard: event.card,
        socialMedias: event.card.socialMedia ?? [],
        accolades: event.card.accolades ?? [],
        datesToRemember: event.card.datesToRemember ?? [],
        personalImges: event.card.personalDetails?.photos
                ?.map((e) => ImageCard(image: e.photo, id: e.id))
                .toList() ??
            []));
    nameController.text = event.card.personalDetails?.name ?? '';
    emailController.text = event.card.personalDetails?.email ?? '';
    phoneController.text = event.card.personalDetails?.phoneNumber ?? '';
    bloodGroup.text = event.card.personalDetails?.bloodGroup ?? '';
    designationController.text = event.card.personalDetails?.designation ?? '';
    homeAddress.text = event.card.personalDetails?.homeAddress ?? '';
    birthDaycontroller.text = event.card.personalDetails?.dateOfBirth ?? '';
    businessCategoryController.text =
        event.card.personalDetails?.businessCategory?.category ?? '';
  }

  FutureOr<void> addDateToRemember(AddDateToRemember event, emit) async {
    emit(state.copyWith(
        accoladeAdded: false,
        socialMediaAdded: false,
        fromBusinessCategoryGet: false,
        cardAdded: false,
        personalImageAdded: false,
        message: null,
        datesToRememberAdded: false,
        scanningDone: false,
        datesToRememberLoading: true));
    final result = await cardPatchRepo.addDatesToRemember(
        datesToRemember: event.datesToRemember);
    result.fold((l) => emit(state.copyWith(datesToRememberLoading: false)),
        (r) {
      return emit(state.copyWith(
          datesToRememberLoading: false,
          datesToRememberAdded: true,
          datesToRemember: [...state.datesToRemember, r]));
    });
  }

  FutureOr<void> removeDateToRemember(RemoveDateToRemember event, emit) async {
    emit(state.copyWith(
        accoladeAdded: false,
        fromBusinessCategoryGet: false,
        datesToRememberAdded: false,
        socialMediaAdded: false,
        scanningDone: false,
        cardAdded: false,
        message: null,
        datesToRememberDeleteLoading: true));
    final result = await cardPatchRepo.deleteDatesToRemember(id: event.id);
    result.fold(
        (l) => emit(state.copyWith(datesToRememberDeleteLoading: false)), (r) {
      List<DatesToRemember> list = List.from(state.datesToRemember);
      list.removeWhere((element) => element.id == event.id);
      return emit(state.copyWith(
          datesToRememberDeleteLoading: false, datesToRemember: list));
    });
  }

  FutureOr<void> addSocialMedia(AddSocialMedia event, emit) async {
    emit(state.copyWith(
        accoladeAdded: false,
        fromBusinessCategoryGet: false,
        cardAdded: false,
        personalImageAdded: false,
        message: null,
        socialMediaLoading: true,
        scanningDone: false,
        datesToRememberAdded: false,
        socialMediaAdded: false));
    final result = await cardPatchRepo.addSocialMedia(
        socialMediaHandle: event.socialMediaHandle);
    result.fold((l) => emit(state.copyWith(socialMediaLoading: false)), (r) {
      return emit(state.copyWith(
          socialMediaAdded: true,
          datesToRememberAdded: false,
          socialMediaLoading: false,
          socialMedias: [...state.socialMedias, r]));
    });
  }

  FutureOr<void> removeSocialMedia(RemoveSocialMedia event, emit) async {
    emit(state.copyWith(
        accoladeAdded: false,
        scanningDone: false,
        datesToRememberAdded: false,
        socialMediaAdded: false,
        cardAdded: false,
        fromBusinessCategoryGet: false,
        message: null,
        socialMediaDeleteLoading: true));
    final result = await cardPatchRepo.deleteSocialMedia(id: event.id);
    result.fold((l) => emit(state.copyWith(socialMediaDeleteLoading: false)),
        (r) {
      List<SocialMediaHandle> list = List.from(state.socialMedias);
      list.removeWhere((element) => element.id == event.id);
      return emit(
          state.copyWith(socialMediaDeleteLoading: false, socialMedias: list));
    });
  }

  FutureOr<void> addAccolade(AddAccolade event, emit) async {
    emit(state.copyWith(
        cardAdded: false,
        message: null,
        personalImageAdded: false,
        scanningDone: false,
        accoladeLoading: true,
        fromBusinessCategoryGet: false,
        datesToRememberAdded: false,
        socialMediaAdded: false,
        accoladeAdded: false));
    if (event.edit) {
      final images = event.accolade.images ??
          <ImageCard>[].where((element) => element.id == null).toList();
      if (images.isNotEmpty) {
        await cardPatchRepo.uploadAccoladeImages(
            accoladeImageAddingModel: AccoladeImageAddingModel(
                accoladeId: event.accolade.id, image: images));
      }
      final result = await cardPatchRepo.updateAccolade(
          accolade: Accolade(
        accolades: event.accolade.accolades,
        accoladesDescription: event.accolade.accoladesDescription,
        date: event.accolade.date,
        cardId: event.accolade.cardId,
        id: event.accolade.id,
      ));
      result.fold((l) => emit(state.copyWith(accoladeLoading: false)), (r) {
        List<Accolade> accolade = List.from(state.accolades);
        final index = accolade.indexWhere((element) => element.id == r.id);
        accolade[index] = r;
        return emit(state.copyWith(
            accoladeAdded: true,
            accoladeLoading: false,
            fromBusinessCategoryGet: false,
            accolades: accolade));
      });
    } else {
      final result = await cardPatchRepo.addAccolades(accolade: event.accolade);
      result.fold(
          (l) => emit(state.copyWith(
              fromBusinessCategoryGet: false, accoladeLoading: false)), (r) {
        return emit(state.copyWith(
            accoladeAdded: true,
            fromBusinessCategoryGet: false,
            accoladeLoading: false,
            accolades: [...state.accolades, r]));
      });
    }
  }

  FutureOr<void> removeAccolade(RemoveAccolade event, emit) async {
    emit(state.copyWith(
        accoladeAdded: false,
        datesToRememberAdded: false,
        scanningDone: false,
        fromBusinessCategoryGet: false,
        socialMediaAdded: false,
        cardAdded: false,
        message: null,
        accoladeDeleteLoading: true));
    final result = await cardPatchRepo.deleteAccolades(id: event.id);
    result.fold((l) => emit(state.copyWith(accoladeDeleteLoading: false)), (r) {
      List<Accolade> accolade = List.from(state.accolades);
      accolade.removeWhere((element) => element.id == event.id);
      return emit(state.copyWith(
          accoladeDeleteLoading: false,
          accolades: accolade,
          fromBusinessCategoryGet: false));
    });
  }

  FutureOr<void> addPersonalImage(AddPersonalImage event, emit) async {
    emit(state.copyWith(
        cardAdded: false,
        message: null,
        scanningDone: false,
        personalImageAdded: false,
        personalImageLoading: true,
        fromBusinessCategoryGet: false,
        accoladeLoading: false,
        datesToRememberAdded: false,
        socialMediaAdded: false,
        accoladeAdded: false));
    final image = await ImagePickerClass.getImage(camera: event.cam);
    if (image == null) {
      return emit(state.copyWith(
          personalImageLoading: false, fromBusinessCategoryGet: false));
    }
    final result = await cardPatchRepo.addPersonalImage(
        personalDetailsImage: PersonalDetailsImages(
            personalDetailsId: state.currentCard?.personalDetailsId,
            photos: [Photo(photos: image.base64)]));
    result.fold((l) => emit(state.copyWith(personalImageLoading: false)), (r) {
      return emit(state.copyWith(
          personalImges: [
            ...state.personalImges,
            ...r.photos?.map((e) => ImageCard(image: e.photos, id: e.id)) ?? []
          ],
          personalImageAdded: true,
          fromBusinessCategoryGet: false,
          personalImageLoading: false));
    });
  }

  FutureOr<void> removePersonalImage(RemovePersonalImage event, emit) async {
    emit(state.copyWith(
        accoladeAdded: false,
        datesToRememberAdded: false,
        socialMediaAdded: false,
        fromBusinessCategoryGet: false,
        cardAdded: false,
        scanningDone: false,
        message: null,
        personalImageLoading: true));
    final result = await cardPatchRepo.removePersonalImage(id: event.id);
    result.fold((l) => emit(state.copyWith(personalImageLoading: false)), (r) {
      List<ImageCard> images = List.from(state.personalImges);
      images.removeWhere((element) => element.id == event.id);
      return emit(state.copyWith(
          personalImageLoading: false,
          fromBusinessCategoryGet: false,
          personalImges: images));
    });
  }

  FutureOr<void> removeAccoladeImage(RemoveAccoladeImage event, emit) async {
    await cardPatchRepo.deleteAccoladesImage(id: event.id);
  }

  FutureOr<void> pickUserPhotos(PickUserPhotos event, emit) async {
    final img = await ImagePickerClass.getImage(camera: event.cam);
    if (img != null) {
      emit(state.copyWith(
          userPhotos: [PersonalPhoto(photo: img.base64)],
          cardAdded: false,
          accoladeAdded: false,
          scanningDone: false,
          fromBusinessCategoryGet: false,
          datesToRememberAdded: false,
          socialMediaAdded: false,
          message: null));
    }
  }

  FutureOr<void> removeUserPhoto(RemoveUserPhoto event, emit) async {
    emit(state.copyWith(
        userPhotos: null,
        cardAdded: false,
        accoladeAdded: false,
        datesToRememberAdded: false,
        scanningDone: false,
        socialMediaAdded: false,
        fromBusinessCategoryGet: false,
        message: null));
  }

  FutureOr<void> removeImageScanning(RemoveImageScanning event, emit) async {
    final List<ImageModel> list = [];
    for (ImageModel img in state.scannedImagesCardCreation) {
      if (state.scannedImagesCardCreation[event.index] != img) list.add(img);
    }
    businessCategoryController.text = '';
    nameController.text = '';
    emailController.text = '';
    phoneController.text = '';
    designationController.text = '';
    emit(state.copyWith(
        scannedImagesCardCreation: list,
        cardAdded: false,
        scanningLoading: false,
        message: null,
        scanningDone: false,
        fromBusinessCategoryGet: false,
        datesToRememberAdded: false,
        socialMediaAdded: false,
        accoladeAdded: false));
  }

  FutureOr<void> processImageScanning(ProcessImageScanning event, emit) async {
    emit(state.copyWith(
        scannedImageDatasModel: null,
        scanningDone: false,
        scanningLoading: true,
        fromBusinessCategoryGet: false,
        cardAdded: false,
        accoladeAdded: false,
        datesToRememberAdded: false,
        socialMediaAdded: false,
        message: null));
    List<String> images = event.images
        .map((e) =>
            e.base64.startsWith('data') ? e.base64.substring(22) : e.base64)
        .toList();

    final result = await textExtractionRepo.extractText(
        image: TextExtractionimageModel(images: images));
    result.fold(
        (l) => emit(state.copyWith(
            scannedImageDatasModel: ScannedImageDatasModel(),
            scanningDone: true,
            scanningLoading: false,
            cardAdded: false,
            fromBusinessCategoryGet: false,
            accoladeAdded: false,
            datesToRememberAdded: false,
            socialMediaAdded: false,
            message: null)), (r) {
      final texts = ScannedImageDatasModel(
          emails: r.emails,
          names: r.names,
          phone: r.phoneNumbers,
          websites: r.websites,
          designations: r.designations,
          unknown: []);
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
      print(r.toJson());
      return emit(state.copyWith(
          scannedImageDatasModel: texts,
          scanningDone: true,
          scanningLoading: false,
          cardAdded: false,
          fromBusinessCategoryGet: false,
          accoladeAdded: false,
          datesToRememberAdded: false,
          socialMediaAdded: false,
          message: null));
    });
  }

  FutureOr<void> pickImageScanning(PickImageScanning event, emit) async {
    if (state.scannedImagesCardCreation.length >= 2) {
      emit(state.copyWith(
          accoladeAdded: false,
          datesToRememberAdded: false,
          scanningLoading: false,
          socialMediaAdded: false,
          scanningDone: false,
          fromBusinessCategoryGet: false,
          scannedImagesCardCreation: [],
          cardAdded: false,
          message: null));
    }
    final image = await ImagePickerClass.getImage(camera: event.camera);
    if (image != null) {
      emit(state.copyWith(
          accoladeAdded: false,
          datesToRememberAdded: false,
          scanningDone: false,
          fromBusinessCategoryGet: false,
          socialMediaAdded: false,
          scannedImagesCardCreation: [
            ...state.scannedImagesCardCreation,
            image
          ],
          cardAdded: false,
          message: null));
    }
  }

  FutureOr<void> getUserDetail(GetUserDetail event, emit) async {
    final result = await SecureStorage.getUserDetails();
    final business = await SecureStorage.getRole();

    if (!business) {
      nameController.text = result.name ?? nameController.text;
      phoneController.text = result.phoneNumber ?? phoneController.text;
      emailController.text = result.email ?? emailController.text;
    }
    emit(state.copyWith(
        cardAdded: false,
        accoladeAdded: false,
        scanningDone: false,
        datesToRememberAdded: false,
        fromBusinessCategoryGet: false,
        socialMediaAdded: false,
        message: null,
        isBusiness: business));
  }

  FutureOr<void> getBusinessCategories(
      GetBusinessCategories event, emit) async {
    final result = await cardService.getBusinessCategories();
    result.fold((failure) => null, (getBusinessCategories) {
      print('get category => ${getBusinessCategories.businessCategories}');
      emit(state.copyWith(
          accoladeAdded: false,
          datesToRememberAdded: false,
          fromBusinessCategoryGet: true,
          socialMediaAdded: false,
          scanningDone: false,
          businessCategories: getBusinessCategories.businessCategories ?? []));
    });
  }
}
