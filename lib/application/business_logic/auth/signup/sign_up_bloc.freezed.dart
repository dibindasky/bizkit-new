// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignUpEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SignUpModel signUpModel) registerBusiness,
    required TResult Function(SignUpIndivudalModel signUpIndivudalModel)
        registerIndividual,
    required TResult Function(EmailModel emailModel, bool isBusiness) sendOtp,
    required TResult Function(
            VerifyOtpModel verifyOtpModel,
            SignUpModel? signUpModel,
            SignUpIndivudalModel? signUpIndivudalModel,
            bool isBusiness)
        verifyOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SignUpModel signUpModel)? registerBusiness,
    TResult? Function(SignUpIndivudalModel signUpIndivudalModel)?
        registerIndividual,
    TResult? Function(EmailModel emailModel, bool isBusiness)? sendOtp,
    TResult? Function(VerifyOtpModel verifyOtpModel, SignUpModel? signUpModel,
            SignUpIndivudalModel? signUpIndivudalModel, bool isBusiness)?
        verifyOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SignUpModel signUpModel)? registerBusiness,
    TResult Function(SignUpIndivudalModel signUpIndivudalModel)?
        registerIndividual,
    TResult Function(EmailModel emailModel, bool isBusiness)? sendOtp,
    TResult Function(VerifyOtpModel verifyOtpModel, SignUpModel? signUpModel,
            SignUpIndivudalModel? signUpIndivudalModel, bool isBusiness)?
        verifyOtp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterBusiness value) registerBusiness,
    required TResult Function(RegisterIndividual value) registerIndividual,
    required TResult Function(SendOtp value) sendOtp,
    required TResult Function(VerifyOtp value) verifyOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterBusiness value)? registerBusiness,
    TResult? Function(RegisterIndividual value)? registerIndividual,
    TResult? Function(SendOtp value)? sendOtp,
    TResult? Function(VerifyOtp value)? verifyOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterBusiness value)? registerBusiness,
    TResult Function(RegisterIndividual value)? registerIndividual,
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(VerifyOtp value)? verifyOtp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpEventCopyWith<$Res> {
  factory $SignUpEventCopyWith(
          SignUpEvent value, $Res Function(SignUpEvent) then) =
      _$SignUpEventCopyWithImpl<$Res, SignUpEvent>;
}

/// @nodoc
class _$SignUpEventCopyWithImpl<$Res, $Val extends SignUpEvent>
    implements $SignUpEventCopyWith<$Res> {
  _$SignUpEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
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
    extends _$SignUpEventCopyWithImpl<$Res, _$RegisterBusinessImpl>
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
    return 'SignUpEvent.registerBusiness(signUpModel: $signUpModel)';
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
    required TResult Function(SignUpModel signUpModel) registerBusiness,
    required TResult Function(SignUpIndivudalModel signUpIndivudalModel)
        registerIndividual,
    required TResult Function(EmailModel emailModel, bool isBusiness) sendOtp,
    required TResult Function(
            VerifyOtpModel verifyOtpModel,
            SignUpModel? signUpModel,
            SignUpIndivudalModel? signUpIndivudalModel,
            bool isBusiness)
        verifyOtp,
  }) {
    return registerBusiness(signUpModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SignUpModel signUpModel)? registerBusiness,
    TResult? Function(SignUpIndivudalModel signUpIndivudalModel)?
        registerIndividual,
    TResult? Function(EmailModel emailModel, bool isBusiness)? sendOtp,
    TResult? Function(VerifyOtpModel verifyOtpModel, SignUpModel? signUpModel,
            SignUpIndivudalModel? signUpIndivudalModel, bool isBusiness)?
        verifyOtp,
  }) {
    return registerBusiness?.call(signUpModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SignUpModel signUpModel)? registerBusiness,
    TResult Function(SignUpIndivudalModel signUpIndivudalModel)?
        registerIndividual,
    TResult Function(EmailModel emailModel, bool isBusiness)? sendOtp,
    TResult Function(VerifyOtpModel verifyOtpModel, SignUpModel? signUpModel,
            SignUpIndivudalModel? signUpIndivudalModel, bool isBusiness)?
        verifyOtp,
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
    required TResult Function(RegisterBusiness value) registerBusiness,
    required TResult Function(RegisterIndividual value) registerIndividual,
    required TResult Function(SendOtp value) sendOtp,
    required TResult Function(VerifyOtp value) verifyOtp,
  }) {
    return registerBusiness(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterBusiness value)? registerBusiness,
    TResult? Function(RegisterIndividual value)? registerIndividual,
    TResult? Function(SendOtp value)? sendOtp,
    TResult? Function(VerifyOtp value)? verifyOtp,
  }) {
    return registerBusiness?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterBusiness value)? registerBusiness,
    TResult Function(RegisterIndividual value)? registerIndividual,
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(VerifyOtp value)? verifyOtp,
    required TResult orElse(),
  }) {
    if (registerBusiness != null) {
      return registerBusiness(this);
    }
    return orElse();
  }
}

