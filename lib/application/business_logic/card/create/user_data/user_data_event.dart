part of 'user_data_bloc.dart';

@freezed
class UserDataEvent with _$UserDataEvent {
  factory UserDataEvent.pickImageScanning({required bool camera}) =
      PickImageScanning;
  factory UserDataEvent.removeImageScanning({required int index}) =
      RemoveImageScanning;
  factory UserDataEvent.processImageScanning(
      {required List<ImageModel> images}) = ProcessImageScanning;
  factory UserDataEvent.getUserDetail() = GetUserDetail;
  factory UserDataEvent.getBusinessCategories() = GetBusinessCategories;
  factory UserDataEvent.pickUserPhotos() = PickUserPhotos;
  factory UserDataEvent.clear() = Clear;
  factory UserDataEvent.createPersonalData() = CreatePersonalData;
  factory UserDataEvent.removeUserPhoto() = RemoveUserPhoto;
  factory UserDataEvent.addAccolade({required AccoladeCreate accolade}) =
      AddAccolade;
  factory UserDataEvent.removeAccolade({required int index}) = RemoveAccolade;
  factory UserDataEvent.addDateToRemember(
      {required DatesToRememberCreate datesToRemember}) = AddDateToRemember;
  factory UserDataEvent.removeDateToRemember({required int index}) =
      RemoveDateToRemember;
  factory UserDataEvent.addSocialMedia(
      {required SocialMediaHandleCreate socialMediaHandle}) = AddSocialMedia;
  factory UserDataEvent.removeSocialMedia({required int index}) =
      RemoveSocialMedia;
  factory UserDataEvent.createCard(
      {required CardFirstCreationModel cardFirstCreationModel}) = CreateCard;
  factory UserDataEvent.getCurrentCard(
      {required Card card}) = GetCurrentCard;
}
