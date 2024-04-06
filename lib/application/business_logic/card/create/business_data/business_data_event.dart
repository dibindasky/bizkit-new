part of 'business_data_bloc.dart';

@freezed
class BusinessDataEvent with _$BusinessDataEvent {
  const factory BusinessDataEvent.addSocialMedia(
      {required SocialMediaHandle socialMediaHandle}) = AddSocialMedia;
  const factory BusinessDataEvent.removeSocialMedia({required int id}) =
      RemoveSocialMedia;
  const factory BusinessDataEvent.addAccredition(
      {required Accredition accredition}) = AddAccredition;
  const factory BusinessDataEvent.removeAccredition({required int id}) =
      RemoveAccredition;
  const factory BusinessDataEvent.addBranch({required String branch}) =
      AddBranch;
  const factory BusinessDataEvent.removeBranch({required int id}) =
      RemoveBranch;
  factory BusinessDataEvent.clear() = Clear;
  const factory BusinessDataEvent.createBusinessData() = CreateBusinessData;
  const factory BusinessDataEvent.createBankingData() = CreateBankingData;
  const factory BusinessDataEvent.addLogo() = AddLogo;
  const factory BusinessDataEvent.uploadLogo() = UploadLogo;
  const factory BusinessDataEvent.addCropedLogo({required String base64}) =
      AddCropedLogo;
  const factory BusinessDataEvent.getUserData() = GetUserData;
  const factory BusinessDataEvent.addProduct({required Product product}) =
      AddProduct;
  const factory BusinessDataEvent.removeProduct({required int id}) =
      RemoveProduct;
  const factory BusinessDataEvent.addBrochures() = AddBrochures;
  const factory BusinessDataEvent.removeBrochure({required int id}) =
      RemoveBrochure;
  const factory BusinessDataEvent.getCompnayList(
      {required SearchQuery? search}) = GetCompnayList;
  const factory BusinessDataEvent.getCompnayDetails({required int id}) =
      GetCompnayDetails;
  factory BusinessDataEvent.getCurrentCard({required Card card}) = GetCurrentCard;
}
