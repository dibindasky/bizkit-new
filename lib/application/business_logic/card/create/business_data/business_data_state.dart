part of 'business_data_bloc.dart';

@freezed
class BusinessDataState with _$BusinessDataState {
  const factory BusinessDataState(
      {required bool isLoading,
      required bool hasError,
      required bool loadCompanyData,
      required bool isBusiness,
      int? businessDetailsCreateId,
      int? bankDetailsCreateId,
      required List<SocialMediaHandleCreate> socialMedias,
      required List<AccreditionCreate> accreditions,
      required List<BranchOffices> branchOffices,
      required BusinessDetailsCreate businessDetails,
      required BankDetailsCreate bankDetails,
      required List<ProductCreate> products,
      required List<BrochureCreate> brochures,
      ImageModel? logo,
      required bool gotCompanyData,
      required List<Company> companiesList,
      String? message}) = _Initial;

  factory BusinessDataState.initial() => BusinessDataState(
      businessDetails: BusinessDetailsCreate(),
      bankDetails: BankDetailsCreate(),
      products: [],
      isLoading: false,
      hasError: false,
      isBusiness: false,
      socialMedias: [],
      branchOffices: [],
      brochures: [],
      gotCompanyData: false,
      loadCompanyData: false,
      accreditions: [],
      companiesList: []);
}
