part of 'business_data_bloc.dart';

@freezed
class BusinessDataState with _$BusinessDataState {
  const factory BusinessDataState(
      {required bool isLoading,
      required bool hasError,
      required List<SocialMediaHandle> socialMedias,
      required List<Accredition> accreditions,
      required BusinessDetails businessDetails,
      required BankDetails bankDetails,
      required List<Product> products,
      required List<Brochure> brochures,
      ImageModel? logo,
      String? message}) = _Initial;

  factory BusinessDataState.initial() => BusinessDataState(
      businessDetails: BusinessDetails(),
      bankDetails: BankDetails(),
      products: [],
      isLoading: false,
      hasError: false,
      socialMedias: [],
      brochures: [],
      accreditions: []);
}
