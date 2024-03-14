// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getProfile,
    required TResult Function(
            ProfileUpdateRequestModel profileUpdateRequestModel, bool isFrom)
        editProfile,
    required TResult Function() deleteProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getProfile,
    TResult? Function(
            ProfileUpdateRequestModel profileUpdateRequestModel, bool isFrom)?
        editProfile,
    TResult? Function()? deleteProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getProfile,
    TResult Function(
            ProfileUpdateRequestModel profileUpdateRequestModel, bool isFrom)?
        editProfile,
    TResult Function()? deleteProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetProfile value) getProfile,
    required TResult Function(EditProfile value) editProfile,
    required TResult Function(DeleteProfile value) deleteProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetProfile value)? getProfile,
    TResult? Function(EditProfile value)? editProfile,
    TResult? Function(DeleteProfile value)? deleteProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProfile value)? getProfile,
    TResult Function(EditProfile value)? editProfile,
    TResult Function(DeleteProfile value)? deleteProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEventCopyWith<$Res> {
  factory $ProfileEventCopyWith(
          ProfileEvent value, $Res Function(ProfileEvent) then) =
      _$ProfileEventCopyWithImpl<$Res, ProfileEvent>;
}

/// @nodoc
class _$ProfileEventCopyWithImpl<$Res, $Val extends ProfileEvent>
    implements $ProfileEventCopyWith<$Res> {
  _$ProfileEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetProfileImplCopyWith<$Res> {
  factory _$$GetProfileImplCopyWith(
          _$GetProfileImpl value, $Res Function(_$GetProfileImpl) then) =
      __$$GetProfileImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetProfileImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$GetProfileImpl>
    implements _$$GetProfileImplCopyWith<$Res> {
  __$$GetProfileImplCopyWithImpl(
      _$GetProfileImpl _value, $Res Function(_$GetProfileImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetProfileImpl with DiagnosticableTreeMixin implements GetProfile {
  const _$GetProfileImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileEvent.getProfile()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ProfileEvent.getProfile'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetProfileImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getProfile,
    required TResult Function(
            ProfileUpdateRequestModel profileUpdateRequestModel, bool isFrom)
        editProfile,
    required TResult Function() deleteProfile,
  }) {
    return getProfile();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getProfile,
    TResult? Function(
            ProfileUpdateRequestModel profileUpdateRequestModel, bool isFrom)?
        editProfile,
    TResult? Function()? deleteProfile,
  }) {
    return getProfile?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getProfile,
    TResult Function(
            ProfileUpdateRequestModel profileUpdateRequestModel, bool isFrom)?
        editProfile,
    TResult Function()? deleteProfile,
    required TResult orElse(),
  }) {
    if (getProfile != null) {
      return getProfile();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetProfile value) getProfile,
    required TResult Function(EditProfile value) editProfile,
    required TResult Function(DeleteProfile value) deleteProfile,
  }) {
    return getProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetProfile value)? getProfile,
    TResult? Function(EditProfile value)? editProfile,
    TResult? Function(DeleteProfile value)? deleteProfile,
  }) {
    return getProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProfile value)? getProfile,
    TResult Function(EditProfile value)? editProfile,
    TResult Function(DeleteProfile value)? deleteProfile,
    required TResult orElse(),
  }) {
    if (getProfile != null) {
      return getProfile(this);
    }
    return orElse();
  }
}

abstract class GetProfile implements ProfileEvent {
  const factory GetProfile() = _$GetProfileImpl;
}

/// @nodoc
abstract class _$$EditProfileImplCopyWith<$Res> {
  factory _$$EditProfileImplCopyWith(
          _$EditProfileImpl value, $Res Function(_$EditProfileImpl) then) =
      __$$EditProfileImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProfileUpdateRequestModel profileUpdateRequestModel, bool isFrom});
}

