part of 'promt_bloc.dart';

@freezed
class PromtState with _$PromtState {
  const factory PromtState({
    required bool show,
    required bool hasCard,
    required bool hasReminder,
    String? message,
  }) = _Initial;
  factory PromtState.initial() =>
      const PromtState(show: false, hasCard: false, hasReminder: false);
}
