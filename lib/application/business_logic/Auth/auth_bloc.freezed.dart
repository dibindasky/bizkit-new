// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoginModel loginModel) login,
    required TResult Function(SignUpModel signUpModel) registerBusiness,
    required TResult Function(SignUpIndivudalModel signUpIndivudalModel)
        registerIndividual,
    required TResult Function(EmailModel emailModel) sendOtp,
    required TResult Function(VerifyOtpModel verifyOtpModel) verifyOtp,
    required TResult Function(EmailModel emailModel) forgotPassword,
    required TResult Function(VerifyOtpModel verifyOtpModel)
        verifyforgotPassword,
    required TResult Function(ChangePasswordModel changePasswordModel)
        changePassword,
    required TResult Function() showValidateError,
    required TResult Function() log,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoginModel loginModel)? login,
    TResult? Function(SignUpModel signUpModel)? registerBusiness,
    TResult? Function(SignUpIndivudalModel signUpIndivudalModel)?
        registerIndividual,
    TResult? Function(EmailModel emailModel)? sendOtp,
    TResult? Function(VerifyOtpModel verifyOtpModel)? verifyOtp,
    TResult? Function(EmailModel emailModel)? forgotPassword,
    TResult? Function(VerifyOtpModel verifyOtpModel)? verifyforgotPassword,
    TResult? Function(ChangePasswordModel changePasswordModel)? changePassword,
    TResult? Function()? showValidateError,
    TResult? Function()? log,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginModel loginModel)? login,
    TResult Function(SignUpModel signUpModel)? registerBusiness,
    TResult Function(SignUpIndivudalModel signUpIndivudalModel)?
        registerIndividual,
    TResult Function(EmailModel emailModel)? sendOtp,
    TResult Function(VerifyOtpModel verifyOtpModel)? verifyOtp,
    TResult Function(EmailModel emailModel)? forgotPassword,
    TResult Function(VerifyOtpModel verifyOtpModel)? verifyforgotPassword,
    TResult Function(ChangePasswordModel changePasswordModel)? changePassword,
    TResult Function()? showValidateError,
    TResult Function()? log,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Login value) login,
    required TResult Function(RegisterBusiness value) registerBusiness,
    required TResult Function(RegisterIndividual value) registerIndividual,
    required TResult Function(SendOtp value) sendOtp,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ForgotPassword value) forgotPassword,
    required TResult Function(VerifyforgotPassword value) verifyforgotPassword,
    required TResult Function(ChangePassword value) changePassword,
    required TResult Function(ShowValidateError value) showValidateError,
    required TResult Function(Log value) log,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Login value)? login,
    TResult? Function(RegisterBusiness value)? registerBusiness,
    TResult? Function(RegisterIndividual value)? registerIndividual,
    TResult? Function(SendOtp value)? sendOtp,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ForgotPassword value)? forgotPassword,
    TResult? Function(VerifyforgotPassword value)? verifyforgotPassword,
    TResult? Function(ChangePassword value)? changePassword,
    TResult? Function(ShowValidateError value)? showValidateError,
    TResult? Function(Log value)? log,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Login value)? login,
    TResult Function(RegisterBusiness value)? registerBusiness,
    TResult Function(RegisterIndividual value)? registerIndividual,
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ForgotPassword value)? forgotPassword,
    TResult Function(VerifyforgotPassword value)? verifyforgotPassword,
    TResult Function(ChangePassword value)? changePassword,
    TResult Function(ShowValidateError value)? showValidateError,
    TResult Function(Log value)? log,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoginImplCopyWith<$Res> {
  factory _$$LoginImplCopyWith(
          _$LoginImpl value, $Res Function(_$LoginImpl) then) =
      __$$LoginImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LoginModel loginModel});
}

/// @nodoc
class __$$LoginImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LoginImpl>
    implements _$$LoginImplCopyWith<$Res> {
  __$$LoginImplCopyWithImpl(
      _$LoginImpl _value, $Res Function(_$LoginImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginModel = null,
  }) {
    return _then(_$LoginImpl(
      loginModel: null == loginModel
          ? _value.loginModel
          : loginModel // ignore: cast_nullable_to_non_nullable
              as LoginModel,
    ));
  }
}

/// @nodoc

class _$LoginImpl implements Login {
  const _$LoginImpl({required this.loginModel});

  @override
  final LoginModel loginModel;

  @override
  String toString() {
    return 'AuthEvent.login(loginModel: $loginModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginImpl &&
            (identical(other.loginModel, loginModel) ||
                other.loginModel == loginModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loginModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginImplCopyWith<_$LoginImpl> get copyWith =>
      __$$LoginImplCopyWithImpl<_$LoginImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoginModel loginModel) login,
    required TResult Function(SignUpModel signUpModel) registerBusiness,
    required TResult Function(SignUpIndivudalModel signUpIndivudalModel)
        registerIndividual,
    required TResult Function(EmailModel emailModel) sendOtp,
    required TResult Function(VerifyOtpModel verifyOtpModel) verifyOtp,
    required TResult Function(EmailModel emailModel) forgotPassword,
    required TResult Function(VerifyOtpModel verifyOtpModel)
        verifyforgotPassword,
    required TResult Function(ChangePasswordModel changePasswordModel)
        changePassword,
    required TResult Function() showValidateError,
    required TResult Function() log,
  }) {
    return login(loginModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoginModel loginModel)? login,
    TResult? Function(SignUpModel signUpModel)? registerBusiness,
    TResult? Function(SignUpIndivudalModel signUpIndivudalModel)?
        registerIndividual,
    TResult? Function(EmailModel emailModel)? sendOtp,
    TResult? Function(VerifyOtpModel verifyOtpModel)? verifyOtp,
    TResult? Function(EmailModel emailModel)? forgotPassword,
    TResult? Function(VerifyOtpModel verifyOtpModel)? verifyforgotPassword,
    TResult? Function(ChangePasswordModel changePasswordModel)? changePassword,
    TResult? Function()? showValidateError,
    TResult? Function()? log,
  }) {
    return login?.call(loginModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginModel loginModel)? login,
    TResult Function(SignUpModel signUpModel)? registerBusiness,
    TResult Function(SignUpIndivudalModel signUpIndivudalModel)?
        registerIndividual,
    TResult Function(EmailModel emailModel)? sendOtp,
    TResult Function(VerifyOtpModel verifyOtpModel)? verifyOtp,
    TResult Function(EmailModel emailModel)? forgotPassword,
    TResult Function(VerifyOtpModel verifyOtpModel)? verifyforgotPassword,
    TResult Function(ChangePasswordModel changePasswordModel)? changePassword,
    TResult Function()? showValidateError,
    TResult Function()? log,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(loginModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Login value) login,
    required TResult Function(RegisterBusiness value) registerBusiness,
    required TResult Function(RegisterIndividual value) registerIndividual,
    required TResult Function(SendOtp value) sendOtp,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ForgotPassword value) forgotPassword,
    required TResult Function(VerifyforgotPassword value) verifyforgotPassword,
    required TResult Function(ChangePassword value) changePassword,
    required TResult Function(ShowValidateError value) showValidateError,
    required TResult Function(Log value) log,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Login value)? login,
    TResult? Function(RegisterBusiness value)? registerBusiness,
    TResult? Function(RegisterIndividual value)? registerIndividual,
    TResult? Function(SendOtp value)? sendOtp,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ForgotPassword value)? forgotPassword,
    TResult? Function(VerifyforgotPassword value)? verifyforgotPassword,
    TResult? Function(ChangePassword value)? changePassword,
    TResult? Function(ShowValidateError value)? showValidateError,
    TResult? Function(Log value)? log,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Login value)? login,
    TResult Function(RegisterBusiness value)? registerBusiness,
    TResult Function(RegisterIndividual value)? registerIndividual,
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ForgotPassword value)? forgotPassword,
    TResult Function(VerifyforgotPassword value)? verifyforgotPassword,
    TResult Function(ChangePassword value)? changePassword,
    TResult Function(ShowValidateError value)? showValidateError,
    TResult Function(Log value)? log,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class Login implements AuthEvent {
  const factory Login({required final LoginModel loginModel}) = _$LoginImpl;

  LoginModel get loginModel;
  @JsonKey(ignore: true)
  _$$LoginImplCopyWith<_$LoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterBusinessImplCopyWith<$Res> {
  factory _$$RegisterBusinessImplCopyWith(_$RegisterBusinessImpl value,
          $Res Function(_$RegisterBusinessImpl) then) =
      __$$RegisterBusinessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SignUpModel signUpModel});
}

