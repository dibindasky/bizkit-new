part of 'business_data_bloc.dart';

@freezed
class BusinessDataEvent with _$BusinessDataEvent {
  const factory BusinessDataEvent.addSocialMedia(
      {required SocialMediaHandle socialMediaHandle}) = AddSocialMedia;
  const factory BusinessDataEvent.removeSocialMedia({required int index}) =
      RemoveSocialMedia;
  const factory BusinessDataEvent.addAccredition(
      {required Accredition accredition}) = AddAccredition;
  const factory BusinessDataEvent.removeAccredition({required int index}) =
      RemoveAccredition;
  const factory BusinessDataEvent.createBusinessData() = CreateBusinessData;
  const factory BusinessDataEvent.createBankingData() = CreateBankingData;
  const factory BusinessDataEvent.addLogo() = AddLogo;
  const factory BusinessDataEvent.addProduct({required Product product}) =
      AddProduct;
  const factory BusinessDataEvent.removeProduct({required int index}) =
      RemoveProduct;
  const factory BusinessDataEvent.addBrochures() = AddBrochures;
  const factory BusinessDataEvent.removeBrochure({required int index}) =
      RemoveBrochure;
}
