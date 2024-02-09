part of 'business_data_bloc.dart';

@freezed
class BusinessDataState with _$BusinessDataState {
  const factory BusinessDataState(
      {required bool isLoading,
      required bool hasError,
      required List<SocialMediaHandle> socialMedias,
      required List<Accredition> accreditions,
      String? message
      }) = _Initial;

  factory BusinessDataState.initial() => const BusinessDataState(
      isLoading: false, hasError: false, socialMedias: [], accreditions: []);
}