/// @nodoc
class __$$RegisterBusinessImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$RegisterBusinessImpl>
    implements _$$RegisterBusinessImplCopyWith<$Res> {
  __$$RegisterBusinessImplCopyWithImpl(_$RegisterBusinessImpl _value,
      $Res Function(_$RegisterBusinessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signUpModel = null,
  }) {
    return _then(_$RegisterBusinessImpl(
      signUpModel: null == signUpModel
          ? _value.signUpModel
          : signUpModel // ignore: cast_nullable_to_non_nullable
              as SignUpModel,
    ));
  }
}

/// @nodoc

class _$RegisterBusinessImpl implements RegisterBusiness {
  const _$RegisterBusinessImpl({required this.signUpModel});

  @override
  final SignUpModel signUpModel;

  @override
  String toString() {
    return 'AuthEvent.registerBusiness(signUpModel: $signUpModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterBusinessImpl &&
            (identical(other.signUpModel, signUpModel) ||
                other.signUpModel == signUpModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, signUpModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterBusinessImplCopyWith<_$RegisterBusinessImpl> get copyWith =>
      __$$RegisterBusinessImplCopyWithImpl<_$RegisterBusinessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoginModel loginModel) login,
    required TResult Function(SignUpModel signUpModel) registerBusiness,
    required TResult Function(SignUpIndivudalModel signUpIndivudalModel)
        registerIndividual,
    required TResult Function(EmailModel emailModel) sendOtp,
    required TResult Function(VerifyOtpModel verifyOtpModel) verifyOtp,
    required TResult Function(EmailModel emailModel) forgotPassword,
    required TResult Function(VerifyOtpModel verifyOtpModel)
        verifyforgotPassword,
    required TResult Function(ChangePasswordModel changePasswordModel)
        changePassword,
    required TResult Function() showValidateError,
    required TResult Function() log,
  }) {
    return registerBusiness(signUpModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoginModel loginModel)? login,
    TResult? Function(SignUpModel signUpModel)? registerBusiness,
    TResult? Function(SignUpIndivudalModel signUpIndivudalModel)?
        registerIndividual,
    TResult? Function(EmailModel emailModel)? sendOtp,
    TResult? Function(VerifyOtpModel verifyOtpModel)? verifyOtp,
    TResult? Function(EmailModel emailModel)? forgotPassword,
    TResult? Function(VerifyOtpModel verifyOtpModel)? verifyforgotPassword,
    TResult? Function(ChangePasswordModel changePasswordModel)? changePassword,
    TResult? Function()? showValidateError,
    TResult? Function()? log,
  }) {
    return registerBusiness?.call(signUpModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginModel loginModel)? login,
    TResult Function(SignUpModel signUpModel)? registerBusiness,
    TResult Function(SignUpIndivudalModel signUpIndivudalModel)?
        registerIndividual,
    TResult Function(EmailModel emailModel)? sendOtp,
    TResult Function(VerifyOtpModel verifyOtpModel)? verifyOtp,
    TResult Function(EmailModel emailModel)? forgotPassword,
    TResult Function(VerifyOtpModel verifyOtpModel)? verifyforgotPassword,
    TResult Function(ChangePasswordModel changePasswordModel)? changePassword,
    TResult Function()? showValidateError,
    TResult Function()? log,
    required TResult orElse(),
  }) {
    if (registerBusiness != null) {
      return registerBusiness(signUpModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Login value) login,
    required TResult Function(RegisterBusiness value) registerBusiness,
    required TResult Function(RegisterIndividual value) registerIndividual,
    required TResult Function(SendOtp value) sendOtp,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ForgotPassword value) forgotPassword,
    required TResult Function(VerifyforgotPassword value) verifyforgotPassword,
    required TResult Function(ChangePassword value) changePassword,
    required TResult Function(ShowValidateError value) showValidateError,
    required TResult Function(Log value) log,
  }) {
    return registerBusiness(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Login value)? login,
    TResult? Function(RegisterBusiness value)? registerBusiness,
    TResult? Function(RegisterIndividual value)? registerIndividual,
    TResult? Function(SendOtp value)? sendOtp,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ForgotPassword value)? forgotPassword,
    TResult? Function(VerifyforgotPassword value)? verifyforgotPassword,
    TResult? Function(ChangePassword value)? changePassword,
    TResult? Function(ShowValidateError value)? showValidateError,
    TResult? Function(Log value)? log,
  }) {
    return registerBusiness?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Login value)? login,
    TResult Function(RegisterBusiness value)? registerBusiness,
    TResult Function(RegisterIndividual value)? registerIndividual,
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ForgotPassword value)? forgotPassword,
    TResult Function(VerifyforgotPassword value)? verifyforgotPassword,
    TResult Function(ChangePassword value)? changePassword,
    TResult Function(ShowValidateError value)? showValidateError,
    TResult Function(Log value)? log,
    required TResult orElse(),
  }) {
    if (registerBusiness != null) {
      return registerBusiness(this);
    }
    return orElse();
  }
}

abstract class RegisterBusiness implements AuthEvent {
  const factory RegisterBusiness({required final SignUpModel signUpModel}) =
      _$RegisterBusinessImpl;

  SignUpModel get signUpModel;
  @JsonKey(ignore: true)
  _$$RegisterBusinessImplCopyWith<_$RegisterBusinessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterIndividualImplCopyWith<$Res> {
  factory _$$RegisterIndividualImplCopyWith(_$RegisterIndividualImpl value,
          $Res Function(_$RegisterIndividualImpl) then) =
      __$$RegisterIndividualImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SignUpIndivudalModel signUpIndivudalModel});
}

/// @nodoc
class __$$RegisterIndividualImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$RegisterIndividualImpl>
    implements _$$RegisterIndividualImplCopyWith<$Res> {
  __$$RegisterIndividualImplCopyWithImpl(_$RegisterIndividualImpl _value,
      $Res Function(_$RegisterIndividualImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signUpIndivudalModel = null,
  }) {
    return _then(_$RegisterIndividualImpl(
      signUpIndivudalModel: null == signUpIndivudalModel
          ? _value.signUpIndivudalModel
          : signUpIndivudalModel // ignore: cast_nullable_to_non_nullable
              as SignUpIndivudalModel,
    ));
  }
}

/// @nodoc

class _$RegisterIndividualImpl implements RegisterIndividual {
  const _$RegisterIndividualImpl({required this.signUpIndivudalModel});

  @override
  final SignUpIndivudalModel signUpIndivudalModel;

