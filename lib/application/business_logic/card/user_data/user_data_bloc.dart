import 'dart:async';
import 'package:bizkit/application/presentation/utils/image_picker/image_picker.dart';
import 'package:bizkit/data/sqflite/sqflite_local_service.dart';
import 'package:bizkit/domain/model/image/image_model.dart';
import 'package:bizkit/domain/model/scanned_image_datas_model/scanned_image_datas_model.dart';
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
  final TextEditingController companylController = TextEditingController();
  final TextEditingController technolegyController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  UserDataBloc(this.cardScanningRepo, this.localService)
      : super(UserDataState.initial()) {
    on<PickImage>(pickImage);
    on<ProcessImage>(processImage);
    on<RemoveImage>(removeImage);
    on<GetUserDetail>(getUserDetail);
  }

  FutureOr<void> removeImage(RemoveImage event, emit) async {
    final List<ImageModel> list = [];
    for (ImageModel img in state.scannedImagesCardCreation) {
      if (state.scannedImagesCardCreation[event.index] != img) list.add(img);
    }
    emit(state.copyWith(scannedImagesCardCreation: list));
  }

  FutureOr<void> processImage(ProcessImage event, emit) async {
    print('process scannedImagesCardCreation');
    final result = await cardScanningRepo
        .processAndSortFromImage(state.scannedImagesCardCreation);
    print('after process image');
    result.fold(
        (failure) => null,
        (scannedImageText) =>
            emit(state.copyWith(scannedImageDatasModel: scannedImageText)));
  }

  FutureOr<void> pickImage(PickImage event, emit) async {
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
    result.fold((failure) => print('userList => failure'), (userList) {
      print('userList => $userList');
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
