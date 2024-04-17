// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgott_password_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ForgottPasswordEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(EmailModel emailModel) forGottPasswordEmailVerify,
    required TResult Function(VerifyOtpModel verifyOtpModel)
        verifyforgotPasswordOTPEmail,
    required TResult Function(ChangePasswordModel changePasswordModel)
        forgottPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(EmailModel emailModel)? forGottPasswordEmailVerify,
    TResult? Function(VerifyOtpModel verifyOtpModel)?
        verifyforgotPasswordOTPEmail,
    TResult? Function(ChangePasswordModel changePasswordModel)? forgottPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(EmailModel emailModel)? forGottPasswordEmailVerify,
    TResult Function(VerifyOtpModel verifyOtpModel)?
        verifyforgotPasswordOTPEmail,
    TResult Function(ChangePasswordModel changePasswordModel)? forgottPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(ForGottPasswordEmailVerify value)
        forGottPasswordEmailVerify,
    required TResult Function(VerifyforgotPasswordOTPEmail value)
        verifyforgotPasswordOTPEmail,
    required TResult Function(ForgottPassword value) forgottPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(ForGottPasswordEmailVerify value)?
        forGottPasswordEmailVerify,
    TResult? Function(VerifyforgotPasswordOTPEmail value)?
        verifyforgotPasswordOTPEmail,
    TResult? Function(ForgottPassword value)? forgottPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(ForGottPasswordEmailVerify value)?
        forGottPasswordEmailVerify,
    TResult Function(VerifyforgotPasswordOTPEmail value)?
        verifyforgotPasswordOTPEmail,
    TResult Function(ForgottPassword value)? forgottPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgottPasswordEventCopyWith<$Res> {
  factory $ForgottPasswordEventCopyWith(ForgottPasswordEvent value,
          $Res Function(ForgottPasswordEvent) then) =
      _$ForgottPasswordEventCopyWithImpl<$Res, ForgottPasswordEvent>;
}

