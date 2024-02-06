import 'dart:async';
import 'package:bizkit/application/presentation/utils/image_picker/image_picker.dart';
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
  final TextEditingController companylController = TextEditingController();
  final TextEditingController technolegyController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  UserDataBloc(this.cardScanningRepo) : super(UserDataState.initial()) {
    on<PickImage>(pickImage);
    on<ProcessImage>(processImage);
    on<RemoveImage>(removeImage);
  }

  FutureOr<void> removeImage(RemoveImage event, emit) async {
    final List<ImageModel> list = [];
    for (ImageModel img in state.images) {
      if (state.images[event.index] != img) list.add(img);
    }
    emit(state.copyWith(images: list));
  }

  FutureOr<void> processImage(ProcessImage event, emit) async {
    print('process images');
    final result = await cardScanningRepo.processAndSortFromImage(state.images);
    print('after process image');
    result.fold(
        (failure) => null,
        (scannedImageText) =>
            emit(state.copyWith(scannedImageDatasModel: scannedImageText)));
  }

  FutureOr<void> pickImage(PickImage event, emit) async {
    final image = await ImagePickerClass.getImage(camera: event.camera);
    if (image != null) {
      emit(state.copyWith(images: [...state.images, image]));
    }
  }
}
