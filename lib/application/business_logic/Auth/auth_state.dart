part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState(
      {required bool isLoading,
      required bool hasError,
      String? message,
      SignUpResponseModel? signUpResponseModel,
      LoginResponseModel? loginResponseModel}) = _Initial;

  factory AuthState.initial() =>
      const AuthState(isLoading: false, hasError: false);
}