/// @nodoc
class __$$EditProfileImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$EditProfileImpl>
    implements _$$EditProfileImplCopyWith<$Res> {
  __$$EditProfileImplCopyWithImpl(
      _$EditProfileImpl _value, $Res Function(_$EditProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileUpdateRequestModel = null,
    Object? isFrom = null,
  }) {
    return _then(_$EditProfileImpl(
      profileUpdateRequestModel: null == profileUpdateRequestModel
          ? _value.profileUpdateRequestModel
          : profileUpdateRequestModel // ignore: cast_nullable_to_non_nullable
              as ProfileUpdateRequestModel,
      isFrom: null == isFrom
          ? _value.isFrom
          : isFrom // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$EditProfileImpl with DiagnosticableTreeMixin implements EditProfile {
  const _$EditProfileImpl(
      {required this.profileUpdateRequestModel, required this.isFrom});

  @override
  final ProfileUpdateRequestModel profileUpdateRequestModel;
  @override
  final bool isFrom;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileEvent.editProfile(profileUpdateRequestModel: $profileUpdateRequestModel, isFrom: $isFrom)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProfileEvent.editProfile'))
      ..add(DiagnosticsProperty(
          'profileUpdateRequestModel', profileUpdateRequestModel))
      ..add(DiagnosticsProperty('isFrom', isFrom));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditProfileImpl &&
            (identical(other.profileUpdateRequestModel,
                    profileUpdateRequestModel) ||
                other.profileUpdateRequestModel == profileUpdateRequestModel) &&
            (identical(other.isFrom, isFrom) || other.isFrom == isFrom));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, profileUpdateRequestModel, isFrom);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditProfileImplCopyWith<_$EditProfileImpl> get copyWith =>
      __$$EditProfileImplCopyWithImpl<_$EditProfileImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getProfile,
    required TResult Function(
            ProfileUpdateRequestModel profileUpdateRequestModel, bool isFrom)
        editProfile,
    required TResult Function() deleteProfile,
  }) {
    return editProfile(profileUpdateRequestModel, isFrom);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getProfile,
    TResult? Function(
            ProfileUpdateRequestModel profileUpdateRequestModel, bool isFrom)?
        editProfile,
    TResult? Function()? deleteProfile,
  }) {
    return editProfile?.call(profileUpdateRequestModel, isFrom);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getProfile,
    TResult Function(
            ProfileUpdateRequestModel profileUpdateRequestModel, bool isFrom)?
        editProfile,
    TResult Function()? deleteProfile,
    required TResult orElse(),
  }) {
    if (editProfile != null) {
      return editProfile(profileUpdateRequestModel, isFrom);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetProfile value) getProfile,
    required TResult Function(EditProfile value) editProfile,
    required TResult Function(DeleteProfile value) deleteProfile,
  }) {
    return editProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetProfile value)? getProfile,
    TResult? Function(EditProfile value)? editProfile,
    TResult? Function(DeleteProfile value)? deleteProfile,
  }) {
    return editProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProfile value)? getProfile,
    TResult Function(EditProfile value)? editProfile,
    TResult Function(DeleteProfile value)? deleteProfile,
    required TResult orElse(),
  }) {
    if (editProfile != null) {
      return editProfile(this);
    }
    return orElse();
  }
}

abstract class EditProfile implements ProfileEvent {
  const factory EditProfile(
      {required final ProfileUpdateRequestModel profileUpdateRequestModel,
      required final bool isFrom}) = _$EditProfileImpl;

  ProfileUpdateRequestModel get profileUpdateRequestModel;
  bool get isFrom;
  @JsonKey(ignore: true)
  _$$EditProfileImplCopyWith<_$EditProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteProfileImplCopyWith<$Res> {
  factory _$$DeleteProfileImplCopyWith(
          _$DeleteProfileImpl value, $Res Function(_$DeleteProfileImpl) then) =
      __$$DeleteProfileImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteProfileImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$DeleteProfileImpl>
    implements _$$DeleteProfileImplCopyWith<$Res> {
  __$$DeleteProfileImplCopyWithImpl(
      _$DeleteProfileImpl _value, $Res Function(_$DeleteProfileImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DeleteProfileImpl
    with DiagnosticableTreeMixin
    implements DeleteProfile {
  const _$DeleteProfileImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileEvent.deleteProfile()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ProfileEvent.deleteProfile'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeleteProfileImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getProfile,
    required TResult Function(
            ProfileUpdateRequestModel profileUpdateRequestModel, bool isFrom)
        editProfile,
    required TResult Function() deleteProfile,
  }) {
    return deleteProfile();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getProfile,
    TResult? Function(
            ProfileUpdateRequestModel profileUpdateRequestModel, bool isFrom)?
        editProfile,
    TResult? Function()? deleteProfile,
  }) {
    return deleteProfile?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getProfile,
    TResult Function(
            ProfileUpdateRequestModel profileUpdateRequestModel, bool isFrom)?
        editProfile,
    TResult Function()? deleteProfile,
    required TResult orElse(),
  }) {
    if (deleteProfile != null) {
      return deleteProfile();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetProfile value) getProfile,
    required TResult Function(EditProfile value) editProfile,
    required TResult Function(DeleteProfile value) deleteProfile,
  }) {
    return deleteProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetProfile value)? getProfile,
    TResult? Function(EditProfile value)? editProfile,
    TResult? Function(DeleteProfile value)? deleteProfile,
  }) {
    return deleteProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProfile value)? getProfile,
    TResult Function(EditProfile value)? editProfile,
    TResult Function(DeleteProfile value)? deleteProfile,
    required TResult orElse(),
  }) {
    if (deleteProfile != null) {
      return deleteProfile(this);
    }
    return orElse();
  }
}

