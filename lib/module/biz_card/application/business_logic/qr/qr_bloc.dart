import 'dart:async';
import 'package:bizkit/module/biz_card/domain/model/qr/create_qr_model/create_qr_model.dart';
import 'package:bizkit/module/biz_card/domain/model/qr/defauilt_qr/defauilt_qr.dart';
import 'package:bizkit/module/biz_card/domain/model/qr/get_qr_code_response_model/qr_model.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/qr_repo.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
part 'qr_event.dart';
part 'qr_state.dart';
part 'qr_bloc.freezed.dart';

@injectable
class QrBloc extends Bloc<QrEvent, QrState> {
  final QrServiceRepo qrServiceImpl;
  CreateQrModel createQrModel = CreateQrModel();
  DefauiltQr defauiltQr = DefauiltQr();
  QrBloc(this.qrServiceImpl) : super(QrState.initial()) {
    on<AddNewLevelSharing>(addNewLevelSharing);
    on<GetQrCodes>(getQrCodes);
    on<ChangeQRSelection>(changeQRSelection);
    on<DefaultQr>(defaultQr);
    on<GetDefaultQr>(getDefaultQr);
  }

  FutureOr<void> getDefaultQr(GetDefaultQr event, emit) async {
    emit(state.copyWith(
      qrUpdated: false,
      isLoading: true,
      hasError: false,
      message: null,
    ));
    final data = await qrServiceImpl.getDefaultQr();
    data.fold(
        (l) => emit(state.copyWith(
              qrUpdated: false,
              isLoading: false,
              hasError: true,
              message: null,
            )), (r) {
      emit(
        state.copyWith(
          qrUpdated: false,
          isLoading: false,
          hasError: false,
          defauiltQr: r,
        ),
      );
    });
  }

  FutureOr<void> defaultQr(DefaultQr event, emit) async {
    emit(state.copyWith(
        isLoading: true, hasError: false, message: null, qrUpdated: false));
    final data = await qrServiceImpl.defaultQr(defauiltQr: defauiltQr);
    data.fold(
      (l) => emit(state.copyWith(
        isLoading: false,
        hasError: true,
        message: null,
        qrUpdated: false,
      )),
      (r) => emit(
        state.copyWith(
          isLoading: false,
          hasError: false,
          defauiltQr: r,
          qrUpdated: true,
        ),
      ),
    );
  }

  FutureOr<void> addNewLevelSharing(AddNewLevelSharing event, emit) async {
    emit(state.copyWith(
      isLoading: true,
      hasError: false,
      message: null,
      qrUpdated: false,
    ));
    CreateQrModel createmodel = event.createQrModel.copyWith(
      accolades: event.createQrModel.accolades ?? false,
      accreditation: event.createQrModel.accreditation ?? false,
      address: event.createQrModel.address ?? false,
      businessDetailsMobileNumber:
          event.createQrModel.businessDetailsMobileNumber ?? false,
      businessEmail: event.createQrModel.businessEmail ?? false,
      company: event.createQrModel.company ?? false,
      email: event.createQrModel.email ?? false,
      personalSocialMedia: event.createQrModel.personalSocialMedia ?? false,
      phoneNumber: event.createQrModel.phoneNumber ?? false,
      socialMediaHandles: event.createQrModel.socialMediaHandles ?? false,
      websiteLink: event.createQrModel.websiteLink ?? false,
    );
    final result = await qrServiceImpl.updateLevelSharing(
        createQrModel: createmodel,
        id: state.qrList[state.selectedQrIndex].id!);
    result.fold((failure) {
      List<QRModel> list = List.from(state.qrList);
      final model = list[state.selectedQrIndex];
      createQrModel = createQrModel.copyWith(
          accolades: model.accolades,
          accreditation: model.accreditation,
          address: model.address,
          businessDetailsMobileNumber: model.businessDetailsMobileNumber,
          businessEmail: model.businessEmail,
          company: model.company,
          email: model.email,
          personalSocialMedia: model.personalSocialMedia,
          phoneNumber: model.phoneNumber,
          socialMediaHandles: model.socialMediaHandles,
          websiteLink: model.websiteLink);
      return emit(state.copyWith(
        qrUpdated: false,
        isLoading: false,
        hasError: true,
        message: failure.message ?? errorMessage,
      ));
    }, (response) {
      List<QRModel> list = List.from(state.qrList);
      list[state.selectedQrIndex] = response;
      return emit(state.copyWith(
        isLoading: false,
        qrList: list,
        qrUpdated: false,
      ));
    });
  }

  FutureOr<void> getQrCodes(GetQrCodes event, emit) async {
    emit(state.copyWith(
      isLoading: true,
      hasError: false,
      message: null,
      qrUpdated: false,
    ));
    final result = await qrServiceImpl.getAllQrCode();
    result.fold(
        (failure) => emit(state.copyWith(
            isLoading: false,
            qrUpdated: false,
            hasError: true,
            message: failure.message)), (response) {
      emit(state.copyWith(
        isLoading: false,
        qrList: response.results ?? [],
        qrUpdated: false,
      ));
      add(const QrEvent.changeQRSelection(index: 0));
    });
  }

  FutureOr<void> changeQRSelection(ChangeQRSelection event, emit) {
    emit(state.copyWith(
      isLoading: true,
      qrUpdated: false,
    ));
    if (state.qrList.isEmpty) {
      return emit(state.copyWith(
        isLoading: false,
        qrUpdated: false,
      ));
    }
    final model = state.qrList[event.index];
    createQrModel = CreateQrModel(
      accolades: model.accolades,
      accreditation: model.accreditation,
      address: model.address,
      businessDetailsMobileNumber: model.businessDetailsMobileNumber,
      company: model.company,
      email: model.email,
      personalSocialMedia: model.personalSocialMedia,
      phoneNumber: model.phoneNumber,
      socialMediaHandles: model.socialMediaHandles,
      websiteLink: model.websiteLink,
      businessEmail: model.businessEmail,
    );
    emit(state.copyWith(
      selectedQrIndex: event.index,
      isLoading: false,
      qrUpdated: false,
    ));
  }
}
