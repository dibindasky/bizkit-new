part of 'business_data_bloc.dart';

@freezed
class BusinessDataEvent with _$BusinessDataEvent {
  const factory BusinessDataEvent.addSocialMedia(
      {required SocialMediaHandle socialMediaHandle}) = AddSocialMedia;
  const factory BusinessDataEvent.removeSocialMedia({required int id}) =
      RemoveSocialMedia;
  const factory BusinessDataEvent.removeBusinessSocialMedia({required int id}) =
      RemoveBusinessSocialMedia;
  const factory BusinessDataEvent.addAccredition(
      {required Accredition accredition, required bool edit}) = AddAccredition;
  const factory BusinessDataEvent.accreditationPickImage(
      {required bool isCam, required bool isFront}) = AccreditationPickImage;
  const factory BusinessDataEvent.productUpdatePickImage({
    required bool isCam,
    required bool isFront,
    required int productId,
  }) = ProductUpdatePickImage;
  const factory BusinessDataEvent.removeAccredition({required int id}) =
      RemoveAccredition;
  const factory BusinessDataEvent.addBranch({required BranchOffice branch}) =
      AddBranch;
  const factory BusinessDataEvent.updateBranch(
      {required BranchOffice branch, required int id}) = UpdateBranch;
  const factory BusinessDataEvent.removeBranch({required int id}) =
      RemoveBranch;
  const factory BusinessDataEvent.createBusinessData() = CreateBusinessData;
  const factory BusinessDataEvent.createBankingData() = CreateBankingData;
  const factory BusinessDataEvent.addLogo({required bool isCam}) = AddLogo;
  const factory BusinessDataEvent.uploadLogo() = UploadLogo;
  const factory BusinessDataEvent.addCropedLogo({required String base64}) =
      AddCropedLogo;
  const factory BusinessDataEvent.getUserData() = GetUserData;
  const factory BusinessDataEvent.addProduct(
      {required Product product, required bool edit}) = AddProduct;
  const factory BusinessDataEvent.removeProductImages({required int id}) =
      RemoveProductImages;
  const factory BusinessDataEvent.removeProductIndexImages(
      {required int index}) = RemoveProductIndexImages;
  const factory BusinessDataEvent.productUpdateImages(
      {required ProductImageAdd productImageAdd}) = ProductUpdateImages;
  const factory BusinessDataEvent.pickProductImage({required bool isCam}) =
      PickProductImage;
  const factory BusinessDataEvent.removeProduct({required int id}) =
      RemoveProduct;
  const factory BusinessDataEvent.updateProduct({
    required int id,
    required Product product,
  }) = UpdateProduct;
  const factory BusinessDataEvent.addBrochures() = AddBrochures;
  const factory BusinessDataEvent.addBrochure({required Brochure brochure}) = AddBrochure;
  const factory BusinessDataEvent.removeBrochure({required int id}) =
      RemoveBrochure;
  const factory BusinessDataEvent.getCompnayList(
      {required SearchQuery? search}) = GetCompnayList;
  const factory BusinessDataEvent.getCompnayDetails({required int id}) =
      GetCompnayDetails;
  const factory BusinessDataEvent.removeBusinessData() = RemoveBusinessData;
  factory BusinessDataEvent.getCurrentCard({required Card card}) =
      GetCurrentCard;
  factory BusinessDataEvent.clear() = Clear;
  factory BusinessDataEvent.removeAccreditionImage({required int id}) =
      RemoveAccreditionImage;
}
