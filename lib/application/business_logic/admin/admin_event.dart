part of 'admin_bloc.dart';

@freezed
class AdminEvent with _$AdminEvent {
  const factory AdminEvent.getCompanyUsers({required bool isLoad}) =
      GetCompanyUsers;
  const factory AdminEvent.removeIndiVidualusersPartOfBusiness(
      {required String id}) = RemoveIndiVidualusersPartOfBusiness;
}
