import 'dart:io';

import 'package:bizkit/application/presentation/utils/image_picker/image_picker.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'card_screation_event.dart';
part 'card_screation_state.dart';
part 'card_screation_bloc.freezed.dart';

class CardScreationBloc extends Bloc<CardScreationEvent, CardScreationState> {
  CardScreationBloc() : super(CardScreationState.initial()) {
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
  }
}
