part of 'qr_bloc.dart';

@freezed
class QrEvent with _$QrEvent {
  const factory QrEvent.getQrCodes() = GetQrCodes;
  const factory QrEvent.changeQRSelection({required int index}) =
      ChangeQRSelection;
  const factory QrEvent.addNewLevelSharing(
      {required CreateQrModel createQrModel}) = AddNewLevelSharing;

  const factory QrEvent.getDefaultQr() = GetDefaultQr;
  const factory QrEvent.defaultQr({
    required DefauiltQr defauiltQr,
  }) = DefaultQr;
}
