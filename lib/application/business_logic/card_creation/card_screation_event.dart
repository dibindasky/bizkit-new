part of 'card_screation_bloc.dart';

@freezed
class CardScreationEvent with _$CardScreationEvent {
  factory CardScreationEvent.pickImage({required bool camera}) = _PickImage;
}
