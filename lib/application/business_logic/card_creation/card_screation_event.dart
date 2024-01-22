part of 'card_screation_bloc.dart';

@freezed
class CardScreationEvent with _$CardScreationEvent {
  factory CardScreationEvent.pickImage({required bool camera}) = _PickImage;
  factory CardScreationEvent.processImage({required List<File> images}) =
      _ProcessImage;
}
