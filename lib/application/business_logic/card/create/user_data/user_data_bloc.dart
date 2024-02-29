import 'dart:async';
import 'package:bizkit/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/application/presentation/utils/image_picker/image_picker.dart';
import 'package:bizkit/domain/model/card/create_card/accolades/accolade.dart';
import 'package:bizkit/domain/model/card/create_card/company/get_business_category_response_model/category.dart';
import 'package:bizkit/domain/model/card/create_card/dates_to_remember/dates_to_remember.dart';
import 'package:bizkit/domain/model/card/create_card/personal_details/personal_details.dart';
import 'package:bizkit/domain/model/card/create_card/social_media_handle/social_media_handle.dart';
import 'package:bizkit/domain/model/card/create_card_by_id_model/create_card_by_id_model.dart';
import 'package:bizkit/domain/model/image/image_model.dart';
import 'package:bizkit/domain/model/scanned_image_datas_model/scanned_image_datas_model.dart';
import 'package:bizkit/domain/model/commen/success_response_model/success_response_model.dart';
import 'package:bizkit/domain/repository/feature/card_scanning_repo.dart';
import 'package:bizkit/domain/repository/service/card_repo.dart';
import 'package:bizkit/domain/repository/sqflite/user_local_repo.dart';
import 'package:flutter/material.dart';
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

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController homeAddress = TextEditingController();
  final TextEditingController bloodGroup = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController birthDaycontroller = TextEditingController();
  final TextEditingController businessCategoryController =
      TextEditingController();

  UserDataBloc(this.cardScanningImpl, this.userLocalService, this.cardService)
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
    on<Clear>(clear);
  }

  FutureOr<void> createCard(CreateCard event, emit) async {
    emit(state.copyWith(
        isLoading: true, hasError: false, message: null, cardAdded: null));
    print('card creation requested');
    print(event.createCardByIdModel.toJson());
    print('card creation requested');
    final user = await userLocalService.getUserData();
    user.fold((l) => null, (r) {
      event.createCardByIdModel.isVerified =
          r.first.isVerified ?? event.createCardByIdModel.isVerified;
    });
    final result = await cardService.createCard(
        createCardByIdModel: event.createCardByIdModel);
    result.fold((l) {
      print('card creation request failed');
      return emit(
          state.copyWith(isLoading: false, hasError: true, message: l.message));
    }, (r) {
      print('card creation success');

      return emit(
          state.copyWith(isLoading: false, message: r.message, cardAdded: r));
    });
  }

  FutureOr<void> createPersonalData(CreatePersonalData event, emit) async {
    // if (state.personalDataCreateId != null) return;
    emit(state.copyWith(isLoading: true, hasError: false, message: null));
    final personalData = PersonalDetailsCreate(
        name: nameController.text.isEmpty ? null : nameController.text,
        phoneNumber: phoneController.text.isEmpty ? null : phoneController.text,
        email: emailController.text.isEmpty ? null : emailController.text,
        designation: designationController.text.isEmpty
            ? null
            : designationController.text,
        businessCategory: businessCategoryController.text.isEmpty
            ? null
            : state.businessCategories
                .firstWhere((element) =>
                    element.category == businessCategoryController.text.trim())
                .id,
        homeAddress: homeAddress.text.isEmpty ? null : homeAddress.text,
        bloodGroup: bloodGroup.text.isEmpty ? null : bloodGroup.text,
        dateOfBirth:
            birthDaycontroller.text.isEmpty ? null : birthDaycontroller.text,
        datesToRemember:
            state.datesToRemember.isEmpty ? [] : state.datesToRemember,
        accolades: state.accolades.isEmpty
            ? []
            : state.accolades
                .map((e) => AccoladeCreate(
                    accolades: e.accolades,
                    accoladesDescription: e.accoladesDescription,
                    accoladesImage: e.accoladesImage.base64))
                .toList(),
        photos: state.userPhotos?.base64,
        personalSocialMedia:
            state.socialMedias.isEmpty ? [] : state.socialMedias);
    print(personalData.toJson());
    final result = await cardService.createPersonalDataCard(
        personalDetailsCreate: personalData);
    result.fold(
        (failure) => emit(state.copyWith(
            personalDetails: personalData,
            personalDataCreateId: null,
            hasError: true,
            isLoading: false)),
        (personalDetails) => emit(state.copyWith(
            personalDetails: personalData,
            message: null,
            personalDataCreateId: personalDetails.id,
            isLoading: false)));
  }

  FutureOr<void> clear(Clear event, emit) async {
    emit(state.copyWith());
  }

  FutureOr<void> addDateToRemember(AddDateToRemember event, emit) async {
    final List<DatesToRememberCreate> list = List.from(state.datesToRemember);
    list.add(event.datesToRemember);
    emit(state.copyWith(datesToRemember: list, cardAdded: null, message: null));
  }

  FutureOr<void> removeDateToRemember(RemoveDateToRemember event, emit) async {
    final List<DatesToRememberCreate> list = [];
    for (DatesToRememberCreate datesToRemember in state.datesToRemember) {
      if (state.datesToRemember[event.index] != datesToRemember) {
        list.add(datesToRemember);
      }
    }
    emit(state.copyWith(datesToRemember: list, cardAdded: null, message: null));
  }

  FutureOr<void> addSocialMedia(AddSocialMedia event, emit) async {
    final List<SocialMediaHandleCreate> list = List.from(state.socialMedias);
    list.add(event.socialMediaHandle);
    emit(state.copyWith(socialMedias: list, cardAdded: null, message: null));
  }

  FutureOr<void> removeSocialMedia(RemoveSocialMedia event, emit) async {
    final List<SocialMediaHandleCreate> list = [];
    for (SocialMediaHandleCreate socialMediaHandle in state.socialMedias) {
      if (state.socialMedias[event.index] != socialMediaHandle) {
        list.add(socialMediaHandle);
      }
    }
    emit(state.copyWith(socialMedias: list, cardAdded: null, message: null));
  }

  FutureOr<void> addAccolade(AddAccolade event, emit) async {
    final List<AccoladeCreate> list = List.from(state.accolades);
    list.add(event.accolade);
    emit(state.copyWith(accolades: list, cardAdded: null, message: null));
  }

  FutureOr<void> removeAccolade(RemoveAccolade event, emit) async {
    final List<AccoladeCreate> list = [];
    for (AccoladeCreate accolade in state.accolades) {
      if (state.accolades[event.index] != accolade) list.add(accolade);
    }
    emit(state.copyWith(accolades: list, cardAdded: null, message: null));
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
