part of 'admin_bloc.dart';

@freezed
class AdminState with _$AdminState {
  const factory AdminState({
    required bool isLoading,
    required bool hasError,
    required bool userBlocked,
    required bool getBusinessNextLoading,
    required bool getBusinessNextError,
    required bool requestAccepteed,
    required bool requestDiclined,
    required bool businessAcionLoading,
    String? message,
    required bool homeShowcaseViwed,
    List<CompanySelectedUsersListModel>? companySelectedUsersListModel,
    List<BusinessCardRequest>? businesscardRequests,
  }) = _Initial;
  factory AdminState.initial() => const AdminState(
        requestAccepteed: false,
        requestDiclined: false,
        businessAcionLoading: false,
        isLoading: false,
        getBusinessNextLoading: false,
        userBlocked: false,
        getBusinessNextError: false,
        homeShowcaseViwed: false,
        hasError: false,
      );
}
