part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.onBoardskip() = OnBoardskip;
  const factory AuthEvent.login({
    required LoginModel loginModel,
  }) = Login;

  const factory AuthEvent.log() = Log;
  const factory AuthEvent.logOut() = LogOut;
}