/// @nodoc
class _$ForgottPasswordEventCopyWithImpl<$Res,
        $Val extends ForgottPasswordEvent>
    implements $ForgottPasswordEventCopyWith<$Res> {
  _$ForgottPasswordEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$ForgottPasswordEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'ForgottPasswordEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(EmailModel emailModel) forGottPasswordEmailVerify,
    required TResult Function(VerifyOtpModel verifyOtpModel)
        verifyforgotPasswordOTPEmail,
    required TResult Function(ChangePasswordModel changePasswordModel)
        forgottPassword,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(EmailModel emailModel)? forGottPasswordEmailVerify,
    TResult? Function(VerifyOtpModel verifyOtpModel)?
        verifyforgotPasswordOTPEmail,
    TResult? Function(ChangePasswordModel changePasswordModel)? forgottPassword,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(EmailModel emailModel)? forGottPasswordEmailVerify,
    TResult Function(VerifyOtpModel verifyOtpModel)?
        verifyforgotPasswordOTPEmail,
    TResult Function(ChangePasswordModel changePasswordModel)? forgottPassword,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(ForGottPasswordEmailVerify value)
        forGottPasswordEmailVerify,
    required TResult Function(VerifyforgotPasswordOTPEmail value)
        verifyforgotPasswordOTPEmail,
    required TResult Function(ForgottPassword value) forgottPassword,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(ForGottPasswordEmailVerify value)?
        forGottPasswordEmailVerify,
    TResult? Function(VerifyforgotPasswordOTPEmail value)?
        verifyforgotPasswordOTPEmail,
    TResult? Function(ForgottPassword value)? forgottPassword,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(ForGottPasswordEmailVerify value)?
        forGottPasswordEmailVerify,
    TResult Function(VerifyforgotPasswordOTPEmail value)?
        verifyforgotPasswordOTPEmail,
    TResult Function(ForgottPassword value)? forgottPassword,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ForgottPasswordEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$ForGottPasswordEmailVerifyImplCopyWith<$Res> {
  factory _$$ForGottPasswordEmailVerifyImplCopyWith(
          _$ForGottPasswordEmailVerifyImpl value,
          $Res Function(_$ForGottPasswordEmailVerifyImpl) then) =
      __$$ForGottPasswordEmailVerifyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({EmailModel emailModel});
}

/// @nodoc
class __$$ForGottPasswordEmailVerifyImplCopyWithImpl<$Res>
    extends _$ForgottPasswordEventCopyWithImpl<$Res,
        _$ForGottPasswordEmailVerifyImpl>
    implements _$$ForGottPasswordEmailVerifyImplCopyWith<$Res> {
  __$$ForGottPasswordEmailVerifyImplCopyWithImpl(
      _$ForGottPasswordEmailVerifyImpl _value,
      $Res Function(_$ForGottPasswordEmailVerifyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailModel = null,
  }) {
    return _then(_$ForGottPasswordEmailVerifyImpl(
      emailModel: null == emailModel
          ? _value.emailModel
          : emailModel // ignore: cast_nullable_to_non_nullable
              as EmailModel,
    ));
  }
}

/// @nodoc

class _$ForGottPasswordEmailVerifyImpl implements ForGottPasswordEmailVerify {
  const _$ForGottPasswordEmailVerifyImpl({required this.emailModel});

  @override
  final EmailModel emailModel;

  @override
  String toString() {
    return 'ForgottPasswordEvent.forGottPasswordEmailVerify(emailModel: $emailModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForGottPasswordEmailVerifyImpl &&
            (identical(other.emailModel, emailModel) ||
                other.emailModel == emailModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emailModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForGottPasswordEmailVerifyImplCopyWith<_$ForGottPasswordEmailVerifyImpl>
      get copyWith => __$$ForGottPasswordEmailVerifyImplCopyWithImpl<
          _$ForGottPasswordEmailVerifyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(EmailModel emailModel) forGottPasswordEmailVerify,
    required TResult Function(VerifyOtpModel verifyOtpModel)
        verifyforgotPasswordOTPEmail,
    required TResult Function(ChangePasswordModel changePasswordModel)
        forgottPassword,
  }) {
    return forGottPasswordEmailVerify(emailModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(EmailModel emailModel)? forGottPasswordEmailVerify,
    TResult? Function(VerifyOtpModel verifyOtpModel)?
        verifyforgotPasswordOTPEmail,
    TResult? Function(ChangePasswordModel changePasswordModel)? forgottPassword,
  }) {
    return forGottPasswordEmailVerify?.call(emailModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(EmailModel emailModel)? forGottPasswordEmailVerify,
    TResult Function(VerifyOtpModel verifyOtpModel)?
        verifyforgotPasswordOTPEmail,
    TResult Function(ChangePasswordModel changePasswordModel)? forgottPassword,
    required TResult orElse(),
  }) {
    if (forGottPasswordEmailVerify != null) {
      return forGottPasswordEmailVerify(emailModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(ForGottPasswordEmailVerify value)
        forGottPasswordEmailVerify,
    required TResult Function(VerifyforgotPasswordOTPEmail value)
        verifyforgotPasswordOTPEmail,
    required TResult Function(ForgottPassword value) forgottPassword,
  }) {
    return forGottPasswordEmailVerify(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(ForGottPasswordEmailVerify value)?
        forGottPasswordEmailVerify,
    TResult? Function(VerifyforgotPasswordOTPEmail value)?
        verifyforgotPasswordOTPEmail,
    TResult? Function(ForgottPassword value)? forgottPassword,
  }) {
    return forGottPasswordEmailVerify?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(ForGottPasswordEmailVerify value)?
        forGottPasswordEmailVerify,
    TResult Function(VerifyforgotPasswordOTPEmail value)?
        verifyforgotPasswordOTPEmail,
    TResult Function(ForgottPassword value)? forgottPassword,
    required TResult orElse(),
  }) {
    if (forGottPasswordEmailVerify != null) {
      return forGottPasswordEmailVerify(this);
    }
    return orElse();
  }
}

abstract class ForGottPasswordEmailVerify implements ForgottPasswordEvent {
  const factory ForGottPasswordEmailVerify(
          {required final EmailModel emailModel}) =
      _$ForGottPasswordEmailVerifyImpl;

  EmailModel get emailModel;
  @JsonKey(ignore: true)
  _$$ForGottPasswordEmailVerifyImplCopyWith<_$ForGottPasswordEmailVerifyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyforgotPasswordOTPEmailImplCopyWith<$Res> {
  factory _$$VerifyforgotPasswordOTPEmailImplCopyWith(
          _$VerifyforgotPasswordOTPEmailImpl value,
          $Res Function(_$VerifyforgotPasswordOTPEmailImpl) then) =
      __$$VerifyforgotPasswordOTPEmailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({VerifyOtpModel verifyOtpModel});
}

/// @nodoc
class __$$VerifyforgotPasswordOTPEmailImplCopyWithImpl<$Res>
    extends _$ForgottPasswordEventCopyWithImpl<$Res,
        _$VerifyforgotPasswordOTPEmailImpl>
    implements _$$VerifyforgotPasswordOTPEmailImplCopyWith<$Res> {
  __$$VerifyforgotPasswordOTPEmailImplCopyWithImpl(
      _$VerifyforgotPasswordOTPEmailImpl _value,
      $Res Function(_$VerifyforgotPasswordOTPEmailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verifyOtpModel = null,
  }) {
    return _then(_$VerifyforgotPasswordOTPEmailImpl(
      verifyOtpModel: null == verifyOtpModel
          ? _value.verifyOtpModel
          : verifyOtpModel // ignore: cast_nullable_to_non_nullable
              as VerifyOtpModel,
    ));
  }
}

/// @nodoc

class _$VerifyforgotPasswordOTPEmailImpl
    implements VerifyforgotPasswordOTPEmail {
  const _$VerifyforgotPasswordOTPEmailImpl({required this.verifyOtpModel});

  @override
  final VerifyOtpModel verifyOtpModel;

  @override
  String toString() {
    return 'ForgottPasswordEvent.verifyforgotPasswordOTPEmail(verifyOtpModel: $verifyOtpModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyforgotPasswordOTPEmailImpl &&
            (identical(other.verifyOtpModel, verifyOtpModel) ||
                other.verifyOtpModel == verifyOtpModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, verifyOtpModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyforgotPasswordOTPEmailImplCopyWith<
          _$VerifyforgotPasswordOTPEmailImpl>
      get copyWith => __$$VerifyforgotPasswordOTPEmailImplCopyWithImpl<
          _$VerifyforgotPasswordOTPEmailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(EmailModel emailModel) forGottPasswordEmailVerify,
    required TResult Function(VerifyOtpModel verifyOtpModel)
        verifyforgotPasswordOTPEmail,
    required TResult Function(ChangePasswordModel changePasswordModel)
        forgottPassword,
  }) {
    return verifyforgotPasswordOTPEmail(verifyOtpModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(EmailModel emailModel)? forGottPasswordEmailVerify,
    TResult? Function(VerifyOtpModel verifyOtpModel)?
        verifyforgotPasswordOTPEmail,
    TResult? Function(ChangePasswordModel changePasswordModel)? forgottPassword,
  }) {
    return verifyforgotPasswordOTPEmail?.call(verifyOtpModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(EmailModel emailModel)? forGottPasswordEmailVerify,
    TResult Function(VerifyOtpModel verifyOtpModel)?
        verifyforgotPasswordOTPEmail,
    TResult Function(ChangePasswordModel changePasswordModel)? forgottPassword,
    required TResult orElse(),
  }) {
    if (verifyforgotPasswordOTPEmail != null) {
      return verifyforgotPasswordOTPEmail(verifyOtpModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(ForGottPasswordEmailVerify value)
        forGottPasswordEmailVerify,
    required TResult Function(VerifyforgotPasswordOTPEmail value)
        verifyforgotPasswordOTPEmail,
    required TResult Function(ForgottPassword value) forgottPassword,
  }) {
    return verifyforgotPasswordOTPEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(ForGottPasswordEmailVerify value)?
        forGottPasswordEmailVerify,
    TResult? Function(VerifyforgotPasswordOTPEmail value)?
        verifyforgotPasswordOTPEmail,
    TResult? Function(ForgottPassword value)? forgottPassword,
  }) {
    return verifyforgotPasswordOTPEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(ForGottPasswordEmailVerify value)?
        forGottPasswordEmailVerify,
    TResult Function(VerifyforgotPasswordOTPEmail value)?
        verifyforgotPasswordOTPEmail,
    TResult Function(ForgottPassword value)? forgottPassword,
    required TResult orElse(),
  }) {
    if (verifyforgotPasswordOTPEmail != null) {
      return verifyforgotPasswordOTPEmail(this);
    }
    return orElse();
  }
}

abstract class VerifyforgotPasswordOTPEmail implements ForgottPasswordEvent {
  const factory VerifyforgotPasswordOTPEmail(
          {required final VerifyOtpModel verifyOtpModel}) =
      _$VerifyforgotPasswordOTPEmailImpl;

  VerifyOtpModel get verifyOtpModel;
  @JsonKey(ignore: true)
  _$$VerifyforgotPasswordOTPEmailImplCopyWith<
          _$VerifyforgotPasswordOTPEmailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ForgottPasswordImplCopyWith<$Res> {
  factory _$$ForgottPasswordImplCopyWith(_$ForgottPasswordImpl value,
          $Res Function(_$ForgottPasswordImpl) then) =
      __$$ForgottPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ChangePasswordModel changePasswordModel});
}

