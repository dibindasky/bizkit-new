part of 'card_second_bloc.dart';

@freezed
class CardSecondEvent with _$CardSecondEvent {
  const factory CardSecondEvent.started() = _Started;
  const factory CardSecondEvent.scanImage({required bool isCam}) = ScanImage;
  const factory CardSecondEvent.processImageScanning(
      {required List<ImageModel> images}) = ProcessImageScanning;
  const factory CardSecondEvent.removeImageScanning({required int index}) =
      RemoveImageScanning;
  const factory CardSecondEvent.selfieImage(
      {required bool cameraDeviceFront, required bool isCam}) = SelfieImage;
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
  const factory CardSecondEvent.getAllCardsSecond({required bool isLoad}) =
      GetAllCardsSecond;
  const factory CardSecondEvent.updateCardSecond({
    required SecondCard secondCard,
    required String id,
  }) = UpdateCardSecond;
  const factory CardSecondEvent.deleteCardSecond({
    required CardActionRequestModel cardActionRewuestModel,
    required int id,
  }) = DeleteCardSecond;
  const factory CardSecondEvent.getDeleteCardSecond({
    required bool isLoad,
  }) = GetDeleteCardSecond;
  const factory CardSecondEvent.getDeleteCardSecondEvent() =
      GetDeleteCardSecondEvent;
  const factory CardSecondEvent.restoreDeleteCardSecond({
    required CardActionRequestModel cardActionRewuestModel,
    required int id,
  }) = RestoreDeleteCardSecond;
  const factory CardSecondEvent.getCardSecondEvent() = GetCardSecondEvent;
  const factory CardSecondEvent.getSecondCardDetail({
    required int id,
  }) = GetSecondCardDetail;
  const factory CardSecondEvent.clear() = Clear;
  const factory CardSecondEvent.cardFeildClearing() = CardFeildClearing;
  const factory CardSecondEvent.imageClear() = ImageClear;
}