abstract class DeleteProfile implements ProfileEvent {
  const factory DeleteProfile() = _$DeleteProfileImpl;
}

/// @nodoc
mixin _$ProfileState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  GetProfileDetailsResponceModel? get getProfileDetailsResponceModel =>
      throw _privateConstructorUsedError;
  ProfileUpdateResponceModel? get profileUpdateResponceModel =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileStateCopyWith<ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res, ProfileState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      String? message,
      GetProfileDetailsResponceModel? getProfileDetailsResponceModel,
      ProfileUpdateResponceModel? profileUpdateResponceModel});
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? message = freezed,
    Object? getProfileDetailsResponceModel = freezed,
    Object? profileUpdateResponceModel = freezed,
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
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      getProfileDetailsResponceModel: freezed == getProfileDetailsResponceModel
          ? _value.getProfileDetailsResponceModel
          : getProfileDetailsResponceModel // ignore: cast_nullable_to_non_nullable
              as GetProfileDetailsResponceModel?,
      profileUpdateResponceModel: freezed == profileUpdateResponceModel
          ? _value.profileUpdateResponceModel
          : profileUpdateResponceModel // ignore: cast_nullable_to_non_nullable
              as ProfileUpdateResponceModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      String? message,
      GetProfileDetailsResponceModel? getProfileDetailsResponceModel,
      ProfileUpdateResponceModel? profileUpdateResponceModel});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? message = freezed,
    Object? getProfileDetailsResponceModel = freezed,
    Object? profileUpdateResponceModel = freezed,
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
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      getProfileDetailsResponceModel: freezed == getProfileDetailsResponceModel
          ? _value.getProfileDetailsResponceModel
          : getProfileDetailsResponceModel // ignore: cast_nullable_to_non_nullable
              as GetProfileDetailsResponceModel?,
      profileUpdateResponceModel: freezed == profileUpdateResponceModel
          ? _value.profileUpdateResponceModel
          : profileUpdateResponceModel // ignore: cast_nullable_to_non_nullable
              as ProfileUpdateResponceModel?,
    ));
  }
}

/// @nodoc

class _$InitialImpl with DiagnosticableTreeMixin implements _Initial {
  const _$InitialImpl(
      {required this.isLoading,
      required this.hasError,
      this.message,
      this.getProfileDetailsResponceModel,
      this.profileUpdateResponceModel});

  @override
  final bool isLoading;
  @override
  final bool hasError;
  @override
  final String? message;
  @override
  final GetProfileDetailsResponceModel? getProfileDetailsResponceModel;
  @override
  final ProfileUpdateResponceModel? profileUpdateResponceModel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileState(isLoading: $isLoading, hasError: $hasError, message: $message, getProfileDetailsResponceModel: $getProfileDetailsResponceModel, profileUpdateResponceModel: $profileUpdateResponceModel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProfileState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('hasError', hasError))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty(
          'getProfileDetailsResponceModel', getProfileDetailsResponceModel))
      ..add(DiagnosticsProperty(
          'profileUpdateResponceModel', profileUpdateResponceModel));
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
            (identical(other.message, message) || other.message == message) &&
            (identical(other.getProfileDetailsResponceModel,
                    getProfileDetailsResponceModel) ||
                other.getProfileDetailsResponceModel ==
                    getProfileDetailsResponceModel) &&
            (identical(other.profileUpdateResponceModel,
                    profileUpdateResponceModel) ||
                other.profileUpdateResponceModel ==
                    profileUpdateResponceModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, hasError, message,
      getProfileDetailsResponceModel, profileUpdateResponceModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements ProfileState {
  const factory _Initial(
          {required final bool isLoading,
          required final bool hasError,
          final String? message,
          final GetProfileDetailsResponceModel? getProfileDetailsResponceModel,
          final ProfileUpdateResponceModel? profileUpdateResponceModel}) =
      _$InitialImpl;

  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  String? get message;
  @override
  GetProfileDetailsResponceModel? get getProfileDetailsResponceModel;
  @override
  ProfileUpdateResponceModel? get profileUpdateResponceModel;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
