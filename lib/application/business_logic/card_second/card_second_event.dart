part of 'card_second_bloc.dart';

@freezed
class CardSecondEvent with _$CardSecondEvent {
  const factory CardSecondEvent.started() = _Started;
  const factory CardSecondEvent.scanImage(
      {required bool isCam, required bool isFront}) = ScanImage;
  const factory CardSecondEvent.processImageScanning(
      {required List<ImageModel> images}) = ProcessImageScanning;
  factory CardSecondEvent.processImageScanningInfo(
      {required List<ImageModel> images}) = ProcessImageScanningInfo;
  const factory CardSecondEvent.removeImageScanning({required int index}) =
      RemoveImageScanning;
  const factory CardSecondEvent.selfieImage(
      {required bool cameraDeviceFront, required bool isCam}) = SelfieImage;
  const factory CardSecondEvent.selfieimageClear({required int index}) =
      SelfieimageClear;
  const factory CardSecondEvent.autoFillTExtfieldItems({
    String? scannedImage,
    String? email,
    required String name,
    String? company,
    String? number,
    String? website,
    String? designation,
  }) = AutoFillTExtfieldItems;
  const factory CardSecondEvent.meetingRelatedInfo({
    List<ImageModel>? selfieImage,
    String? occation,
    String? location,
    String? occupation,
    String? notes,
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
  const factory CardSecondEvent.locationGeting() = LocationGeting;
  const factory CardSecondEvent.contactSaveToPhone({
    required AddNewContact addNewContact,
  }) = ContactSaveToPhone;
  const factory CardSecondEvent.seccondCardShare({
    required int id,
  }) = SeccondCardShare;
  const factory CardSecondEvent.removeSelfieIndexImages({required int id}) =
      RemoveSelfieIndexImages;
  const factory CardSecondEvent.addSelfieIndexImages({required int id}) =
      AddSelfieIndexImages;
}
