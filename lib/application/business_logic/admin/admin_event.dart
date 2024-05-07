part of 'admin_bloc.dart';

@freezed
class AdminEvent with _$AdminEvent {
  const factory AdminEvent.getCompanyUsers({required bool isLoad}) =
      GetCompanyUsers;
  const factory AdminEvent.getCompanyUsersNext() = GetCompanyUsersNext;
  const factory AdminEvent.removeIndiVidualusersPartOfBusiness(
      {required String id}) = RemoveIndiVidualusersPartOfBusiness;
  const factory AdminEvent.showCaseVisited() = ShowCaseVisited;
  const factory AdminEvent.getAllBusinessCardRequests({required bool isLoad}) =
      GetAllBusinessCardRequests;
  const factory AdminEvent.getAllBusinessCardRequestsNExt() =
      GetAllBusinessCardRequestsNExt;
  const factory AdminEvent.businessCardRequestAccept({required String id}) =
      BusinessCardRequestAccept;
  const factory AdminEvent.businessCardRequestAReject({required String id}) =
      BusinessCardRequestAReject;
  const factory AdminEvent.getBusinessBlockeUsers({required bool isLoad}) =
      GetBusinessBlockeUsers;
  const factory AdminEvent.businessUnBlockeUser({required String id}) =
      BusinessUnBlockeUser;
}
