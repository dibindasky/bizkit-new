import 'dart:async';
import 'dart:developer';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/image_picker/image_picker.dart';
import 'package:bizkit/data/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/domain/model/image/image_model.dart';
import 'package:bizkit/domain/model/profile/foregott_password_responce_mdel/foregott_password_responce_mdel.dart';
import 'package:bizkit/domain/model/profile/forgott_password_request_model/forgott_password_request_model.dart';
import 'package:bizkit/domain/model/profile/get_user_info_model/get_user_info_model.dart';
import 'package:bizkit/domain/model/profile/user_info_change_request_model/user_info_change_request_model.dart';
import 'package:bizkit/domain/model/profile/user_info_change_responce_model/user_info_change_responce_model.dart';
import 'package:bizkit/domain/model/report_a_problem/report_a_problem_request_model/report_a_problem_request_model.dart';
import 'package:bizkit/domain/model/token/token_model.dart';
import 'package:bizkit/domain/repository/service/profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepo profileRepo;
  int archevedCards = 1, blockedCards = 1;
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController reEnterNewPasswordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController reportSubject = TextEditingController();
  TextEditingController reportContent = TextEditingController();
  ProfileBloc(this.profileRepo) : super(ProfileState.initial()) {
    on<GetProfile>(getProfile);
    on<EditProfile>(editProfile);
    on<DeleteProfile>(deleteProfle);
    on<PickImageScanning>(pickImage);
    on<ResetPasswod>(profilePasswordChange);
    on<ReportAProblem>(reportAProblem);
  }

  FutureOr<void> reportAProblem(ReportAProblem event, emit) async {
    emit(state.copyWith(isLoading: true, hasError: false, message: null));
    final data = await profileRepo.reportAProblem(
      reportAProblemRequestModel: event.reportAProblemRequestModel,
    );
    data.fold((l) {
      emit(state.copyWith(
        isLoading: false,
        hasError: false,
        message: errorMessage,
      ));
    }, (r) {
      emit(
        state.copyWith(
          isLoading: false,
          hasError: false,
          message: 'Problem created successfully',
        ),
      );
      reportContent.clear();
      reportSubject.clear();
    });
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

  FutureOr<void> pickImage(PickImageScanning event, emit) async {
    final image = await ImagePickerClass.getImage(camera: event.camera);
    if (image != null) {
      emit(state.copyWith(imageModel: image));
    }
  }

  FutureOr<void> editProfile(EditProfile event, emit) async {
    emit(state.copyWith(isLoading: true, hasError: false, message: null));
    final data = await profileRepo.editProfile(
      userInfoChangeRequestModel: event.userInfoChangeRequestModel,
    );
    log('edit profile bloc $data');
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
          uploaded: true,
          userInfoChangeResponceModel: r,
        ),
      ),
    );
    add(const ProfileEvent.getProfile(isLoad: true));
  }

  FutureOr<void> getProfile(GetProfile event, emit) async {
    if (state.getUserInfoModel != null && event.isLoad == false) return;
    emit(state.copyWith(isLoading: true, hasError: false, message: null));
    final data = await profileRepo.getProfile();
    data.fold(
        (l) => emit(
              state.copyWith(
                isLoading: false,
                hasError: false,
                message: errorMessage,
              ),
            ), (r) {
      emit(
        state.copyWith(
          isLoading: false,
          hasError: false,
          getUserInfoModel: r,
        ),
      );
      userNameController.text = r.results!.name ?? 'No name';
      log('Bloc get profile toJson ${r.results!.toJson()}');
    });
  }

  FutureOr<void> profilePasswordChange(ResetPasswod event, emit) async {
    emit(
      state.copyWith(
        isLoading: true,
        hasError: false,
        message: null,
      ),
    );
    final result = await profileRepo.resetPassword(
      forgottPasswordRequestModel: event.forgottPasswordRequestModel,
    );
    result.fold(
        (l) => emit(state.copyWith(
              isLoading: false,
              hasError: true,
              message: l.message ?? errorMessage,
            )), (r) async {
      emit(state.copyWith(
        isLoading: false,
        hasError: false,
        message: r.message ?? 'Password changed successfully',
        foregottPasswordResponceMdel: r,
      ));
      newPasswordController.clear();
      reEnterNewPasswordController.clear();
      oldPasswordController.clear();
      await SecureStorage.saveToken(
        tokenModel: TokenModel(
          accessToken: r.access,
          refreshToken: r.refresh,
        ),
      );
    });
  }
}