/// @nodoc
class __$$ForgottPasswordImplCopyWithImpl<$Res>
    extends _$ForgottPasswordEventCopyWithImpl<$Res, _$ForgottPasswordImpl>
    implements _$$ForgottPasswordImplCopyWith<$Res> {
  __$$ForgottPasswordImplCopyWithImpl(
      _$ForgottPasswordImpl _value, $Res Function(_$ForgottPasswordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? changePasswordModel = null,
  }) {
    return _then(_$ForgottPasswordImpl(
      changePasswordModel: null == changePasswordModel
          ? _value.changePasswordModel
          : changePasswordModel // ignore: cast_nullable_to_non_nullable
              as ChangePasswordModel,
    ));
  }
}

/// @nodoc

class _$ForgottPasswordImpl implements ForgottPassword {
  const _$ForgottPasswordImpl({required this.changePasswordModel});

  @override
  final ChangePasswordModel changePasswordModel;

  @override
  String toString() {
    return 'ForgottPasswordEvent.forgottPassword(changePasswordModel: $changePasswordModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgottPasswordImpl &&
            (identical(other.changePasswordModel, changePasswordModel) ||
                other.changePasswordModel == changePasswordModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, changePasswordModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgottPasswordImplCopyWith<_$ForgottPasswordImpl> get copyWith =>
      __$$ForgottPasswordImplCopyWithImpl<_$ForgottPasswordImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(EmailModel emailModel) forGottPasswordEmailVerify,
    required TResult Function(VerifyOtpModel verifyOtpModel)
        verifyforgotPasswordOTPEmail,
    required TResult Function(ChangePasswordModel changePasswordModel)
        forgottPassword,
  }) {
    return forgottPassword(changePasswordModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(EmailModel emailModel)? forGottPasswordEmailVerify,
    TResult? Function(VerifyOtpModel verifyOtpModel)?
        verifyforgotPasswordOTPEmail,
    TResult? Function(ChangePasswordModel changePasswordModel)? forgottPassword,
  }) {
    return forgottPassword?.call(changePasswordModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(EmailModel emailModel)? forGottPasswordEmailVerify,
    TResult Function(VerifyOtpModel verifyOtpModel)?
        verifyforgotPasswordOTPEmail,
    TResult Function(ChangePasswordModel changePasswordModel)? forgottPassword,
    required TResult orElse(),
  }) {
    if (forgottPassword != null) {
      return forgottPassword(changePasswordModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(ForGottPasswordEmailVerify value)
        forGottPasswordEmailVerify,
    required TResult Function(VerifyforgotPasswordOTPEmail value)
        verifyforgotPasswordOTPEmail,
    required TResult Function(ForgottPassword value) forgottPassword,
  }) {
    return forgottPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(ForGottPasswordEmailVerify value)?
        forGottPasswordEmailVerify,
    TResult? Function(VerifyforgotPasswordOTPEmail value)?
        verifyforgotPasswordOTPEmail,
    TResult? Function(ForgottPassword value)? forgottPassword,
  }) {
    return forgottPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(ForGottPasswordEmailVerify value)?
        forGottPasswordEmailVerify,
    TResult Function(VerifyforgotPasswordOTPEmail value)?
        verifyforgotPasswordOTPEmail,
    TResult Function(ForgottPassword value)? forgottPassword,
    required TResult orElse(),
  }) {
    if (forgottPassword != null) {
      return forgottPassword(this);
    }
    return orElse();
  }
}