abstract class RegisterBusiness implements SignUpEvent {
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
    extends _$SignUpEventCopyWithImpl<$Res, _$RegisterIndividualImpl>
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
    return 'SignUpEvent.registerIndividual(signUpIndivudalModel: $signUpIndivudalModel)';
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
    required TResult Function(SignUpModel signUpModel) registerBusiness,
    required TResult Function(SignUpIndivudalModel signUpIndivudalModel)
        registerIndividual,
    required TResult Function(EmailModel emailModel, bool isBusiness) sendOtp,
    required TResult Function(
            VerifyOtpModel verifyOtpModel,
            SignUpModel? signUpModel,
            SignUpIndivudalModel? signUpIndivudalModel,
            bool isBusiness)
        verifyOtp,
  }) {
    return registerIndividual(signUpIndivudalModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SignUpModel signUpModel)? registerBusiness,
    TResult? Function(SignUpIndivudalModel signUpIndivudalModel)?
        registerIndividual,
    TResult? Function(EmailModel emailModel, bool isBusiness)? sendOtp,
    TResult? Function(VerifyOtpModel verifyOtpModel, SignUpModel? signUpModel,
            SignUpIndivudalModel? signUpIndivudalModel, bool isBusiness)?
        verifyOtp,
  }) {
    return registerIndividual?.call(signUpIndivudalModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SignUpModel signUpModel)? registerBusiness,
    TResult Function(SignUpIndivudalModel signUpIndivudalModel)?
        registerIndividual,
    TResult Function(EmailModel emailModel, bool isBusiness)? sendOtp,
    TResult Function(VerifyOtpModel verifyOtpModel, SignUpModel? signUpModel,
            SignUpIndivudalModel? signUpIndivudalModel, bool isBusiness)?
        verifyOtp,
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
    required TResult Function(RegisterBusiness value) registerBusiness,
    required TResult Function(RegisterIndividual value) registerIndividual,
    required TResult Function(SendOtp value) sendOtp,
    required TResult Function(VerifyOtp value) verifyOtp,
  }) {
    return registerIndividual(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterBusiness value)? registerBusiness,
    TResult? Function(RegisterIndividual value)? registerIndividual,
    TResult? Function(SendOtp value)? sendOtp,
    TResult? Function(VerifyOtp value)? verifyOtp,
  }) {
    return registerIndividual?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterBusiness value)? registerBusiness,
    TResult Function(RegisterIndividual value)? registerIndividual,
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(VerifyOtp value)? verifyOtp,
    required TResult orElse(),
  }) {
    if (registerIndividual != null) {
      return registerIndividual(this);
    }
    return orElse();
  }
}

abstract class RegisterIndividual implements SignUpEvent {
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
  $Res call({EmailModel emailModel, bool isBusiness});
}

