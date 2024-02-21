part of 'business_data_bloc.dart';

@freezed
class BusinessDataState with _$BusinessDataState {
  const factory BusinessDataState(
      {required bool isLoading,
      required bool hasError,
      int? businessDetailsCreateId,
      int? bankDetailsCreateId,
      required List<SocialMediaHandleCreate> socialMedias,
      required List<AccreditionCreate> accreditions,
      required BusinessDetailsCreate businessDetails,
      required BankDetailsCreate bankDetails,
      required List<ProductCreate> products,
      required List<BrochureCreate> brochures,
      ImageModel? logo,
      String? message}) = _Initial;

  factory BusinessDataState.initial() => BusinessDataState(
      businessDetails: BusinessDetailsCreate(),
      bankDetails: BankDetailsCreate(),
      products: [],
      isLoading: false,
      hasError: false,
      socialMedias: [],
      brochures: [],
      accreditions: []);
}
