part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login({required LoginModel loginModel}) = _Login;
  const factory AuthEvent.register({required SignUpModel signUpModel}) =
      _Register;
}