/// @nodoc
class __$$SendOtpImplCopyWithImpl<$Res>
    extends _$SignUpEventCopyWithImpl<$Res, _$SendOtpImpl>
    implements _$$SendOtpImplCopyWith<$Res> {
  __$$SendOtpImplCopyWithImpl(
      _$SendOtpImpl _value, $Res Function(_$SendOtpImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailModel = null,
    Object? isBusiness = null,
  }) {
    return _then(_$SendOtpImpl(
      emailModel: null == emailModel
          ? _value.emailModel
          : emailModel // ignore: cast_nullable_to_non_nullable
              as EmailModel,
      isBusiness: null == isBusiness
          ? _value.isBusiness
          : isBusiness // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SendOtpImpl implements SendOtp {
  const _$SendOtpImpl({required this.emailModel, required this.isBusiness});

  @override
  final EmailModel emailModel;
  @override
  final bool isBusiness;

  @override
  String toString() {
    return 'SignUpEvent.sendOtp(emailModel: $emailModel, isBusiness: $isBusiness)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendOtpImpl &&
            (identical(other.emailModel, emailModel) ||
                other.emailModel == emailModel) &&
            (identical(other.isBusiness, isBusiness) ||
                other.isBusiness == isBusiness));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emailModel, isBusiness);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendOtpImplCopyWith<_$SendOtpImpl> get copyWith =>
      __$$SendOtpImplCopyWithImpl<_$SendOtpImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SignUpModel signUpModel) registerBusiness,
    required TResult Function(SignUpIndivudalModel signUpIndivudalModel)
        registerIndividual,
    required TResult Function(EmailModel emailModel, bool isBusiness) sendOtp,
    required TResult Function(
            VerifyOtpModel verifyOtpModel,
            SignUpModel? signUpModel,
            SignUpIndivudalModel? signUpIndivudalModel,
            bool isBusiness)
        verifyOtp,
  }) {
    return sendOtp(emailModel, isBusiness);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SignUpModel signUpModel)? registerBusiness,
    TResult? Function(SignUpIndivudalModel signUpIndivudalModel)?
        registerIndividual,
    TResult? Function(EmailModel emailModel, bool isBusiness)? sendOtp,
    TResult? Function(VerifyOtpModel verifyOtpModel, SignUpModel? signUpModel,
            SignUpIndivudalModel? signUpIndivudalModel, bool isBusiness)?
        verifyOtp,
  }) {
    return sendOtp?.call(emailModel, isBusiness);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SignUpModel signUpModel)? registerBusiness,
    TResult Function(SignUpIndivudalModel signUpIndivudalModel)?
        registerIndividual,
    TResult Function(EmailModel emailModel, bool isBusiness)? sendOtp,
    TResult Function(VerifyOtpModel verifyOtpModel, SignUpModel? signUpModel,
            SignUpIndivudalModel? signUpIndivudalModel, bool isBusiness)?
        verifyOtp,
    required TResult orElse(),
  }) {
    if (sendOtp != null) {
      return sendOtp(emailModel, isBusiness);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterBusiness value) registerBusiness,
    required TResult Function(RegisterIndividual value) registerIndividual,
    required TResult Function(SendOtp value) sendOtp,
    required TResult Function(VerifyOtp value) verifyOtp,
  }) {
    return sendOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterBusiness value)? registerBusiness,
    TResult? Function(RegisterIndividual value)? registerIndividual,
    TResult? Function(SendOtp value)? sendOtp,
    TResult? Function(VerifyOtp value)? verifyOtp,
  }) {
    return sendOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterBusiness value)? registerBusiness,
    TResult Function(RegisterIndividual value)? registerIndividual,
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(VerifyOtp value)? verifyOtp,
    required TResult orElse(),
  }) {
    if (sendOtp != null) {
      return sendOtp(this);
    }
    return orElse();
  }
}

abstract class SendOtp implements SignUpEvent {
  const factory SendOtp(
      {required final EmailModel emailModel,
      required final bool isBusiness}) = _$SendOtpImpl;

  EmailModel get emailModel;
  bool get isBusiness;
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
  $Res call(
      {VerifyOtpModel verifyOtpModel,
      SignUpModel? signUpModel,
      SignUpIndivudalModel? signUpIndivudalModel,
      bool isBusiness});
}

