part of 'admin_bloc.dart';

@freezed
class AdminEvent with _$AdminEvent {
  const factory AdminEvent.getCompanyUsers() = GetCompanyUsers;
  const factory AdminEvent.userBlock() = UserBlock;
}
