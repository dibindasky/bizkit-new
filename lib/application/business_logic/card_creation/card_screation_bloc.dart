import 'dart:io';
import 'package:bizkit/application/presentation/utils/image_picker/image_picker.dart';
import 'package:bizkit/domain/model/scanned_image_datas_model/scanned_image_datas_model.dart';
import 'package:bizkit/domain/repository/feature/card_scanning.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
part 'card_screation_event.dart';
part 'card_screation_state.dart';
part 'card_screation_bloc.freezed.dart';

@injectable
class CardScreationBloc extends Bloc<CardScreationEvent, CardScreationState> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController technolegyController = TextEditingController();
  final TextEditingController companylController = TextEditingController();
  final CardScanningDataFetchingRepo cardScanningDataFetchingRepo;

  CardScreationBloc({required this.cardScanningDataFetchingRepo})
      : super(CardScreationState.initial()) {
    on<_PickImage>((event, emit) async {
      File? image = await PickImage.getImage(camera: event.camera);
      List<File>? fileImages = [];
      if (image != null) {
        fileImages.add(image);
      }
      if (state.scanimages != null) {
        fileImages.addAll(state.scanimages!);
      }
      emit(state.copyWith(scanimages: fileImages));
    });
    on<_ProcessImage>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      if (state.scanimages != null) {
        final convertedText = await cardScanningDataFetchingRepo
            .processAndSortFromImage(state.scanimages);
        convertedText.fold((failure) {
          emit(state.copyWith(
            isLoading: false,
            hasError: true,
          ));
          technolegyController.dispose();
          nameController.dispose();
          emailController.dispose();
          phoneController.dispose();
          companylController.dispose();
          print('Disposed');
        }, (successconvertingImageToText) {
          emit(state.copyWith(
            hasError: false,
            isLoading: false,
            success: true,
            convertedText: successconvertingImageToText,
          ));
        });
      }
    });
  }
}