/// @nodoc
class __$$VerifyOtpImplCopyWithImpl<$Res>
    extends _$SignUpEventCopyWithImpl<$Res, _$VerifyOtpImpl>
    implements _$$VerifyOtpImplCopyWith<$Res> {
  __$$VerifyOtpImplCopyWithImpl(
      _$VerifyOtpImpl _value, $Res Function(_$VerifyOtpImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verifyOtpModel = null,
    Object? signUpModel = freezed,
    Object? signUpIndivudalModel = freezed,
    Object? isBusiness = null,
  }) {
    return _then(_$VerifyOtpImpl(
      verifyOtpModel: null == verifyOtpModel
          ? _value.verifyOtpModel
          : verifyOtpModel // ignore: cast_nullable_to_non_nullable
              as VerifyOtpModel,
      signUpModel: freezed == signUpModel
          ? _value.signUpModel
          : signUpModel // ignore: cast_nullable_to_non_nullable
              as SignUpModel?,
      signUpIndivudalModel: freezed == signUpIndivudalModel
          ? _value.signUpIndivudalModel
          : signUpIndivudalModel // ignore: cast_nullable_to_non_nullable
              as SignUpIndivudalModel?,
      isBusiness: null == isBusiness
          ? _value.isBusiness
          : isBusiness // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$VerifyOtpImpl implements VerifyOtp {
  const _$VerifyOtpImpl(
      {required this.verifyOtpModel,
      this.signUpModel,
      this.signUpIndivudalModel,
      required this.isBusiness});

  @override
  final VerifyOtpModel verifyOtpModel;
  @override
  final SignUpModel? signUpModel;
  @override
  final SignUpIndivudalModel? signUpIndivudalModel;
  @override
  final bool isBusiness;

  @override
  String toString() {
    return 'SignUpEvent.verifyOtp(verifyOtpModel: $verifyOtpModel, signUpModel: $signUpModel, signUpIndivudalModel: $signUpIndivudalModel, isBusiness: $isBusiness)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOtpImpl &&
            (identical(other.verifyOtpModel, verifyOtpModel) ||
                other.verifyOtpModel == verifyOtpModel) &&
            (identical(other.signUpModel, signUpModel) ||
                other.signUpModel == signUpModel) &&
            (identical(other.signUpIndivudalModel, signUpIndivudalModel) ||
                other.signUpIndivudalModel == signUpIndivudalModel) &&
            (identical(other.isBusiness, isBusiness) ||
                other.isBusiness == isBusiness));
  }

  @override
  int get hashCode => Object.hash(runtimeType, verifyOtpModel, signUpModel,
      signUpIndivudalModel, isBusiness);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyOtpImplCopyWith<_$VerifyOtpImpl> get copyWith =>
      __$$VerifyOtpImplCopyWithImpl<_$VerifyOtpImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SignUpModel signUpModel) registerBusiness,
    required TResult Function(SignUpIndivudalModel signUpIndivudalModel)
        registerIndividual,
    required TResult Function(EmailModel emailModel, bool isBusiness) sendOtp,
    required TResult Function(
            VerifyOtpModel verifyOtpModel,
            SignUpModel? signUpModel,
            SignUpIndivudalModel? signUpIndivudalModel,
            bool isBusiness)
        verifyOtp,
  }) {
    return verifyOtp(
        verifyOtpModel, signUpModel, signUpIndivudalModel, isBusiness);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SignUpModel signUpModel)? registerBusiness,
    TResult? Function(SignUpIndivudalModel signUpIndivudalModel)?
        registerIndividual,
    TResult? Function(EmailModel emailModel, bool isBusiness)? sendOtp,
    TResult? Function(VerifyOtpModel verifyOtpModel, SignUpModel? signUpModel,
            SignUpIndivudalModel? signUpIndivudalModel, bool isBusiness)?
        verifyOtp,
  }) {
    return verifyOtp?.call(
        verifyOtpModel, signUpModel, signUpIndivudalModel, isBusiness);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SignUpModel signUpModel)? registerBusiness,
    TResult Function(SignUpIndivudalModel signUpIndivudalModel)?
        registerIndividual,
    TResult Function(EmailModel emailModel, bool isBusiness)? sendOtp,
    TResult Function(VerifyOtpModel verifyOtpModel, SignUpModel? signUpModel,
            SignUpIndivudalModel? signUpIndivudalModel, bool isBusiness)?
        verifyOtp,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp(
          verifyOtpModel, signUpModel, signUpIndivudalModel, isBusiness);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterBusiness value) registerBusiness,
    required TResult Function(RegisterIndividual value) registerIndividual,
    required TResult Function(SendOtp value) sendOtp,
    required TResult Function(VerifyOtp value) verifyOtp,
  }) {
    return verifyOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterBusiness value)? registerBusiness,
    TResult? Function(RegisterIndividual value)? registerIndividual,
    TResult? Function(SendOtp value)? sendOtp,
    TResult? Function(VerifyOtp value)? verifyOtp,
  }) {
    return verifyOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterBusiness value)? registerBusiness,
    TResult Function(RegisterIndividual value)? registerIndividual,
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(VerifyOtp value)? verifyOtp,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp(this);
    }
    return orElse();
  }
}

