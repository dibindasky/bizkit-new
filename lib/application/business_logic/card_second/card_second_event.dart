part of 'card_second_bloc.dart';

@freezed
class CardSecondEvent with _$CardSecondEvent {
  const factory CardSecondEvent.started() = _Started;
  const factory CardSecondEvent.galeryScannedImage() = GaleryScannedImage;
  const factory CardSecondEvent.processImageScanning(
      {required List<ImageModel> images}) = ProcessImageScanning;
  const factory CardSecondEvent.removeImageScanning({required int index}) =
      RemoveImageScanning;
  const factory CardSecondEvent.selfieImage({required bool cameraDeviceFront}) =
      SelfieImage;
  const factory CardSecondEvent.autoFillTExtfieldItems({
    required String scannedImage,
    required String email,
    required String name,
    required String company,
    required String number,
    required String website,
    required String designation,
  }) = AutoFillTExtfieldItems;
  const factory CardSecondEvent.meetingRelatedInfo({
    required String selfieImage,
    required String occation,
    required String location,
    required String occupation,
    required String notes,
  }) = MeetingRelatedInfo;
  const factory CardSecondEvent.secondCardCreation() = SecondCardCreation;
  const factory CardSecondEvent.getAllCardsSecond({required bool isLoad}) =
      GetAllCardsSecond;
  const factory CardSecondEvent.updateCardSecond() = UpdateCardSecond;
  const factory CardSecondEvent.getCardSecondEvent() = GetCardSecondEvent;
}
