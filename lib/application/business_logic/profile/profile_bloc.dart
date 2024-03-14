import 'dart:async';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/image_picker/image_picker.dart';
import 'package:bizkit/domain/model/profile/get_profile_details_responce_model/get_profile_details_responce_model.dart';
import 'package:bizkit/domain/model/profile/profile_update_request_model/profile_update_request_model.dart';
import 'package:bizkit/domain/model/profile/profile_update_responce_model/profile_update_responce_model.dart';
import 'package:bizkit/domain/repository/service/profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepo profileRepo;
  ProfileBloc(this.profileRepo) : super(ProfileState.initial()) {
    on<GetProfile>(getProfile);
    on<EditProfile>(editProfile);
    on<DeleteProfile>(deleteProfle);
  }

  FutureOr<void> deleteProfle(DeleteProfile event, emit) async {
    emit(state.copyWith(isLoading: true, hasError: false, message: null));
    final data = await profileRepo.deleteProfile();
    data.fold(
      (l) => emit(state.copyWith(
        isLoading: false,
        hasError: false,
        message: errorMessage,
      )),
      (r) => emit(
        state.copyWith(
          isLoading: false,
          hasError: false,
          message: 'Profile deleted successfully',
        ),
      ),
    );
  }

  FutureOr<void> editProfile(EditProfile event, emit) async {
    emit(state.copyWith(isLoading: true, hasError: false, message: null));
    final iamge = ImagePickerClass.getImage(camera: event.isFrom);
    final data = await profileRepo.editProfile(
      profileUpdateRequestModel: event.profileUpdateRequestModel,
    );
    data.fold(
      (l) => emit(state.copyWith(
        isLoading: false,
        hasError: false,
        message: errorMessage,
      )),
      (r) => emit(
        state.copyWith(
          isLoading: false,
          hasError: false,
          message: 'Profile updated uccessfully',
          profileUpdateResponceModel: r,
        ),
      ),
    );
  }

  FutureOr<void> getProfile(GetProfile event, emit) async {
    emit(state.copyWith(isLoading: true, hasError: false, message: null));
    final data = await profileRepo.getProfile();
    data.fold(
      (l) => emit(state.copyWith(
          isLoading: false, hasError: false, message: errorMessage)),
      (r) => emit(
        state.copyWith(
          isLoading: false,
          hasError: false,
          getProfileDetailsResponceModel: r,
        ),
      ),
    );
  }
}