abstract class VerifyOtp implements SignUpEvent {
  const factory VerifyOtp(
      {required final VerifyOtpModel verifyOtpModel,
      final SignUpModel? signUpModel,
      final SignUpIndivudalModel? signUpIndivudalModel,
      required final bool isBusiness}) = _$VerifyOtpImpl;

  VerifyOtpModel get verifyOtpModel;
  SignUpModel? get signUpModel;
  SignUpIndivudalModel? get signUpIndivudalModel;
  bool get isBusiness;
  @JsonKey(ignore: true)
  _$$VerifyOtpImplCopyWith<_$VerifyOtpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SignUpState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  bool get otpSendBusiness => throw _privateConstructorUsedError;
  bool get otpVerifiedBusiness => throw _privateConstructorUsedError;
  bool get otpSendIndividual => throw _privateConstructorUsedError;
  bool get otpVerifiedIndividual => throw _privateConstructorUsedError;
  bool get otpIndividualError => throw _privateConstructorUsedError;
  bool get otpBusinessError => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  SignUpResponseModel? get signUpResponseModel =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpStateCopyWith<SignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) then) =
      _$SignUpStateCopyWithImpl<$Res, SignUpState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      bool otpSendBusiness,
      bool otpVerifiedBusiness,
      bool otpSendIndividual,
      bool otpVerifiedIndividual,
      bool otpIndividualError,
      bool otpBusinessError,
      String? message,
      SignUpResponseModel? signUpResponseModel});
}

