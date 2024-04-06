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
  factory UserDataEvent.addAccolade({required Accolade accolade}) =
      AddAccolade;
  factory UserDataEvent.removeAccolade({required int id}) = RemoveAccolade;
  factory UserDataEvent.addDateToRemember(
      {required DatesToRemember datesToRemember}) = AddDateToRemember;
  factory UserDataEvent.removeDateToRemember({required int id}) =
      RemoveDateToRemember;
  factory UserDataEvent.addSocialMedia(
      {required SocialMediaHandle socialMediaHandle}) = AddSocialMedia;
  factory UserDataEvent.removeSocialMedia({required int id}) =
      RemoveSocialMedia;
  factory UserDataEvent.createCard(
      {required CardFirstCreationModel cardFirstCreationModel}) = CreateCard;
  factory UserDataEvent.getCurrentCard({required Card card}) = GetCurrentCard;
}
