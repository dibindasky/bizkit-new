import 'dart:async';
import 'package:bizkit/domain/model/qr/create_qr_model/create_qr_model.dart';
import 'package:bizkit/domain/model/qr/get_qr_code_response_model/qr_model.dart';
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
  CreateQrModel createQrModel = CreateQrModel();

  QrBloc(this.qrServiceImpl) : super(QrState.initial()) {
    on<AddNewLevelSharing>(addNewLevelSharing);
    on<GetQrCodes>(getQrCodes);
    on<ChangeQRSelection>(changeQRSelection);
  }

  FutureOr<void> addNewLevelSharing(AddNewLevelSharing event, emit) async {
    emit(state.copyWith(isLoading: true, hasError: false, message: null));
    final result = await qrServiceImpl.updateLevelSharing(
        createQrModel: event.createQrModel);
    result.fold(
        (failure) => emit(state.copyWith(
            isLoading: false,
            hasError: true,
            message: failure.message)), (response) {
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
        businessDetailsEmail: model.businessDetailsEmail,
        businessDetailsMobileNumber: model.businessDetailsMobileNumber,
        company: model.company,
        email: model.email,
        personalSocialMedia: model.personalSocialMedia,
        phoneNumber: model.phoneNumber,
        socialMediaHandles: model.socialMediaHandles,
        websiteLink: model.websiteLink,
        card: model.card);
    emit(state.copyWith(selectedQrIndex: event.index));
  }
}
