import 'dart:async';
import 'package:bizkit/application/presentation/utils/image_picker/image_picker.dart';
import 'package:bizkit/data/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/domain/model/card/card/accolade/accolade.dart';
import 'package:bizkit/domain/model/card/card/card/card.dart';
import 'package:bizkit/domain/model/card/card/dates_to_remember/dates_to_remember.dart';
import 'package:bizkit/domain/model/card/card/personal_data/personal_details.dart';
import 'package:bizkit/domain/model/card/card/social_media/social_media_handle.dart';
import 'package:bizkit/domain/model/card/create_card/accolades/accolade.dart';
import 'package:bizkit/domain/model/card/create_card/company/get_business_category_response_model/category.dart';
import 'package:bizkit/domain/model/card/create_card/dates_to_remember/dates_to_remember.dart';
import 'package:bizkit/domain/model/card/create_card/personal_details/personal_details.dart';
import 'package:bizkit/domain/model/card/create_card/social_media_handle/social_media_handle.dart';
import 'package:bizkit/domain/model/card_first/creation/card_first_creation_model/card_first_creation_model.dart';
import 'package:bizkit/domain/model/card_first/creation/patch_personal_data/patch_personal_data.dart';
import 'package:bizkit/domain/model/image/image_model.dart';
import 'package:bizkit/domain/model/scanned_image_datas_model/scanned_image_datas_model.dart';
import 'package:bizkit/domain/model/commen/success_response_model/success_response_model.dart';
import 'package:bizkit/domain/repository/feature/card_scanning_repo.dart';
import 'package:bizkit/domain/repository/service/card_patch_repo.dart';
import 'package:bizkit/domain/repository/service/card_repo.dart';
import 'package:bizkit/domain/repository/sqflite/user_local_repo.dart';
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
      this.cardPatchRepo)
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
    on<CreatePersonalData>(createPersonalData);
    on<CreateCard>(createCard);
    on<GetCurrentCard>(getCurrentCard);
    on<Clear>(clear);
  }

  FutureOr<void> createCard(CreateCard event, emit) async {
    emit(state.copyWith(
        isLoading: true, hasError: false, message: null, cardAdded: null));
    print('card creation requested 1');

    // print('card creation requested');

    // print(event.createCardByIdModel.toJson());
    // print('card creation requested 2');
    // event.createCardByIdModel.isVerified =
    //     event.createCardByIdModel.isVerified ??
    //         await SecureStorage.isVerified();

    final result = await cardService.createCard(
        cardFirstCreationModel: event.cardFirstCreationModel);
    result.fold((l) {
      print('card creation request failed');
      return emit(
          state.copyWith(isLoading: false, hasError: true, message: l.message));
    }, (r) {
      print('card creation success');
      SecureStorage.setHasCard(hasCard: true);
      return emit(
          state.copyWith(isLoading: false, message: r.message, cardAdded: r));
    });
  }

  FutureOr<void> createPersonalData(CreatePersonalData event, emit) async {
    emit(state.copyWith(
        isLoading: true, hasError: false, message: null, personalData: null));
    final PatchPersonalData personalData = PatchPersonalData(
        businessCategoryId: 1,
        bloodGroup: bloodGroup.text.isNotEmpty
            ? bloodGroup.text
            : state.currentCard?.personalDetails?.bloodGroup,
        dateOfBirth: birthDaycontroller.text.isNotEmpty
            ? birthDaycontroller.text
            : state.currentCard?.personalDetails?.dateOfBirth,
        homeAddress: homeAddress.text.isNotEmpty
            ? homeAddress.text
            : state.currentCard?.personalDetails?.homeAddress,
        designation: state.currentCard?.personalDetails?.designation,
        email: state.currentCard?.personalDetails?.email,
        name: state.currentCard?.personalDetails?.name,
        phoneNumber: state.currentCard?.personalDetails?.phoneNumber,
        photos: state.currentCard?.personalDetails?.photos);
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
        cardAdded: null,
        message: null,
        currentCard: event.card,
        accolades: event.card.accolades ?? [],
        datesToRemember: event.card.datesToRemember ?? []));
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
        cardAdded: null, message: null, datesToRememberLoading: true));
    final result = await cardPatchRepo.addDatesToRemember(
        datesToRemember: event.datesToRemember);
    result.fold((l) => emit(state.copyWith(datesToRememberLoading: false)),
        (r) {
      return (state.copyWith(
          datesToRememberLoading: false,
          datesToRemember: [...state.datesToRemember, r]));
    });
  }

  FutureOr<void> removeDateToRemember(RemoveDateToRemember event, emit) async {
    emit(state.copyWith(
        cardAdded: null, message: null, datesToRememberDeleteLoading: true));
    final result = await cardPatchRepo.deleteAccolades(id: event.id);
    result.fold(
        (l) => emit(state.copyWith(datesToRememberDeleteLoading: false)), (r) {
      List<DatesToRemember> list = List.from(state.datesToRemember);
      list.removeWhere((element) => element.id == event.id);
      return (state.copyWith(
          datesToRememberDeleteLoading: false, datesToRemember: list));
    });
  }

  FutureOr<void> addSocialMedia(AddSocialMedia event, emit) async {
    emit(state.copyWith(
        cardAdded: null, message: null, socialMediaLoading: true));
    final result = await cardPatchRepo.addSocialMedia(
        socialMediaHandle: event.socialMediaHandle);
    result.fold((l) => emit(state.copyWith(socialMediaLoading: false)), (r) {
      return (state.copyWith(
          socialMediaLoading: false, socialMedias: [...state.socialMedias, r]));
    });
  }

  FutureOr<void> removeSocialMedia(RemoveSocialMedia event, emit) async {
    emit(state.copyWith(
        cardAdded: null, message: null, socialMediaDeleteLoading: true));
    final result = await cardPatchRepo.deleteSocialMedia(id: event.id);
    result.fold((l) => emit(state.copyWith(socialMediaDeleteLoading: false)),
        (r) {
      List<SocialMediaHandle> list = List.from(state.socialMedias);
      list.removeWhere((element) => element.id == event.id);
      return (state.copyWith(
          socialMediaDeleteLoading: false, socialMedias: list));
    });
  }

  FutureOr<void> addAccolade(AddAccolade event, emit) async {
    emit(state.copyWith(cardAdded: null, message: null, accoladeLoading: true));
    final result = await cardPatchRepo.addAccolades(accolade: event.accolade);
    result.fold((l) => emit(state.copyWith(accoladeLoading: false)), (r) {
      return (state.copyWith(
          accoladeLoading: false, accolades: [...state.accolades, r]));
    });
  }

  FutureOr<void> removeAccolade(RemoveAccolade event, emit) async {
    emit(state.copyWith(
        cardAdded: null, message: null, accoladeDeleteLoading: true));
    final result = await cardPatchRepo.deleteAccolades(id: event.id);
    result.fold((l) => emit(state.copyWith(accoladeDeleteLoading: false)), (r) {
      List<Accolade> accolade = List.from(state.accolades);
      accolade.removeWhere((element) => element.id == event.id);
      return (state.copyWith(
          accoladeDeleteLoading: false, accolades: accolade));
    });
  }

  FutureOr<void> pickUserPhotos(PickUserPhotos event, emit) async {
    final img = await ImagePickerClass.getImage(camera: false);
    if (img != null) {
      emit(state.copyWith(userPhotos: img, cardAdded: null, message: null));
    }
  }

  FutureOr<void> removeUserPhoto(RemoveUserPhoto event, emit) async {
    emit(state.copyWith(userPhotos: null, cardAdded: null, message: null));
  }

  FutureOr<void> removeImageScanning(RemoveImageScanning event, emit) async {
    final List<ImageModel> list = [];
    for (ImageModel img in state.scannedImagesCardCreation) {
      if (state.scannedImagesCardCreation[event.index] != img) list.add(img);
    }
    emit(state.copyWith(
        scannedImagesCardCreation: list, cardAdded: null, message: null));
  }

  FutureOr<void> processImageScanning(ProcessImageScanning event, emit) async {
    final result = await cardScanningImpl
        .processAndSortFromImage(state.scannedImagesCardCreation);
    result.fold(
        (failure) => null,
        (scannedImageText) => emit(state.copyWith(
            scannedImageDatasModel: scannedImageText,
            cardAdded: null,
            message: null)));
  }

  FutureOr<void> pickImageScanning(PickImageScanning event, emit) async {
    final image = await ImagePickerClass.getImage(camera: event.camera);
    if (image != null) {
      emit(state.copyWith(scannedImagesCardCreation: [
        ...state.scannedImagesCardCreation,
        image
      ], cardAdded: null, message: null));
    }
  }

  FutureOr<void> getUserDetail(GetUserDetail event, emit) async {
    final result = await userLocalService.getUserData();
    result.fold((failure) => null, (userList) {
      if (userList.isNotEmpty) {
        nameController.text = userList.first.name ?? nameController.text;
        phoneController.text =
            userList.first.phoneNumber ?? phoneController.text;
        emailController.text = userList.first.email ?? emailController.text;
      }
      emit(state.copyWith(
          cardAdded: null,
          message: null,
          isBusiness: userList.first.isBusiness!));
    });
  }

  FutureOr<void> getBusinessCategories(
      GetBusinessCategories event, emit) async {
    final result = await cardService.getBusinessCategories();
    result.fold((failure) => null, (getBusinessCategories) {
      print('get category => ${getBusinessCategories.businessCategories}');
      emit(state.copyWith(
          businessCategories: getBusinessCategories.businessCategories ?? []));
    });
  }
}
