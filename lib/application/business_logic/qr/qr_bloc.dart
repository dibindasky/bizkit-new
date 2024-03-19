import 'dart:async';
import 'dart:developer';
import 'package:bizkit/domain/model/qr/create_qr_model/create_qr_model.dart';
import 'package:bizkit/domain/model/qr/defauilt_qr/defauilt_qr.dart';
import 'package:bizkit/domain/model/qr/get_qr_code_response_model/qr_model.dart';
import 'package:bizkit/domain/repository/service/profile_repo.dart';
import 'package:bizkit/domain/repository/service/qr_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
part 'qr_event.dart';
part 'qr_state.dart';
part 'qr_bloc.freezed.dart';

@injectable
class QrBloc extends Bloc<QrEvent, QrState> {
  final QrServiceRepo qrServiceImpl;
  final ProfileRepo profileRepo;
  CreateQrModel createQrModel = CreateQrModel();
  DefauiltQr defauiltQr = DefauiltQr();
  QrBloc(this.qrServiceImpl, this.profileRepo) : super(QrState.initial()) {
    on<AddNewLevelSharing>(addNewLevelSharing);
    on<GetQrCodes>(getQrCodes);
    on<ChangeQRSelection>(changeQRSelection);
    on<DefaultQr>(defaultQr);
    on<GetDefaultQr>(getDefaultQr);
  }

  FutureOr<void> getDefaultQr(GetDefaultQr event, emit) async {
    if (state.defauiltQr != null) return;
    emit(state.copyWith(isLoading: true, hasError: false, message: null));
    final data = await profileRepo.getDefaultQr();
    data.fold(
        (l) => emit(state.copyWith(
              isLoading: false,
              hasError: true,
              message: null,
            )), (r) {
      log('getDefaultQr data ${r.toJson()}');
      emit(
        state.copyWith(
          isLoading: false,
          hasError: false,
          defauiltQr: r,
        ),
      );
      //add(const QrEvent.getDefaultQr());
    });
  }

  FutureOr<void> defaultQr(DefaultQr event, emit) async {
    emit(state.copyWith(isLoading: true, hasError: false, message: null));
    final data = await profileRepo.defaultQr(defauiltQr: defauiltQr);
    data.fold(
      (l) => emit(state.copyWith(
        isLoading: false,
        hasError: true,
        message: null,
      )),
      (r) => emit(
        state.copyWith(
          isLoading: false,
          hasError: false,
          defauiltQr: r,
        ),
      ),
    );
  }

  FutureOr<void> addNewLevelSharing(AddNewLevelSharing event, emit) async {
    emit(state.copyWith(isLoading: true, hasError: false, message: null));
    createQrModel.card = state.qrList[state.selectedQrIndex].id!;
    final result = await qrServiceImpl.updateLevelSharing(
        createQrModel: event.createQrModel);
    result.fold(
        (failure) => emit(state.copyWith(
              isLoading: false,
              hasError: true,
              message: failure.message,
            )), (response) {
      List<QRModel> list = List.from(state.qrList);
      list[state.selectedQrIndex] = response;
      return emit(state.copyWith(isLoading: false, qrList: list));
    });
  }

  FutureOr<void> getQrCodes(GetQrCodes event, emit) async {
    emit(state.copyWith(isLoading: true, hasError: false, message: null));
    final result = await qrServiceImpl.getAllQrCode();
    result.fold(
        (failure) => emit(state.copyWith(
            isLoading: false,
            hasError: true,
            message: failure.message)), (response) {
      emit(state.copyWith(isLoading: false, qrList: response.results ?? []));
      add(const QrEvent.changeQRSelection(index: 0));
    });
  }

  FutureOr<void> changeQRSelection(ChangeQRSelection event, emit) {
    final model = state.qrList[event.index];
    createQrModel = createQrModel.copyWith(
      address: model.address,
      businessDetailsMobileNumber: model.businessDetailsMobileNumber,
      company: model.company,
      email: model.email,
      personalSocialMedia: model.personalSocialMedia,
      phoneNumber: model.phoneNumber,
      socialMediaHandles: model.socialMediaHandles,
      websiteLink: model.websiteLink,
      businessEmail: model.businessEmail,
      card: model.cardId,
    );
    emit(state.copyWith(selectedQrIndex: event.index));
  }
}