  @override
  String toString() {
    return 'AuthEvent.registerIndividual(signUpIndivudalModel: $signUpIndivudalModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterIndividualImpl &&
            (identical(other.signUpIndivudalModel, signUpIndivudalModel) ||
                other.signUpIndivudalModel == signUpIndivudalModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, signUpIndivudalModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterIndividualImplCopyWith<_$RegisterIndividualImpl> get copyWith =>
      __$$RegisterIndividualImplCopyWithImpl<_$RegisterIndividualImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoginModel loginModel) login,
    required TResult Function(SignUpModel signUpModel) registerBusiness,
    required TResult Function(SignUpIndivudalModel signUpIndivudalModel)
        registerIndividual,
    required TResult Function(EmailModel emailModel) sendOtp,
    required TResult Function(VerifyOtpModel verifyOtpModel) verifyOtp,
    required TResult Function(EmailModel emailModel) forgotPassword,
    required TResult Function(VerifyOtpModel verifyOtpModel)
        verifyforgotPassword,
    required TResult Function(ChangePasswordModel changePasswordModel)
        changePassword,
    required TResult Function() showValidateError,
    required TResult Function() log,
  }) {
    return registerIndividual(signUpIndivudalModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoginModel loginModel)? login,
    TResult? Function(SignUpModel signUpModel)? registerBusiness,
    TResult? Function(SignUpIndivudalModel signUpIndivudalModel)?
        registerIndividual,
    TResult? Function(EmailModel emailModel)? sendOtp,
    TResult? Function(VerifyOtpModel verifyOtpModel)? verifyOtp,
    TResult? Function(EmailModel emailModel)? forgotPassword,
    TResult? Function(VerifyOtpModel verifyOtpModel)? verifyforgotPassword,
    TResult? Function(ChangePasswordModel changePasswordModel)? changePassword,
    TResult? Function()? showValidateError,
    TResult? Function()? log,
  }) {
    return registerIndividual?.call(signUpIndivudalModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginModel loginModel)? login,
    TResult Function(SignUpModel signUpModel)? registerBusiness,
    TResult Function(SignUpIndivudalModel signUpIndivudalModel)?
        registerIndividual,
    TResult Function(EmailModel emailModel)? sendOtp,
    TResult Function(VerifyOtpModel verifyOtpModel)? verifyOtp,
    TResult Function(EmailModel emailModel)? forgotPassword,
    TResult Function(VerifyOtpModel verifyOtpModel)? verifyforgotPassword,
    TResult Function(ChangePasswordModel changePasswordModel)? changePassword,
    TResult Function()? showValidateError,
    TResult Function()? log,
    required TResult orElse(),
  }) {
    if (registerIndividual != null) {
      return registerIndividual(signUpIndivudalModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Login value) login,
    required TResult Function(RegisterBusiness value) registerBusiness,
    required TResult Function(RegisterIndividual value) registerIndividual,
    required TResult Function(SendOtp value) sendOtp,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ForgotPassword value) forgotPassword,
    required TResult Function(VerifyforgotPassword value) verifyforgotPassword,
    required TResult Function(ChangePassword value) changePassword,
    required TResult Function(ShowValidateError value) showValidateError,
    required TResult Function(Log value) log,
  }) {
    return registerIndividual(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Login value)? login,
    TResult? Function(RegisterBusiness value)? registerBusiness,
    TResult? Function(RegisterIndividual value)? registerIndividual,
    TResult? Function(SendOtp value)? sendOtp,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ForgotPassword value)? forgotPassword,
    TResult? Function(VerifyforgotPassword value)? verifyforgotPassword,
    TResult? Function(ChangePassword value)? changePassword,
    TResult? Function(ShowValidateError value)? showValidateError,
    TResult? Function(Log value)? log,
  }) {
    return registerIndividual?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Login value)? login,
    TResult Function(RegisterBusiness value)? registerBusiness,
    TResult Function(RegisterIndividual value)? registerIndividual,
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ForgotPassword value)? forgotPassword,
    TResult Function(VerifyforgotPassword value)? verifyforgotPassword,
    TResult Function(ChangePassword value)? changePassword,
    TResult Function(ShowValidateError value)? showValidateError,
    TResult Function(Log value)? log,
    required TResult orElse(),
  }) {
    if (registerIndividual != null) {
      return registerIndividual(this);
    }
    return orElse();
  }
}

abstract class RegisterIndividual implements AuthEvent {
  const factory RegisterIndividual(
          {required final SignUpIndivudalModel signUpIndivudalModel}) =
      _$RegisterIndividualImpl;

  SignUpIndivudalModel get signUpIndivudalModel;
  @JsonKey(ignore: true)
  _$$RegisterIndividualImplCopyWith<_$RegisterIndividualImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendOtpImplCopyWith<$Res> {
  factory _$$SendOtpImplCopyWith(
          _$SendOtpImpl value, $Res Function(_$SendOtpImpl) then) =
      __$$SendOtpImplCopyWithImpl<$Res>;
  @useResult
  $Res call({EmailModel emailModel});
}

/// @nodoc
class __$$SendOtpImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SendOtpImpl>
    implements _$$SendOtpImplCopyWith<$Res> {
  __$$SendOtpImplCopyWithImpl(
      _$SendOtpImpl _value, $Res Function(_$SendOtpImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailModel = null,
  }) {
    return _then(_$SendOtpImpl(
      emailModel: null == emailModel
          ? _value.emailModel
          : emailModel // ignore: cast_nullable_to_non_nullable
              as EmailModel,
    ));
  }
}

/// @nodoc

class _$SendOtpImpl implements SendOtp {
  const _$SendOtpImpl({required this.emailModel});

  @override
  final EmailModel emailModel;

  @override
  String toString() {
    return 'AuthEvent.sendOtp(emailModel: $emailModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendOtpImpl &&
            (identical(other.emailModel, emailModel) ||
                other.emailModel == emailModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emailModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendOtpImplCopyWith<_$SendOtpImpl> get copyWith =>
      __$$SendOtpImplCopyWithImpl<_$SendOtpImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoginModel loginModel) login,
    required TResult Function(SignUpModel signUpModel) registerBusiness,
    required TResult Function(SignUpIndivudalModel signUpIndivudalModel)
        registerIndividual,
    required TResult Function(EmailModel emailModel) sendOtp,
    required TResult Function(VerifyOtpModel verifyOtpModel) verifyOtp,
    required TResult Function(EmailModel emailModel) forgotPassword,
    required TResult Function(VerifyOtpModel verifyOtpModel)
        verifyforgotPassword,
    required TResult Function(ChangePasswordModel changePasswordModel)
        changePassword,
    required TResult Function() showValidateError,
    required TResult Function() log,
  }) {
    return sendOtp(emailModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoginModel loginModel)? login,
    TResult? Function(SignUpModel signUpModel)? registerBusiness,
    TResult? Function(SignUpIndivudalModel signUpIndivudalModel)?
        registerIndividual,
    TResult? Function(EmailModel emailModel)? sendOtp,
    TResult? Function(VerifyOtpModel verifyOtpModel)? verifyOtp,
    TResult? Function(EmailModel emailModel)? forgotPassword,
    TResult? Function(VerifyOtpModel verifyOtpModel)? verifyforgotPassword,
    TResult? Function(ChangePasswordModel changePasswordModel)? changePassword,
    TResult? Function()? showValidateError,
    TResult? Function()? log,
  }) {
    return sendOtp?.call(emailModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginModel loginModel)? login,
    TResult Function(SignUpModel signUpModel)? registerBusiness,
    TResult Function(SignUpIndivudalModel signUpIndivudalModel)?
        registerIndividual,
    TResult Function(EmailModel emailModel)? sendOtp,
    TResult Function(VerifyOtpModel verifyOtpModel)? verifyOtp,
    TResult Function(EmailModel emailModel)? forgotPassword,
    TResult Function(VerifyOtpModel verifyOtpModel)? verifyforgotPassword,
    TResult Function(ChangePasswordModel changePasswordModel)? changePassword,
    TResult Function()? showValidateError,
    TResult Function()? log,
    required TResult orElse(),
  }) {
    if (sendOtp != null) {
      return sendOtp(emailModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Login value) login,
    required TResult Function(RegisterBusiness value) registerBusiness,
    required TResult Function(RegisterIndividual value) registerIndividual,
    required TResult Function(SendOtp value) sendOtp,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ForgotPassword value) forgotPassword,
    required TResult Function(VerifyforgotPassword value) verifyforgotPassword,
    required TResult Function(ChangePassword value) changePassword,
    required TResult Function(ShowValidateError value) showValidateError,
    required TResult Function(Log value) log,
  }) {
    return sendOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Login value)? login,
    TResult? Function(RegisterBusiness value)? registerBusiness,
    TResult? Function(RegisterIndividual value)? registerIndividual,
    TResult? Function(SendOtp value)? sendOtp,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ForgotPassword value)? forgotPassword,
    TResult? Function(VerifyforgotPassword value)? verifyforgotPassword,
    TResult? Function(ChangePassword value)? changePassword,
    TResult? Function(ShowValidateError value)? showValidateError,
    TResult? Function(Log value)? log,
  }) {
    return sendOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Login value)? login,
    TResult Function(RegisterBusiness value)? registerBusiness,
    TResult Function(RegisterIndividual value)? registerIndividual,
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ForgotPassword value)? forgotPassword,
    TResult Function(VerifyforgotPassword value)? verifyforgotPassword,
    TResult Function(ChangePassword value)? changePassword,
    TResult Function(ShowValidateError value)? showValidateError,
    TResult Function(Log value)? log,
    required TResult orElse(),
  }) {
    if (sendOtp != null) {
      return sendOtp(this);
    }
    return orElse();
  }
}

