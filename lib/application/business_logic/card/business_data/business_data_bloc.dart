import 'dart:async';
import 'package:bizkit/domain/model/card/accridition/accredition.dart';
import 'package:bizkit/domain/model/card/social_media_handle/social_media_handle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'business_data_event.dart';
part 'business_data_state.dart';
part 'business_data_bloc.freezed.dart';

@injectable
class BusinessDataBloc extends Bloc<BusinessDataEvent, BusinessDataState> {

  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController websiteLinkController = TextEditingController();

  BusinessDataBloc() : super(BusinessDataState.initial()) {
    on<AddAccredition>(addAccredition);
    on<RemoveAccredition>(removeAccredition);
    on<AddSocialMedia>(addSocialMedia);
    on<RemoveSocialMedia>(removeSocialMedia);
  }

  FutureOr<void> addAccredition(AddAccredition event, emit) async {
        final List<Accredition> list = List.from(state.accreditions);
    list.add(event.accredition);
    emit(state.copyWith(accreditions: list));
  }

  FutureOr<void> removeAccredition(RemoveAccredition event, emit) async {
    final List<Accredition> list = [];
    for (SocialMediaHandle accredition in state.accreditions) {
      if (state.accreditions[event.index] != accredition) {
        list.add(accreditions);
      }
    }
    emit(state.copyWith(accreditions: list));
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
}
