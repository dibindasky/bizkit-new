part of 'card_screation_bloc.dart';

@freezed
class CardScreationState with _$CardScreationState {
  const factory CardScreationState({
    List<File>? scanimages,
    String? mesasge,
  }) = _Initial;

  factory CardScreationState.initial() =>
      const CardScreationState(scanimages: []);
}
