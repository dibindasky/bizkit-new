part of 'admin_bloc.dart';

@freezed
class AdminState with _$AdminState {
  const factory AdminState({
    required bool isLoading,
    required bool hasError,
    required bool userBlocked,
    String? message,
    required bool homeShowcaseViwed,
    List<CompanySelectedUsersListModel>? companySelectedUsersListModel,
  }) = _Initial;
  factory AdminState.initial() => const AdminState(
        isLoading: false,
        userBlocked: false,
        homeShowcaseViwed: false,
        hasError: false,
      );
}