abstract class SendOtp implements AuthEvent {
  const factory SendOtp({required final EmailModel emailModel}) = _$SendOtpImpl;

  EmailModel get emailModel;
  @JsonKey(ignore: true)
  _$$SendOtpImplCopyWith<_$SendOtpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyOtpImplCopyWith<$Res> {
  factory _$$VerifyOtpImplCopyWith(
          _$VerifyOtpImpl value, $Res Function(_$VerifyOtpImpl) then) =
      __$$VerifyOtpImplCopyWithImpl<$Res>;
  @useResult
  $Res call({VerifyOtpModel verifyOtpModel});
}

/// @nodoc
class __$$VerifyOtpImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$VerifyOtpImpl>
    implements _$$VerifyOtpImplCopyWith<$Res> {
  __$$VerifyOtpImplCopyWithImpl(
      _$VerifyOtpImpl _value, $Res Function(_$VerifyOtpImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verifyOtpModel = null,
  }) {
    return _then(_$VerifyOtpImpl(
      verifyOtpModel: null == verifyOtpModel
          ? _value.verifyOtpModel
          : verifyOtpModel // ignore: cast_nullable_to_non_nullable
              as VerifyOtpModel,
    ));
  }
}

/// @nodoc

class _$VerifyOtpImpl implements VerifyOtp {
  const _$VerifyOtpImpl({required this.verifyOtpModel});

  @override
  final VerifyOtpModel verifyOtpModel;

  @override
  String toString() {
    return 'AuthEvent.verifyOtp(verifyOtpModel: $verifyOtpModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOtpImpl &&
            (identical(other.verifyOtpModel, verifyOtpModel) ||
                other.verifyOtpModel == verifyOtpModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, verifyOtpModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyOtpImplCopyWith<_$VerifyOtpImpl> get copyWith =>
      __$$VerifyOtpImplCopyWithImpl<_$VerifyOtpImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoginModel loginModel) login,
    required TResult Function(SignUpModel signUpModel) registerBusiness,
    required TResult Function(SignUpIndivudalModel signUpIndivudalModel)
        registerIndividual,
    required TResult Function(EmailModel emailModel) sendOtp,
    required TResult Function(VerifyOtpModel verifyOtpModel) verifyOtp,
    required TResult Function(EmailModel emailModel) forgotPassword,
    required TResult Function(VerifyOtpModel verifyOtpModel)
        verifyforgotPassword,
    required TResult Function(ChangePasswordModel changePasswordModel)
        changePassword,
    required TResult Function() showValidateError,
    required TResult Function() log,
  }) {
    return verifyOtp(verifyOtpModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoginModel loginModel)? login,
    TResult? Function(SignUpModel signUpModel)? registerBusiness,
    TResult? Function(SignUpIndivudalModel signUpIndivudalModel)?
        registerIndividual,
    TResult? Function(EmailModel emailModel)? sendOtp,
    TResult? Function(VerifyOtpModel verifyOtpModel)? verifyOtp,
    TResult? Function(EmailModel emailModel)? forgotPassword,
    TResult? Function(VerifyOtpModel verifyOtpModel)? verifyforgotPassword,
    TResult? Function(ChangePasswordModel changePasswordModel)? changePassword,
    TResult? Function()? showValidateError,
    TResult? Function()? log,
  }) {
    return verifyOtp?.call(verifyOtpModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginModel loginModel)? login,
    TResult Function(SignUpModel signUpModel)? registerBusiness,
    TResult Function(SignUpIndivudalModel signUpIndivudalModel)?
        registerIndividual,
    TResult Function(EmailModel emailModel)? sendOtp,
    TResult Function(VerifyOtpModel verifyOtpModel)? verifyOtp,
    TResult Function(EmailModel emailModel)? forgotPassword,
    TResult Function(VerifyOtpModel verifyOtpModel)? verifyforgotPassword,
    TResult Function(ChangePasswordModel changePasswordModel)? changePassword,
    TResult Function()? showValidateError,
    TResult Function()? log,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp(verifyOtpModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Login value) login,
    required TResult Function(RegisterBusiness value) registerBusiness,
    required TResult Function(RegisterIndividual value) registerIndividual,
    required TResult Function(SendOtp value) sendOtp,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ForgotPassword value) forgotPassword,
    required TResult Function(VerifyforgotPassword value) verifyforgotPassword,
    required TResult Function(ChangePassword value) changePassword,
    required TResult Function(ShowValidateError value) showValidateError,
    required TResult Function(Log value) log,
  }) {
    return verifyOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Login value)? login,
    TResult? Function(RegisterBusiness value)? registerBusiness,
    TResult? Function(RegisterIndividual value)? registerIndividual,
    TResult? Function(SendOtp value)? sendOtp,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ForgotPassword value)? forgotPassword,
    TResult? Function(VerifyforgotPassword value)? verifyforgotPassword,
    TResult? Function(ChangePassword value)? changePassword,
    TResult? Function(ShowValidateError value)? showValidateError,
    TResult? Function(Log value)? log,
  }) {
    return verifyOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Login value)? login,
    TResult Function(RegisterBusiness value)? registerBusiness,
    TResult Function(RegisterIndividual value)? registerIndividual,
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ForgotPassword value)? forgotPassword,
    TResult Function(VerifyforgotPassword value)? verifyforgotPassword,
    TResult Function(ChangePassword value)? changePassword,
    TResult Function(ShowValidateError value)? showValidateError,
    TResult Function(Log value)? log,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp(this);
    }
    return orElse();
  }
}

abstract class VerifyOtp implements AuthEvent {
  const factory VerifyOtp({required final VerifyOtpModel verifyOtpModel}) =
      _$VerifyOtpImpl;

  VerifyOtpModel get verifyOtpModel;
  @JsonKey(ignore: true)
  _$$VerifyOtpImplCopyWith<_$VerifyOtpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ForgotPasswordImplCopyWith<$Res> {
  factory _$$ForgotPasswordImplCopyWith(_$ForgotPasswordImpl value,
          $Res Function(_$ForgotPasswordImpl) then) =
      __$$ForgotPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({EmailModel emailModel});
}

/// @nodoc
class __$$ForgotPasswordImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ForgotPasswordImpl>
    implements _$$ForgotPasswordImplCopyWith<$Res> {
  __$$ForgotPasswordImplCopyWithImpl(
      _$ForgotPasswordImpl _value, $Res Function(_$ForgotPasswordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailModel = null,
  }) {
    return _then(_$ForgotPasswordImpl(
      emailModel: null == emailModel
          ? _value.emailModel
          : emailModel // ignore: cast_nullable_to_non_nullable
              as EmailModel,
    ));
  }
}

/// @nodoc

class _$ForgotPasswordImpl implements ForgotPassword {
  const _$ForgotPasswordImpl({required this.emailModel});

  @override
  final EmailModel emailModel;

