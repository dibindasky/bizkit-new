part of 'qr_bloc.dart';

@freezed
class QrState with _$QrState {
  const factory QrState({
    required bool isLoading,
    required bool hasError,
    required List<QrResponse> qrList,
    String? message,
    int? selectedQr
  }) = _Initial;

  factory QrState.initial()=>const QrState(isLoading: false, hasError: false, qrList: []);
}
