import 'dart:async';
import 'package:bizkit/domain/model/qr/create_qr_model/create_qr_model.dart';
import 'package:bizkit/domain/model/qr/qr_response/qr_response.dart';
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
  QrBloc(this.qrServiceImpl) : super(QrState.initial()) {
    on<AddNewLevelSharing>(addNewLevelSharing);
    on<GetLevelSharing>(getLevelSharing);
    on<GetQrCodes>(getQrCodes);
    on<ChangeQRSelection>(changeQRSelection);
  }

  FutureOr<void> addNewLevelSharing(AddNewLevelSharing event, emit) {
    // TODO: implement event handler
  }
  FutureOr<void> getLevelSharing(GetLevelSharing event, emit) {
    // TODO: implement event handler
  }
  FutureOr<void> getQrCodes(GetQrCodes event, emit) {
    // TODO: implement event handler
  }
  FutureOr<void> changeQRSelection(ChangeQRSelection event, emit) {
    emit(state.copyWith(selectedQr: event.index));
  }
}