  @override
  String toString() {
    return 'AuthEvent.forgotPassword(emailModel: $emailModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordImpl &&
            (identical(other.emailModel, emailModel) ||
                other.emailModel == emailModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emailModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPasswordImplCopyWith<_$ForgotPasswordImpl> get copyWith =>
      __$$ForgotPasswordImplCopyWithImpl<_$ForgotPasswordImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoginModel loginModel) login,
    required TResult Function(SignUpModel signUpModel) registerBusiness,
    required TResult Function(SignUpIndivudalModel signUpIndivudalModel)
        registerIndividual,
    required TResult Function(EmailModel emailModel) sendOtp,
    required TResult Function(VerifyOtpModel verifyOtpModel) verifyOtp,
    required TResult Function(EmailModel emailModel) forgotPassword,
    required TResult Function(VerifyOtpModel verifyOtpModel)
        verifyforgotPassword,
    required TResult Function(ChangePasswordModel changePasswordModel)
        changePassword,
    required TResult Function() showValidateError,
    required TResult Function() log,
  }) {
    return forgotPassword(emailModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoginModel loginModel)? login,
    TResult? Function(SignUpModel signUpModel)? registerBusiness,
    TResult? Function(SignUpIndivudalModel signUpIndivudalModel)?
        registerIndividual,
    TResult? Function(EmailModel emailModel)? sendOtp,
    TResult? Function(VerifyOtpModel verifyOtpModel)? verifyOtp,
    TResult? Function(EmailModel emailModel)? forgotPassword,
    TResult? Function(VerifyOtpModel verifyOtpModel)? verifyforgotPassword,
    TResult? Function(ChangePasswordModel changePasswordModel)? changePassword,
    TResult? Function()? showValidateError,
    TResult? Function()? log,
  }) {
    return forgotPassword?.call(emailModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginModel loginModel)? login,
    TResult Function(SignUpModel signUpModel)? registerBusiness,
    TResult Function(SignUpIndivudalModel signUpIndivudalModel)?
        registerIndividual,
    TResult Function(EmailModel emailModel)? sendOtp,
    TResult Function(VerifyOtpModel verifyOtpModel)? verifyOtp,
    TResult Function(EmailModel emailModel)? forgotPassword,
    TResult Function(VerifyOtpModel verifyOtpModel)? verifyforgotPassword,
    TResult Function(ChangePasswordModel changePasswordModel)? changePassword,
    TResult Function()? showValidateError,
    TResult Function()? log,
    required TResult orElse(),
  }) {
    if (forgotPassword != null) {
      return forgotPassword(emailModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Login value) login,
    required TResult Function(RegisterBusiness value) registerBusiness,
    required TResult Function(RegisterIndividual value) registerIndividual,
    required TResult Function(SendOtp value) sendOtp,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ForgotPassword value) forgotPassword,
    required TResult Function(VerifyforgotPassword value) verifyforgotPassword,
    required TResult Function(ChangePassword value) changePassword,
    required TResult Function(ShowValidateError value) showValidateError,
    required TResult Function(Log value) log,
  }) {
    return forgotPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Login value)? login,
    TResult? Function(RegisterBusiness value)? registerBusiness,
    TResult? Function(RegisterIndividual value)? registerIndividual,
    TResult? Function(SendOtp value)? sendOtp,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ForgotPassword value)? forgotPassword,
    TResult? Function(VerifyforgotPassword value)? verifyforgotPassword,
    TResult? Function(ChangePassword value)? changePassword,
    TResult? Function(ShowValidateError value)? showValidateError,
    TResult? Function(Log value)? log,
  }) {
    return forgotPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Login value)? login,
    TResult Function(RegisterBusiness value)? registerBusiness,
    TResult Function(RegisterIndividual value)? registerIndividual,
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ForgotPassword value)? forgotPassword,
    TResult Function(VerifyforgotPassword value)? verifyforgotPassword,
    TResult Function(ChangePassword value)? changePassword,
    TResult Function(ShowValidateError value)? showValidateError,
    TResult Function(Log value)? log,
    required TResult orElse(),
  }) {
    if (forgotPassword != null) {
      return forgotPassword(this);
    }
    return orElse();
  }
}

abstract class ForgotPassword implements AuthEvent {
  const factory ForgotPassword({required final EmailModel emailModel}) =
      _$ForgotPasswordImpl;

  EmailModel get emailModel;
  @JsonKey(ignore: true)
  _$$ForgotPasswordImplCopyWith<_$ForgotPasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyforgotPasswordImplCopyWith<$Res> {
  factory _$$VerifyforgotPasswordImplCopyWith(_$VerifyforgotPasswordImpl value,
          $Res Function(_$VerifyforgotPasswordImpl) then) =
      __$$VerifyforgotPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({VerifyOtpModel verifyOtpModel});
}

/// @nodoc
class __$$VerifyforgotPasswordImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$VerifyforgotPasswordImpl>
    implements _$$VerifyforgotPasswordImplCopyWith<$Res> {
  __$$VerifyforgotPasswordImplCopyWithImpl(_$VerifyforgotPasswordImpl _value,
      $Res Function(_$VerifyforgotPasswordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verifyOtpModel = null,
  }) {
    return _then(_$VerifyforgotPasswordImpl(
      verifyOtpModel: null == verifyOtpModel
          ? _value.verifyOtpModel
          : verifyOtpModel // ignore: cast_nullable_to_non_nullable
              as VerifyOtpModel,
    ));
  }
}

/// @nodoc

class _$VerifyforgotPasswordImpl implements VerifyforgotPassword {
  const _$VerifyforgotPasswordImpl({required this.verifyOtpModel});

  @override
  final VerifyOtpModel verifyOtpModel;

  @override
  String toString() {
    return 'AuthEvent.verifyforgotPassword(verifyOtpModel: $verifyOtpModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyforgotPasswordImpl &&
            (identical(other.verifyOtpModel, verifyOtpModel) ||
                other.verifyOtpModel == verifyOtpModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, verifyOtpModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyforgotPasswordImplCopyWith<_$VerifyforgotPasswordImpl>
      get copyWith =>
          __$$VerifyforgotPasswordImplCopyWithImpl<_$VerifyforgotPasswordImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoginModel loginModel) login,
    required TResult Function(SignUpModel signUpModel) registerBusiness,
    required TResult Function(SignUpIndivudalModel signUpIndivudalModel)
        registerIndividual,
    required TResult Function(EmailModel emailModel) sendOtp,
    required TResult Function(VerifyOtpModel verifyOtpModel) verifyOtp,
    required TResult Function(EmailModel emailModel) forgotPassword,
    required TResult Function(VerifyOtpModel verifyOtpModel)
        verifyforgotPassword,
    required TResult Function(ChangePasswordModel changePasswordModel)
        changePassword,
    required TResult Function() showValidateError,
    required TResult Function() log,
  }) {
    return verifyforgotPassword(verifyOtpModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoginModel loginModel)? login,
    TResult? Function(SignUpModel signUpModel)? registerBusiness,
    TResult? Function(SignUpIndivudalModel signUpIndivudalModel)?
        registerIndividual,
    TResult? Function(EmailModel emailModel)? sendOtp,
    TResult? Function(VerifyOtpModel verifyOtpModel)? verifyOtp,
    TResult? Function(EmailModel emailModel)? forgotPassword,
    TResult? Function(VerifyOtpModel verifyOtpModel)? verifyforgotPassword,
    TResult? Function(ChangePasswordModel changePasswordModel)? changePassword,
    TResult? Function()? showValidateError,
    TResult? Function()? log,
  }) {
    return verifyforgotPassword?.call(verifyOtpModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginModel loginModel)? login,
    TResult Function(SignUpModel signUpModel)? registerBusiness,
    TResult Function(SignUpIndivudalModel signUpIndivudalModel)?
        registerIndividual,
    TResult Function(EmailModel emailModel)? sendOtp,
    TResult Function(VerifyOtpModel verifyOtpModel)? verifyOtp,
    TResult Function(EmailModel emailModel)? forgotPassword,
    TResult Function(VerifyOtpModel verifyOtpModel)? verifyforgotPassword,
    TResult Function(ChangePasswordModel changePasswordModel)? changePassword,
    TResult Function()? showValidateError,
    TResult Function()? log,
    required TResult orElse(),
  }) {
    if (verifyforgotPassword != null) {
      return verifyforgotPassword(verifyOtpModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Login value) login,
    required TResult Function(RegisterBusiness value) registerBusiness,
    required TResult Function(RegisterIndividual value) registerIndividual,
    required TResult Function(SendOtp value) sendOtp,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ForgotPassword value) forgotPassword,
    required TResult Function(VerifyforgotPassword value) verifyforgotPassword,
    required TResult Function(ChangePassword value) changePassword,
    required TResult Function(ShowValidateError value) showValidateError,
    required TResult Function(Log value) log,
  }) {
    return verifyforgotPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Login value)? login,
    TResult? Function(RegisterBusiness value)? registerBusiness,
    TResult? Function(RegisterIndividual value)? registerIndividual,
    TResult? Function(SendOtp value)? sendOtp,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ForgotPassword value)? forgotPassword,
    TResult? Function(VerifyforgotPassword value)? verifyforgotPassword,
    TResult? Function(ChangePassword value)? changePassword,
    TResult? Function(ShowValidateError value)? showValidateError,
    TResult? Function(Log value)? log,
  }) {
    return verifyforgotPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Login value)? login,
    TResult Function(RegisterBusiness value)? registerBusiness,
    TResult Function(RegisterIndividual value)? registerIndividual,
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ForgotPassword value)? forgotPassword,
    TResult Function(VerifyforgotPassword value)? verifyforgotPassword,
    TResult Function(ChangePassword value)? changePassword,
    TResult Function(ShowValidateError value)? showValidateError,
    TResult Function(Log value)? log,
    required TResult orElse(),
  }) {
    if (verifyforgotPassword != null) {
      return verifyforgotPassword(this);
    }
    return orElse();
  }
}