abstract class ForgottPassword implements ForgottPasswordEvent {
  const factory ForgottPassword(
          {required final ChangePasswordModel changePasswordModel}) =
      _$ForgottPasswordImpl;

  ChangePasswordModel get changePasswordModel;
  @JsonKey(ignore: true)
  _$$ForgottPasswordImplCopyWith<_$ForgottPasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ForgottPasswordState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  bool get otpSend => throw _privateConstructorUsedError;
  bool get otpVerificationError => throw _privateConstructorUsedError;
  bool get otpVerifiedForgotPassword => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  bool get passwordChange => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForgottPasswordStateCopyWith<ForgottPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgottPasswordStateCopyWith<$Res> {
  factory $ForgottPasswordStateCopyWith(ForgottPasswordState value,
          $Res Function(ForgottPasswordState) then) =
      _$ForgottPasswordStateCopyWithImpl<$Res, ForgottPasswordState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      bool otpSend,
      bool otpVerificationError,
      bool otpVerifiedForgotPassword,
      String? message,
      bool passwordChange});
}

/// @nodoc
class _$ForgottPasswordStateCopyWithImpl<$Res,
        $Val extends ForgottPasswordState>
    implements $ForgottPasswordStateCopyWith<$Res> {
  _$ForgottPasswordStateCopyWithImpl(this._value, this._then);

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
    Object? otpVerificationError = null,
    Object? otpVerifiedForgotPassword = null,
    Object? message = freezed,
    Object? passwordChange = null,
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
      otpVerificationError: null == otpVerificationError
          ? _value.otpVerificationError
          : otpVerificationError // ignore: cast_nullable_to_non_nullable
              as bool,
      otpVerifiedForgotPassword: null == otpVerifiedForgotPassword
          ? _value.otpVerifiedForgotPassword
          : otpVerifiedForgotPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordChange: null == passwordChange
          ? _value.passwordChange
          : passwordChange // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $ForgottPasswordStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      bool otpSend,
      bool otpVerificationError,
      bool otpVerifiedForgotPassword,
      String? message,
      bool passwordChange});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ForgottPasswordStateCopyWithImpl<$Res, _$InitialImpl>
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
    Object? otpVerificationError = null,
    Object? otpVerifiedForgotPassword = null,
    Object? message = freezed,
    Object? passwordChange = null,
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
      otpVerificationError: null == otpVerificationError
          ? _value.otpVerificationError
          : otpVerificationError // ignore: cast_nullable_to_non_nullable
              as bool,
      otpVerifiedForgotPassword: null == otpVerifiedForgotPassword
          ? _value.otpVerifiedForgotPassword
          : otpVerifiedForgotPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordChange: null == passwordChange
          ? _value.passwordChange
          : passwordChange // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.isLoading,
      required this.hasError,
      required this.otpSend,
      required this.otpVerificationError,
      required this.otpVerifiedForgotPassword,
      this.message,
      required this.passwordChange});

  @override
  final bool isLoading;
  @override
  final bool hasError;
  @override
  final bool otpSend;
  @override
  final bool otpVerificationError;
  @override
  final bool otpVerifiedForgotPassword;
  @override
  final String? message;
  @override
  final bool passwordChange;

  @override
  String toString() {
    return 'ForgottPasswordState(isLoading: $isLoading, hasError: $hasError, otpSend: $otpSend, otpVerificationError: $otpVerificationError, otpVerifiedForgotPassword: $otpVerifiedForgotPassword, message: $message, passwordChange: $passwordChange)';
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
            (identical(other.otpVerificationError, otpVerificationError) ||
                other.otpVerificationError == otpVerificationError) &&
            (identical(other.otpVerifiedForgotPassword,
                    otpVerifiedForgotPassword) ||
                other.otpVerifiedForgotPassword == otpVerifiedForgotPassword) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.passwordChange, passwordChange) ||
                other.passwordChange == passwordChange));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, hasError, otpSend,
      otpVerificationError, otpVerifiedForgotPassword, message, passwordChange);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements ForgottPasswordState {
  const factory _Initial(
      {required final bool isLoading,
      required final bool hasError,
      required final bool otpSend,
      required final bool otpVerificationError,
      required final bool otpVerifiedForgotPassword,
      final String? message,
      required final bool passwordChange}) = _$InitialImpl;

  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  bool get otpSend;
  @override
  bool get otpVerificationError;
  @override
  bool get otpVerifiedForgotPassword;
  @override
  String? get message;
  @override
  bool get passwordChange;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