/// @nodoc
class _$SignUpStateCopyWithImpl<$Res, $Val extends SignUpState>
    implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? otpSendBusiness = null,
    Object? otpVerifiedBusiness = null,
    Object? otpSendIndividual = null,
    Object? otpVerifiedIndividual = null,
    Object? otpIndividualError = null,
    Object? otpBusinessError = null,
    Object? message = freezed,
    Object? signUpResponseModel = freezed,
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
      otpSendBusiness: null == otpSendBusiness
          ? _value.otpSendBusiness
          : otpSendBusiness // ignore: cast_nullable_to_non_nullable
              as bool,
      otpVerifiedBusiness: null == otpVerifiedBusiness
          ? _value.otpVerifiedBusiness
          : otpVerifiedBusiness // ignore: cast_nullable_to_non_nullable
              as bool,
      otpSendIndividual: null == otpSendIndividual
          ? _value.otpSendIndividual
          : otpSendIndividual // ignore: cast_nullable_to_non_nullable
              as bool,
      otpVerifiedIndividual: null == otpVerifiedIndividual
          ? _value.otpVerifiedIndividual
          : otpVerifiedIndividual // ignore: cast_nullable_to_non_nullable
              as bool,
      otpIndividualError: null == otpIndividualError
          ? _value.otpIndividualError
          : otpIndividualError // ignore: cast_nullable_to_non_nullable
              as bool,
      otpBusinessError: null == otpBusinessError
          ? _value.otpBusinessError
          : otpBusinessError // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      signUpResponseModel: freezed == signUpResponseModel
          ? _value.signUpResponseModel
          : signUpResponseModel // ignore: cast_nullable_to_non_nullable
              as SignUpResponseModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      bool otpSendBusiness,
      bool otpVerifiedBusiness,
      bool otpSendIndividual,
      bool otpVerifiedIndividual,
      bool otpIndividualError,
      bool otpBusinessError,
      String? message,
      SignUpResponseModel? signUpResponseModel});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? otpSendBusiness = null,
    Object? otpVerifiedBusiness = null,
    Object? otpSendIndividual = null,
    Object? otpVerifiedIndividual = null,
    Object? otpIndividualError = null,
    Object? otpBusinessError = null,
    Object? message = freezed,
    Object? signUpResponseModel = freezed,
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
      otpSendBusiness: null == otpSendBusiness
          ? _value.otpSendBusiness
          : otpSendBusiness // ignore: cast_nullable_to_non_nullable
              as bool,
      otpVerifiedBusiness: null == otpVerifiedBusiness
          ? _value.otpVerifiedBusiness
          : otpVerifiedBusiness // ignore: cast_nullable_to_non_nullable
              as bool,
      otpSendIndividual: null == otpSendIndividual
          ? _value.otpSendIndividual
          : otpSendIndividual // ignore: cast_nullable_to_non_nullable
              as bool,
      otpVerifiedIndividual: null == otpVerifiedIndividual
          ? _value.otpVerifiedIndividual
          : otpVerifiedIndividual // ignore: cast_nullable_to_non_nullable
              as bool,
      otpIndividualError: null == otpIndividualError
          ? _value.otpIndividualError
          : otpIndividualError // ignore: cast_nullable_to_non_nullable
              as bool,
      otpBusinessError: null == otpBusinessError
          ? _value.otpBusinessError
          : otpBusinessError // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      signUpResponseModel: freezed == signUpResponseModel
          ? _value.signUpResponseModel
          : signUpResponseModel // ignore: cast_nullable_to_non_nullable
              as SignUpResponseModel?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.isLoading,
      required this.hasError,
      required this.otpSendBusiness,
      required this.otpVerifiedBusiness,
      required this.otpSendIndividual,
      required this.otpVerifiedIndividual,
      required this.otpIndividualError,
      required this.otpBusinessError,
      this.message,
      this.signUpResponseModel});

  @override
  final bool isLoading;
  @override
  final bool hasError;
  @override
  final bool otpSendBusiness;
  @override
  final bool otpVerifiedBusiness;
  @override
  final bool otpSendIndividual;
  @override
  final bool otpVerifiedIndividual;
  @override
  final bool otpIndividualError;
  @override
  final bool otpBusinessError;
  @override
  final String? message;
  @override
  final SignUpResponseModel? signUpResponseModel;

  @override
  String toString() {
    return 'SignUpState(isLoading: $isLoading, hasError: $hasError, otpSendBusiness: $otpSendBusiness, otpVerifiedBusiness: $otpVerifiedBusiness, otpSendIndividual: $otpSendIndividual, otpVerifiedIndividual: $otpVerifiedIndividual, otpIndividualError: $otpIndividualError, otpBusinessError: $otpBusinessError, message: $message, signUpResponseModel: $signUpResponseModel)';
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
            (identical(other.otpSendBusiness, otpSendBusiness) ||
                other.otpSendBusiness == otpSendBusiness) &&
            (identical(other.otpVerifiedBusiness, otpVerifiedBusiness) ||
                other.otpVerifiedBusiness == otpVerifiedBusiness) &&
            (identical(other.otpSendIndividual, otpSendIndividual) ||
                other.otpSendIndividual == otpSendIndividual) &&
            (identical(other.otpVerifiedIndividual, otpVerifiedIndividual) ||
                other.otpVerifiedIndividual == otpVerifiedIndividual) &&
            (identical(other.otpIndividualError, otpIndividualError) ||
                other.otpIndividualError == otpIndividualError) &&
            (identical(other.otpBusinessError, otpBusinessError) ||
                other.otpBusinessError == otpBusinessError) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.signUpResponseModel, signUpResponseModel) ||
                other.signUpResponseModel == signUpResponseModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      hasError,
      otpSendBusiness,
      otpVerifiedBusiness,
      otpSendIndividual,
      otpVerifiedIndividual,
      otpIndividualError,
      otpBusinessError,
      message,
      signUpResponseModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements SignUpState {
  const factory _Initial(
      {required final bool isLoading,
      required final bool hasError,
      required final bool otpSendBusiness,
      required final bool otpVerifiedBusiness,
      required final bool otpSendIndividual,
      required final bool otpVerifiedIndividual,
      required final bool otpIndividualError,
      required final bool otpBusinessError,
      final String? message,
      final SignUpResponseModel? signUpResponseModel}) = _$InitialImpl;

  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  bool get otpSendBusiness;
  @override
  bool get otpVerifiedBusiness;
  @override
  bool get otpSendIndividual;
  @override
  bool get otpVerifiedIndividual;
  @override
  bool get otpIndividualError;
  @override
  bool get otpBusinessError;
  @override
  String? get message;
  @override
  SignUpResponseModel? get signUpResponseModel;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