abstract class VerifyforgotPassword implements AuthEvent {
  const factory VerifyforgotPassword(
          {required final VerifyOtpModel verifyOtpModel}) =
      _$VerifyforgotPasswordImpl;

  VerifyOtpModel get verifyOtpModel;
  @JsonKey(ignore: true)
  _$$VerifyforgotPasswordImplCopyWith<_$VerifyforgotPasswordImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangePasswordImplCopyWith<$Res> {
  factory _$$ChangePasswordImplCopyWith(_$ChangePasswordImpl value,
          $Res Function(_$ChangePasswordImpl) then) =
      __$$ChangePasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ChangePasswordModel changePasswordModel});
}

/// @nodoc
class __$$ChangePasswordImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ChangePasswordImpl>
    implements _$$ChangePasswordImplCopyWith<$Res> {
  __$$ChangePasswordImplCopyWithImpl(
      _$ChangePasswordImpl _value, $Res Function(_$ChangePasswordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? changePasswordModel = null,
  }) {
    return _then(_$ChangePasswordImpl(
      changePasswordModel: null == changePasswordModel
          ? _value.changePasswordModel
          : changePasswordModel // ignore: cast_nullable_to_non_nullable
              as ChangePasswordModel,
    ));
  }
}

/// @nodoc

class _$ChangePasswordImpl implements ChangePassword {
  const _$ChangePasswordImpl({required this.changePasswordModel});

  @override
  final ChangePasswordModel changePasswordModel;

  @override
  String toString() {
    return 'AuthEvent.changePassword(changePasswordModel: $changePasswordModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePasswordImpl &&
            (identical(other.changePasswordModel, changePasswordModel) ||
                other.changePasswordModel == changePasswordModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, changePasswordModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePasswordImplCopyWith<_$ChangePasswordImpl> get copyWith =>
      __$$ChangePasswordImplCopyWithImpl<_$ChangePasswordImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoginModel loginModel) login,
    required TResult Function(SignUpModel signUpModel) registerBusiness,
    required TResult Function(SignUpIndivudalModel signUpIndivudalModel)
        registerIndividual,
    required TResult Function(EmailModel emailModel) sendOtp,
    required TResult Function(VerifyOtpModel verifyOtpModel) verifyOtp,
    required TResult Function(EmailModel emailModel) forgotPassword,
    required TResult Function(VerifyOtpModel verifyOtpModel)
        verifyforgotPassword,
    required TResult Function(ChangePasswordModel changePasswordModel)
        changePassword,
    required TResult Function() showValidateError,
    required TResult Function() log,
  }) {
    return changePassword(changePasswordModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoginModel loginModel)? login,
    TResult? Function(SignUpModel signUpModel)? registerBusiness,
    TResult? Function(SignUpIndivudalModel signUpIndivudalModel)?
        registerIndividual,
    TResult? Function(EmailModel emailModel)? sendOtp,
    TResult? Function(VerifyOtpModel verifyOtpModel)? verifyOtp,
    TResult? Function(EmailModel emailModel)? forgotPassword,
    TResult? Function(VerifyOtpModel verifyOtpModel)? verifyforgotPassword,
    TResult? Function(ChangePasswordModel changePasswordModel)? changePassword,
    TResult? Function()? showValidateError,
    TResult? Function()? log,
  }) {
    return changePassword?.call(changePasswordModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginModel loginModel)? login,
    TResult Function(SignUpModel signUpModel)? registerBusiness,
    TResult Function(SignUpIndivudalModel signUpIndivudalModel)?
        registerIndividual,
    TResult Function(EmailModel emailModel)? sendOtp,
    TResult Function(VerifyOtpModel verifyOtpModel)? verifyOtp,
    TResult Function(EmailModel emailModel)? forgotPassword,
    TResult Function(VerifyOtpModel verifyOtpModel)? verifyforgotPassword,
    TResult Function(ChangePasswordModel changePasswordModel)? changePassword,
    TResult Function()? showValidateError,
    TResult Function()? log,
    required TResult orElse(),
  }) {
    if (changePassword != null) {
      return changePassword(changePasswordModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Login value) login,
    required TResult Function(RegisterBusiness value) registerBusiness,
    required TResult Function(RegisterIndividual value) registerIndividual,
    required TResult Function(SendOtp value) sendOtp,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ForgotPassword value) forgotPassword,
    required TResult Function(VerifyforgotPassword value) verifyforgotPassword,
    required TResult Function(ChangePassword value) changePassword,
    required TResult Function(ShowValidateError value) showValidateError,
    required TResult Function(Log value) log,
  }) {
    return changePassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Login value)? login,
    TResult? Function(RegisterBusiness value)? registerBusiness,
    TResult? Function(RegisterIndividual value)? registerIndividual,
    TResult? Function(SendOtp value)? sendOtp,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ForgotPassword value)? forgotPassword,
    TResult? Function(VerifyforgotPassword value)? verifyforgotPassword,
    TResult? Function(ChangePassword value)? changePassword,
    TResult? Function(ShowValidateError value)? showValidateError,
    TResult? Function(Log value)? log,
  }) {
    return changePassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Login value)? login,
    TResult Function(RegisterBusiness value)? registerBusiness,
    TResult Function(RegisterIndividual value)? registerIndividual,
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ForgotPassword value)? forgotPassword,
    TResult Function(VerifyforgotPassword value)? verifyforgotPassword,
    TResult Function(ChangePassword value)? changePassword,
    TResult Function(ShowValidateError value)? showValidateError,
    TResult Function(Log value)? log,
    required TResult orElse(),
  }) {
    if (changePassword != null) {
      return changePassword(this);
    }
    return orElse();
  }
}

abstract class ChangePassword implements AuthEvent {
  const factory ChangePassword(
          {required final ChangePasswordModel changePasswordModel}) =
      _$ChangePasswordImpl;

