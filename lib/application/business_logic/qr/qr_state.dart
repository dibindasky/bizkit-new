part of 'qr_bloc.dart';

@freezed
class QrState with _$QrState {
  const factory QrState({
    required bool isLoading,
    required bool hasError,
    required bool qrUpdated,
    required List<QRModel> qrList,
    String? message,
    required int selectedQrIndex,
    DefauiltQr? defauiltQr,
  }) = _Initial;

  factory QrState.initial() => const QrState(
        isLoading: false,
        hasError: false,
        qrUpdated: false,
        qrList: [],
        selectedQrIndex: 0,
      );
}
