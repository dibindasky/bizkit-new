import 'dart:async';
import 'package:bizkit/application/presentation/utils/image_picker/image_picker.dart';
import 'package:bizkit/data/service/card/card_api.dart';
import 'package:bizkit/data/sqflite/sqflite_local_service.dart';
import 'package:bizkit/domain/model/card/create_card/accolades/accolade.dart';
import 'package:bizkit/domain/model/card/create_card/create_card_model/create_card_model.dart';
import 'package:bizkit/domain/model/card/create_card/dates_to_remember/dates_to_remember.dart';
import 'package:bizkit/domain/model/card/create_card/personal_details/personal_details.dart';
import 'package:bizkit/domain/model/card/create_card/photo/photo.dart';
import 'package:bizkit/domain/model/card/create_card/social_media_handle/social_media_handle.dart';
import 'package:bizkit/domain/model/image/image_model.dart';
import 'package:bizkit/domain/model/scanned_image_datas_model/scanned_image_datas_model.dart';
import 'package:bizkit/domain/model/success_response_model/success_response_model.dart';
import 'package:bizkit/domain/repository/feature/card_scanning.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'user_data_event.dart';
part 'user_data_state.dart';
part 'user_data_bloc.freezed.dart';

@injectable
class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  final CardScanningRepo cardScanningRepo;
  final LocalService localService;
  final CardService cardService;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController companylController = TextEditingController();
  final TextEditingController businessCategoryController =
      TextEditingController();
  final TextEditingController homeAddress = TextEditingController();
  final TextEditingController bloodGroup = TextEditingController();
  final TextEditingController birthDaycontroller = TextEditingController();

  UserDataBloc(this.cardScanningRepo, this.localService, this.cardService)
      : super(UserDataState.initial()) {
    on<PickImageScanning>(pickImageScanning);
    on<ProcessImageScanning>(processImageScanning);
    on<RemoveImageScanning>(removeImageScanning);
    on<GetUserDetail>(getUserDetail);
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
  }

  FutureOr<void> createCard(CreateCard event, emit) async {
    emit(state.copyWith(
        isLoading: true, hasError: false, message: null, cardAdded: null));
    print(event.createCardModel.toJson());
    print('card creation requested');
    final result =
        await cardService.createCard(createCardModel: event.createCardModel);
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
    final personalData = state.personalDetails.copyWith(
        name: nameController.text,
        phoneNumber: phoneController.text,
        email: emailController.text,
        company: companylController.text,
        businessCategory: businessCategoryController.text,
        homeAddress: homeAddress.text,
        bloodGroup: bloodGroup.text,
        dateOfBirth: birthDaycontroller.text,
        datesToRemember:
            state.datesToRemember.isEmpty ? [] : state.datesToRemember,
        accolades: state.accolades.isEmpty
            ? []
            : state.accolades
                .map((e) => Accolade(
                    accolades: e.accolades,
                    accoladesDescription: e.accoladesDescription,
                    accoladesImage: e.accoladesImage.multipartIamge))
                .toList(),
        photos: state.userPhotos.isEmpty
            ? []
            : state.userPhotos
                .map((e) => Photo(photos: e.multipartIamge))
                .toList(),
        personalSocialMedia:
            state.socialMedias.isEmpty ? [] : state.socialMedias);
    print(personalData.toJson());
    emit(state.copyWith(personalDetails: personalData));
  }

  FutureOr<void> addDateToRemember(AddDateToRemember event, emit) async {
    final List<DatesToRemember> list = List.from(state.datesToRemember);
    list.add(event.datesToRemember);
    emit(state.copyWith(datesToRemember: list));
  }

  FutureOr<void> removeDateToRemember(RemoveDateToRemember event, emit) async {
    final List<DatesToRemember> list = [];
    for (DatesToRemember datesToRemember in state.datesToRemember) {
      if (state.datesToRemember[event.index] != datesToRemember) {
        list.add(datesToRemember);
      }
    }
    emit(state.copyWith(datesToRemember: list));
  }

  FutureOr<void> addSocialMedia(AddSocialMedia event, emit) async {
    final List<SocialMediaHandle> list = List.from(state.socialMedias);
    list.add(event.socialMediaHandle);
    emit(state.copyWith(socialMedias: list));
  }

  FutureOr<void> removeSocialMedia(RemoveSocialMedia event, emit) async {
    final List<SocialMediaHandle> list = [];
    for (SocialMediaHandle socialMediaHandle in state.socialMedias) {
      if (state.socialMedias[event.index] != socialMediaHandle) {
        list.add(socialMediaHandle);
      }
    }
    emit(state.copyWith(socialMedias: list));
  }

  FutureOr<void> addAccolade(AddAccolade event, emit) async {
    final List<Accolade> list = List.from(state.accolades);
    list.add(event.accolade);
    emit(state.copyWith(accolades: list));
  }

  FutureOr<void> removeAccolade(RemoveAccolade event, emit) async {
    final List<Accolade> list = [];
    for (Accolade accolade in state.accolades) {
      if (state.accolades[event.index] != accolade) list.add(accolade);
    }
    emit(state.copyWith(accolades: list));
  }

  FutureOr<void> pickUserPhotos(PickUserPhotos event, emit) async {
    final List<ImageModel> list = List.from(state.userPhotos);
    final img = await ImagePickerClass.getImage(camera: false);
    if (img != null) {
      list.add(img);
      emit(state.copyWith(userPhotos: list));
    }
  }

  FutureOr<void> removeUserPhoto(RemoveUserPhoto event, emit) async {
    final List<ImageModel> list = [];
    for (ImageModel img in state.userPhotos) {
      if (state.userPhotos[event.index] != img) list.add(img);
    }
    emit(state.copyWith(userPhotos: list));
  }

  FutureOr<void> removeImageScanning(RemoveImageScanning event, emit) async {
    final List<ImageModel> list = [];
    for (ImageModel img in state.scannedImagesCardCreation) {
      if (state.scannedImagesCardCreation[event.index] != img) list.add(img);
    }
    emit(state.copyWith(scannedImagesCardCreation: list));
  }

  FutureOr<void> processImageScanning(ProcessImageScanning event, emit) async {
    final result = await cardScanningRepo
        .processAndSortFromImage(state.scannedImagesCardCreation);
    result.fold(
        (failure) => null,
        (scannedImageText) =>
            emit(state.copyWith(scannedImageDatasModel: scannedImageText)));
  }

  FutureOr<void> pickImageScanning(PickImageScanning event, emit) async {
    final image = await ImagePickerClass.getImage(camera: event.camera);
    if (image != null) {
      emit(state.copyWith(scannedImagesCardCreation: [
        ...state.scannedImagesCardCreation,
        image
      ]));
    }
  }

  FutureOr<void> getUserDetail(GetUserDetail event, emit) async {
    final result = await localService.getUserData();
    result.fold((failure) => null, (userList) {
      if (userList.isNotEmpty) {
        nameController.text = userList.first.name ?? '';
        phoneController.text = userList.first.phoneNumber ?? '';
        emailController.text = userList.first.email ?? '';
        companylController.text = userList.first.companyName ?? '';
      }
      emit(state);
    });
  }
}