  ChangePasswordModel get changePasswordModel;
  @JsonKey(ignore: true)
  _$$ChangePasswordImplCopyWith<_$ChangePasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShowValidateErrorImplCopyWith<$Res> {
  factory _$$ShowValidateErrorImplCopyWith(_$ShowValidateErrorImpl value,
          $Res Function(_$ShowValidateErrorImpl) then) =
      __$$ShowValidateErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ShowValidateErrorImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ShowValidateErrorImpl>
    implements _$$ShowValidateErrorImplCopyWith<$Res> {
  __$$ShowValidateErrorImplCopyWithImpl(_$ShowValidateErrorImpl _value,
      $Res Function(_$ShowValidateErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ShowValidateErrorImpl implements ShowValidateError {
  const _$ShowValidateErrorImpl();

  @override
  String toString() {
    return 'AuthEvent.showValidateError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ShowValidateErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoginModel loginModel) login,
    required TResult Function(SignUpModel signUpModel) registerBusiness,
    required TResult Function(SignUpIndivudalModel signUpIndivudalModel)
        registerIndividual,
    required TResult Function(EmailModel emailModel) sendOtp,
    required TResult Function(VerifyOtpModel verifyOtpModel) verifyOtp,
    required TResult Function(EmailModel emailModel) forgotPassword,
    required TResult Function(VerifyOtpModel verifyOtpModel)
        verifyforgotPassword,
    required TResult Function(ChangePasswordModel changePasswordModel)
        changePassword,
    required TResult Function() showValidateError,
    required TResult Function() log,
  }) {
    return showValidateError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoginModel loginModel)? login,
    TResult? Function(SignUpModel signUpModel)? registerBusiness,
    TResult? Function(SignUpIndivudalModel signUpIndivudalModel)?
        registerIndividual,
    TResult? Function(EmailModel emailModel)? sendOtp,
    TResult? Function(VerifyOtpModel verifyOtpModel)? verifyOtp,
    TResult? Function(EmailModel emailModel)? forgotPassword,
    TResult? Function(VerifyOtpModel verifyOtpModel)? verifyforgotPassword,
    TResult? Function(ChangePasswordModel changePasswordModel)? changePassword,
    TResult? Function()? showValidateError,
    TResult? Function()? log,
  }) {
    return showValidateError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginModel loginModel)? login,
    TResult Function(SignUpModel signUpModel)? registerBusiness,
    TResult Function(SignUpIndivudalModel signUpIndivudalModel)?
        registerIndividual,
    TResult Function(EmailModel emailModel)? sendOtp,
    TResult Function(VerifyOtpModel verifyOtpModel)? verifyOtp,
    TResult Function(EmailModel emailModel)? forgotPassword,
    TResult Function(VerifyOtpModel verifyOtpModel)? verifyforgotPassword,
    TResult Function(ChangePasswordModel changePasswordModel)? changePassword,
    TResult Function()? showValidateError,
    TResult Function()? log,
    required TResult orElse(),
  }) {
    if (showValidateError != null) {
      return showValidateError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Login value) login,
    required TResult Function(RegisterBusiness value) registerBusiness,
    required TResult Function(RegisterIndividual value) registerIndividual,
    required TResult Function(SendOtp value) sendOtp,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ForgotPassword value) forgotPassword,
    required TResult Function(VerifyforgotPassword value) verifyforgotPassword,
    required TResult Function(ChangePassword value) changePassword,
    required TResult Function(ShowValidateError value) showValidateError,
    required TResult Function(Log value) log,
  }) {
    return showValidateError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Login value)? login,
    TResult? Function(RegisterBusiness value)? registerBusiness,
    TResult? Function(RegisterIndividual value)? registerIndividual,
    TResult? Function(SendOtp value)? sendOtp,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ForgotPassword value)? forgotPassword,
    TResult? Function(VerifyforgotPassword value)? verifyforgotPassword,
    TResult? Function(ChangePassword value)? changePassword,
    TResult? Function(ShowValidateError value)? showValidateError,
    TResult? Function(Log value)? log,
  }) {
    return showValidateError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Login value)? login,
    TResult Function(RegisterBusiness value)? registerBusiness,
    TResult Function(RegisterIndividual value)? registerIndividual,
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ForgotPassword value)? forgotPassword,
    TResult Function(VerifyforgotPassword value)? verifyforgotPassword,
    TResult Function(ChangePassword value)? changePassword,
    TResult Function(ShowValidateError value)? showValidateError,
    TResult Function(Log value)? log,
    required TResult orElse(),
  }) {
    if (showValidateError != null) {
      return showValidateError(this);
    }
    return orElse();
  }
}

abstract class ShowValidateError implements AuthEvent {
  const factory ShowValidateError() = _$ShowValidateErrorImpl;
}

/// @nodoc
abstract class _$$LogImplCopyWith<$Res> {
  factory _$$LogImplCopyWith(_$LogImpl value, $Res Function(_$LogImpl) then) =
      __$$LogImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LogImpl>
    implements _$$LogImplCopyWith<$Res> {
  __$$LogImplCopyWithImpl(_$LogImpl _value, $Res Function(_$LogImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogImpl implements Log {
  const _$LogImpl();

  @override
  String toString() {
    return 'AuthEvent.log()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoginModel loginModel) login,
    required TResult Function(SignUpModel signUpModel) registerBusiness,
    required TResult Function(SignUpIndivudalModel signUpIndivudalModel)
        registerIndividual,
    required TResult Function(EmailModel emailModel) sendOtp,
    required TResult Function(VerifyOtpModel verifyOtpModel) verifyOtp,
    required TResult Function(EmailModel emailModel) forgotPassword,
    required TResult Function(VerifyOtpModel verifyOtpModel)
        verifyforgotPassword,
    required TResult Function(ChangePasswordModel changePasswordModel)
        changePassword,
    required TResult Function() showValidateError,
    required TResult Function() log,
  }) {
    return log();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoginModel loginModel)? login,
    TResult? Function(SignUpModel signUpModel)? registerBusiness,
    TResult? Function(SignUpIndivudalModel signUpIndivudalModel)?
        registerIndividual,
    TResult? Function(EmailModel emailModel)? sendOtp,
    TResult? Function(VerifyOtpModel verifyOtpModel)? verifyOtp,
    TResult? Function(EmailModel emailModel)? forgotPassword,
    TResult? Function(VerifyOtpModel verifyOtpModel)? verifyforgotPassword,
    TResult? Function(ChangePasswordModel changePasswordModel)? changePassword,
    TResult? Function()? showValidateError,
    TResult? Function()? log,
  }) {
    return log?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginModel loginModel)? login,
    TResult Function(SignUpModel signUpModel)? registerBusiness,
    TResult Function(SignUpIndivudalModel signUpIndivudalModel)?
        registerIndividual,
    TResult Function(EmailModel emailModel)? sendOtp,
    TResult Function(VerifyOtpModel verifyOtpModel)? verifyOtp,
    TResult Function(EmailModel emailModel)? forgotPassword,
    TResult Function(VerifyOtpModel verifyOtpModel)? verifyforgotPassword,
    TResult Function(ChangePasswordModel changePasswordModel)? changePassword,
    TResult Function()? showValidateError,
    TResult Function()? log,
    required TResult orElse(),
  }) {
    if (log != null) {
      return log();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Login value) login,
    required TResult Function(RegisterBusiness value) registerBusiness,
    required TResult Function(RegisterIndividual value) registerIndividual,
    required TResult Function(SendOtp value) sendOtp,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ForgotPassword value) forgotPassword,
    required TResult Function(VerifyforgotPassword value) verifyforgotPassword,
    required TResult Function(ChangePassword value) changePassword,
    required TResult Function(ShowValidateError value) showValidateError,
    required TResult Function(Log value) log,
  }) {
    return log(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Login value)? login,
    TResult? Function(RegisterBusiness value)? registerBusiness,
    TResult? Function(RegisterIndividual value)? registerIndividual,
    TResult? Function(SendOtp value)? sendOtp,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ForgotPassword value)? forgotPassword,
    TResult? Function(VerifyforgotPassword value)? verifyforgotPassword,
    TResult? Function(ChangePassword value)? changePassword,
    TResult? Function(ShowValidateError value)? showValidateError,
    TResult? Function(Log value)? log,
  }) {
    return log?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Login value)? login,
    TResult Function(RegisterBusiness value)? registerBusiness,
    TResult Function(RegisterIndividual value)? registerIndividual,
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ForgotPassword value)? forgotPassword,
    TResult Function(VerifyforgotPassword value)? verifyforgotPassword,
    TResult Function(ChangePassword value)? changePassword,
    TResult Function(ShowValidateError value)? showValidateError,
    TResult Function(Log value)? log,
    required TResult orElse(),
  }) {
    if (log != null) {
      return log(this);
    }
    return orElse();
  }
}

