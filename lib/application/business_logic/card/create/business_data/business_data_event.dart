part of 'business_data_bloc.dart';

@freezed
class BusinessDataEvent with _$BusinessDataEvent {
  const factory BusinessDataEvent.addSocialMedia(
      {required SocialMediaHandleCreate socialMediaHandle}) = AddSocialMedia;
  const factory BusinessDataEvent.removeSocialMedia({required int index}) =
      RemoveSocialMedia;
  const factory BusinessDataEvent.addAccredition(
      {required AccreditionCreate accredition}) = AddAccredition;
  const factory BusinessDataEvent.removeAccredition({required int index}) =
      RemoveAccredition;
  const factory BusinessDataEvent.addBranch({required String branch}) =
      AddBranch;
  const factory BusinessDataEvent.removeBranch({required int index}) =
      RemoveBranch;
  factory BusinessDataEvent.clear() = Clear;
  const factory BusinessDataEvent.createBusinessData() = CreateBusinessData;
  const factory BusinessDataEvent.createBankingData() = CreateBankingData;
  const factory BusinessDataEvent.addLogo() = AddLogo;
  const factory BusinessDataEvent.getUserData() = GetUserData;
  const factory BusinessDataEvent.addProduct({required ProductCreate product}) =
      AddProduct;
  const factory BusinessDataEvent.removeProduct({required int index}) =
      RemoveProduct;
  const factory BusinessDataEvent.addBrochures() = AddBrochures;
  const factory BusinessDataEvent.removeBrochure({required int index}) =
      RemoveBrochure;
  const factory BusinessDataEvent.getCompnayList(
      {required SearchQuery? search}) = GetCompnayList;
  const factory BusinessDataEvent.getCompnayDetails(
      {required int id}) = GetCompnayDetails;
}
