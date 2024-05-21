part of 'promt_bloc.dart';

@freezed
class PromtEvent with _$PromtEvent {
  const factory PromtEvent.checkPrompt() = CheckPrompt;
  const factory PromtEvent.closePrompt() = ClosePrompt;
}