abstract class Log implements AuthEvent {
  const factory Log() = _$LogImpl;
}

/// @nodoc
mixin _$AuthState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  bool get otpSend => throw _privateConstructorUsedError;
  bool get otpVerified => throw _privateConstructorUsedError;
  bool get otpVerificationError => throw _privateConstructorUsedError;
  bool get otpVerifiedForgotPassword => throw _privateConstructorUsedError;
  bool get showValidateError => throw _privateConstructorUsedError;
  bool get isLogin => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  SignUpResponseModel? get signUpResponseModel =>
      throw _privateConstructorUsedError;
  LoginResponseModel? get loginResponseModel =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      bool otpSend,
      bool otpVerified,
      bool otpVerificationError,
      bool otpVerifiedForgotPassword,
      bool showValidateError,
      bool isLogin,
      String? message,
      SignUpResponseModel? signUpResponseModel,
      LoginResponseModel? loginResponseModel});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? otpSend = null,
    Object? otpVerified = null,
    Object? otpVerificationError = null,
    Object? otpVerifiedForgotPassword = null,
    Object? showValidateError = null,
    Object? isLogin = null,
    Object? message = freezed,
    Object? signUpResponseModel = freezed,
    Object? loginResponseModel = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      otpSend: null == otpSend
          ? _value.otpSend
          : otpSend // ignore: cast_nullable_to_non_nullable
              as bool,
      otpVerified: null == otpVerified
          ? _value.otpVerified
          : otpVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      otpVerificationError: null == otpVerificationError
          ? _value.otpVerificationError
          : otpVerificationError // ignore: cast_nullable_to_non_nullable
              as bool,
      otpVerifiedForgotPassword: null == otpVerifiedForgotPassword
          ? _value.otpVerifiedForgotPassword
          : otpVerifiedForgotPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      showValidateError: null == showValidateError
          ? _value.showValidateError
          : showValidateError // ignore: cast_nullable_to_non_nullable
              as bool,
      isLogin: null == isLogin
          ? _value.isLogin
          : isLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      signUpResponseModel: freezed == signUpResponseModel
          ? _value.signUpResponseModel
          : signUpResponseModel // ignore: cast_nullable_to_non_nullable
              as SignUpResponseModel?,
      loginResponseModel: freezed == loginResponseModel
          ? _value.loginResponseModel
          : loginResponseModel // ignore: cast_nullable_to_non_nullable
              as LoginResponseModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      bool otpSend,
      bool otpVerified,
      bool otpVerificationError,
      bool otpVerifiedForgotPassword,
      bool showValidateError,
      bool isLogin,
      String? message,
      SignUpResponseModel? signUpResponseModel,
      LoginResponseModel? loginResponseModel});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? otpSend = null,
    Object? otpVerified = null,
    Object? otpVerificationError = null,
    Object? otpVerifiedForgotPassword = null,
    Object? showValidateError = null,
    Object? isLogin = null,
    Object? message = freezed,
    Object? signUpResponseModel = freezed,
    Object? loginResponseModel = freezed,
  }) {
    return _then(_$InitialImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      otpSend: null == otpSend
          ? _value.otpSend
          : otpSend // ignore: cast_nullable_to_non_nullable
              as bool,
      otpVerified: null == otpVerified
          ? _value.otpVerified
          : otpVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      otpVerificationError: null == otpVerificationError
          ? _value.otpVerificationError
          : otpVerificationError // ignore: cast_nullable_to_non_nullable
              as bool,
      otpVerifiedForgotPassword: null == otpVerifiedForgotPassword
          ? _value.otpVerifiedForgotPassword
          : otpVerifiedForgotPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      showValidateError: null == showValidateError
          ? _value.showValidateError
          : showValidateError // ignore: cast_nullable_to_non_nullable
              as bool,
      isLogin: null == isLogin
          ? _value.isLogin
          : isLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      signUpResponseModel: freezed == signUpResponseModel
          ? _value.signUpResponseModel
          : signUpResponseModel // ignore: cast_nullable_to_non_nullable
              as SignUpResponseModel?,
      loginResponseModel: freezed == loginResponseModel
          ? _value.loginResponseModel
          : loginResponseModel // ignore: cast_nullable_to_non_nullable
              as LoginResponseModel?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.isLoading,
      required this.hasError,
      required this.otpSend,
      required this.otpVerified,
      required this.otpVerificationError,
      required this.otpVerifiedForgotPassword,
      required this.showValidateError,
      required this.isLogin,
      this.message,
      this.signUpResponseModel,
      this.loginResponseModel});

  @override
  final bool isLoading;
  @override
  final bool hasError;
  @override
  final bool otpSend;
  @override
  final bool otpVerified;
  @override
  final bool otpVerificationError;
  @override
  final bool otpVerifiedForgotPassword;
  @override
  final bool showValidateError;
  @override
  final bool isLogin;
  @override
  final String? message;
  @override
  final SignUpResponseModel? signUpResponseModel;
  @override
  final LoginResponseModel? loginResponseModel;

  @override
  String toString() {
    return 'AuthState(isLoading: $isLoading, hasError: $hasError, otpSend: $otpSend, otpVerified: $otpVerified, otpVerificationError: $otpVerificationError, otpVerifiedForgotPassword: $otpVerifiedForgotPassword, showValidateError: $showValidateError, isLogin: $isLogin, message: $message, signUpResponseModel: $signUpResponseModel, loginResponseModel: $loginResponseModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.otpSend, otpSend) || other.otpSend == otpSend) &&
            (identical(other.otpVerified, otpVerified) ||
                other.otpVerified == otpVerified) &&
            (identical(other.otpVerificationError, otpVerificationError) ||
                other.otpVerificationError == otpVerificationError) &&
            (identical(other.otpVerifiedForgotPassword,
                    otpVerifiedForgotPassword) ||
                other.otpVerifiedForgotPassword == otpVerifiedForgotPassword) &&
            (identical(other.showValidateError, showValidateError) ||
                other.showValidateError == showValidateError) &&
            (identical(other.isLogin, isLogin) || other.isLogin == isLogin) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.signUpResponseModel, signUpResponseModel) ||
                other.signUpResponseModel == signUpResponseModel) &&
            (identical(other.loginResponseModel, loginResponseModel) ||
                other.loginResponseModel == loginResponseModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      hasError,
      otpSend,
      otpVerified,
      otpVerificationError,
      otpVerifiedForgotPassword,
      showValidateError,
      isLogin,
      message,
      signUpResponseModel,
      loginResponseModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements AuthState {
  const factory _Initial(
      {required final bool isLoading,
      required final bool hasError,
      required final bool otpSend,
      required final bool otpVerified,
      required final bool otpVerificationError,
      required final bool otpVerifiedForgotPassword,
      required final bool showValidateError,
      required final bool isLogin,
      final String? message,
      final SignUpResponseModel? signUpResponseModel,
      final LoginResponseModel? loginResponseModel}) = _$InitialImpl;

  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  bool get otpSend;
  @override
  bool get otpVerified;
  @override
  bool get otpVerificationError;
  @override
  bool get otpVerifiedForgotPassword;
  @override
  bool get showValidateError;
  @override
  bool get isLogin;
  @override
  String? get message;
  @override
  SignUpResponseModel? get signUpResponseModel;
  @override
  LoginResponseModel? get loginResponseModel;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
