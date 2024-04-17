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
    required TResult Function(bool camera) pickImageScanning,
    required TResult Function(bool isLoad) getProfile,
    required TResult Function(
            UserInfoChangeRequestModel userInfoChangeRequestModel)
        editProfile,
    required TResult Function() deleteProfile,
    required TResult Function(
            UserInfoChangeRequestModel userNameChanginRequestModel)
        userInfoChange,
    required TResult Function(
            ForgottPasswordRequestModel forgottPasswordRequestModel)
        resetPasswod,
    required TResult Function(
            ReportAProblemRequestModel reportAProblemRequestModel)
        reportAProblem,
    required TResult Function(String serachQuery) getQuestions,
    required TResult Function() getQuestionEvent,
    required TResult Function(String serachQuery) searchQuestion,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool camera)? pickImageScanning,
    TResult? Function(bool isLoad)? getProfile,
    TResult? Function(UserInfoChangeRequestModel userInfoChangeRequestModel)?
        editProfile,
    TResult? Function()? deleteProfile,
    TResult? Function(UserInfoChangeRequestModel userNameChanginRequestModel)?
        userInfoChange,
    TResult? Function(ForgottPasswordRequestModel forgottPasswordRequestModel)?
        resetPasswod,
    TResult? Function(ReportAProblemRequestModel reportAProblemRequestModel)?
        reportAProblem,
    TResult? Function(String serachQuery)? getQuestions,
    TResult? Function()? getQuestionEvent,
    TResult? Function(String serachQuery)? searchQuestion,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool camera)? pickImageScanning,
    TResult Function(bool isLoad)? getProfile,
    TResult Function(UserInfoChangeRequestModel userInfoChangeRequestModel)?
        editProfile,
    TResult Function()? deleteProfile,
    TResult Function(UserInfoChangeRequestModel userNameChanginRequestModel)?
        userInfoChange,
    TResult Function(ForgottPasswordRequestModel forgottPasswordRequestModel)?
        resetPasswod,
    TResult Function(ReportAProblemRequestModel reportAProblemRequestModel)?
        reportAProblem,
    TResult Function(String serachQuery)? getQuestions,
    TResult Function()? getQuestionEvent,
    TResult Function(String serachQuery)? searchQuestion,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PickImageScanning value) pickImageScanning,
    required TResult Function(GetProfile value) getProfile,
    required TResult Function(EditProfile value) editProfile,
    required TResult Function(DeleteProfile value) deleteProfile,
    required TResult Function(UserInfoChange value) userInfoChange,
    required TResult Function(ResetPasswod value) resetPasswod,
    required TResult Function(ReportAProblem value) reportAProblem,
    required TResult Function(GetQuestions value) getQuestions,
    required TResult Function(GetQuestionEvent value) getQuestionEvent,
    required TResult Function(SearchQuestion value) searchQuestion,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PickImageScanning value)? pickImageScanning,
    TResult? Function(GetProfile value)? getProfile,
    TResult? Function(EditProfile value)? editProfile,
    TResult? Function(DeleteProfile value)? deleteProfile,
    TResult? Function(UserInfoChange value)? userInfoChange,
    TResult? Function(ResetPasswod value)? resetPasswod,
    TResult? Function(ReportAProblem value)? reportAProblem,
    TResult? Function(GetQuestions value)? getQuestions,
    TResult? Function(GetQuestionEvent value)? getQuestionEvent,
    TResult? Function(SearchQuestion value)? searchQuestion,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PickImageScanning value)? pickImageScanning,
    TResult Function(GetProfile value)? getProfile,
    TResult Function(EditProfile value)? editProfile,
    TResult Function(DeleteProfile value)? deleteProfile,
    TResult Function(UserInfoChange value)? userInfoChange,
    TResult Function(ResetPasswod value)? resetPasswod,
    TResult Function(ReportAProblem value)? reportAProblem,
    TResult Function(GetQuestions value)? getQuestions,
    TResult Function(GetQuestionEvent value)? getQuestionEvent,
    TResult Function(SearchQuestion value)? searchQuestion,
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
abstract class _$$PickImageScanningImplCopyWith<$Res> {
  factory _$$PickImageScanningImplCopyWith(_$PickImageScanningImpl value,
          $Res Function(_$PickImageScanningImpl) then) =
      __$$PickImageScanningImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool camera});
}

/// @nodoc
class __$$PickImageScanningImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$PickImageScanningImpl>
    implements _$$PickImageScanningImplCopyWith<$Res> {
  __$$PickImageScanningImplCopyWithImpl(_$PickImageScanningImpl _value,
      $Res Function(_$PickImageScanningImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? camera = null,
  }) {
    return _then(_$PickImageScanningImpl(
      camera: null == camera
          ? _value.camera
          : camera // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PickImageScanningImpl implements PickImageScanning {
  const _$PickImageScanningImpl({required this.camera});

  @override
  final bool camera;

  @override
  String toString() {
    return 'ProfileEvent.pickImageScanning(camera: $camera)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PickImageScanningImpl &&
            (identical(other.camera, camera) || other.camera == camera));
  }

  @override
  int get hashCode => Object.hash(runtimeType, camera);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PickImageScanningImplCopyWith<_$PickImageScanningImpl> get copyWith =>
      __$$PickImageScanningImplCopyWithImpl<_$PickImageScanningImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool camera) pickImageScanning,
    required TResult Function(bool isLoad) getProfile,
    required TResult Function(
            UserInfoChangeRequestModel userInfoChangeRequestModel)
        editProfile,
    required TResult Function() deleteProfile,
    required TResult Function(
            UserInfoChangeRequestModel userNameChanginRequestModel)
        userInfoChange,
    required TResult Function(
            ForgottPasswordRequestModel forgottPasswordRequestModel)
        resetPasswod,
    required TResult Function(
            ReportAProblemRequestModel reportAProblemRequestModel)
        reportAProblem,
    required TResult Function(String serachQuery) getQuestions,
    required TResult Function() getQuestionEvent,
    required TResult Function(String serachQuery) searchQuestion,
  }) {
    return pickImageScanning(camera);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool camera)? pickImageScanning,
    TResult? Function(bool isLoad)? getProfile,
    TResult? Function(UserInfoChangeRequestModel userInfoChangeRequestModel)?
        editProfile,
    TResult? Function()? deleteProfile,
    TResult? Function(UserInfoChangeRequestModel userNameChanginRequestModel)?
        userInfoChange,
    TResult? Function(ForgottPasswordRequestModel forgottPasswordRequestModel)?
        resetPasswod,
    TResult? Function(ReportAProblemRequestModel reportAProblemRequestModel)?
        reportAProblem,
    TResult? Function(String serachQuery)? getQuestions,
    TResult? Function()? getQuestionEvent,
    TResult? Function(String serachQuery)? searchQuestion,
  }) {
    return pickImageScanning?.call(camera);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool camera)? pickImageScanning,
    TResult Function(bool isLoad)? getProfile,
    TResult Function(UserInfoChangeRequestModel userInfoChangeRequestModel)?
        editProfile,
    TResult Function()? deleteProfile,
    TResult Function(UserInfoChangeRequestModel userNameChanginRequestModel)?
        userInfoChange,
    TResult Function(ForgottPasswordRequestModel forgottPasswordRequestModel)?
        resetPasswod,
    TResult Function(ReportAProblemRequestModel reportAProblemRequestModel)?
        reportAProblem,
    TResult Function(String serachQuery)? getQuestions,
    TResult Function()? getQuestionEvent,
    TResult Function(String serachQuery)? searchQuestion,
    required TResult orElse(),
  }) {
    if (pickImageScanning != null) {
      return pickImageScanning(camera);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PickImageScanning value) pickImageScanning,
    required TResult Function(GetProfile value) getProfile,
    required TResult Function(EditProfile value) editProfile,
    required TResult Function(DeleteProfile value) deleteProfile,
    required TResult Function(UserInfoChange value) userInfoChange,
    required TResult Function(ResetPasswod value) resetPasswod,
    required TResult Function(ReportAProblem value) reportAProblem,
    required TResult Function(GetQuestions value) getQuestions,
    required TResult Function(GetQuestionEvent value) getQuestionEvent,
    required TResult Function(SearchQuestion value) searchQuestion,
  }) {
    return pickImageScanning(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PickImageScanning value)? pickImageScanning,
    TResult? Function(GetProfile value)? getProfile,
    TResult? Function(EditProfile value)? editProfile,
    TResult? Function(DeleteProfile value)? deleteProfile,
    TResult? Function(UserInfoChange value)? userInfoChange,
    TResult? Function(ResetPasswod value)? resetPasswod,
    TResult? Function(ReportAProblem value)? reportAProblem,
    TResult? Function(GetQuestions value)? getQuestions,
    TResult? Function(GetQuestionEvent value)? getQuestionEvent,
    TResult? Function(SearchQuestion value)? searchQuestion,
  }) {
    return pickImageScanning?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PickImageScanning value)? pickImageScanning,
    TResult Function(GetProfile value)? getProfile,
    TResult Function(EditProfile value)? editProfile,
    TResult Function(DeleteProfile value)? deleteProfile,
    TResult Function(UserInfoChange value)? userInfoChange,
    TResult Function(ResetPasswod value)? resetPasswod,
    TResult Function(ReportAProblem value)? reportAProblem,
    TResult Function(GetQuestions value)? getQuestions,
    TResult Function(GetQuestionEvent value)? getQuestionEvent,
    TResult Function(SearchQuestion value)? searchQuestion,
    required TResult orElse(),
  }) {
    if (pickImageScanning != null) {
      return pickImageScanning(this);
    }
    return orElse();
  }
}

abstract class PickImageScanning implements ProfileEvent {
  const factory PickImageScanning({required final bool camera}) =
      _$PickImageScanningImpl;

  bool get camera;
  @JsonKey(ignore: true)
  _$$PickImageScanningImplCopyWith<_$PickImageScanningImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetProfileImplCopyWith<$Res> {
  factory _$$GetProfileImplCopyWith(
          _$GetProfileImpl value, $Res Function(_$GetProfileImpl) then) =
      __$$GetProfileImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isLoad});
}

/// @nodoc
class __$$GetProfileImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$GetProfileImpl>
    implements _$$GetProfileImplCopyWith<$Res> {
  __$$GetProfileImplCopyWithImpl(
      _$GetProfileImpl _value, $Res Function(_$GetProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoad = null,
  }) {
    return _then(_$GetProfileImpl(
      isLoad: null == isLoad
          ? _value.isLoad
          : isLoad // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GetProfileImpl implements GetProfile {
  const _$GetProfileImpl({required this.isLoad});

  @override
  final bool isLoad;

  @override
  String toString() {
    return 'ProfileEvent.getProfile(isLoad: $isLoad)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProfileImpl &&
            (identical(other.isLoad, isLoad) || other.isLoad == isLoad));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoad);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProfileImplCopyWith<_$GetProfileImpl> get copyWith =>
      __$$GetProfileImplCopyWithImpl<_$GetProfileImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool camera) pickImageScanning,
    required TResult Function(bool isLoad) getProfile,
    required TResult Function(
            UserInfoChangeRequestModel userInfoChangeRequestModel)
        editProfile,
    required TResult Function() deleteProfile,
    required TResult Function(
            UserInfoChangeRequestModel userNameChanginRequestModel)
        userInfoChange,
    required TResult Function(
            ForgottPasswordRequestModel forgottPasswordRequestModel)
        resetPasswod,
    required TResult Function(
            ReportAProblemRequestModel reportAProblemRequestModel)
        reportAProblem,
    required TResult Function(String serachQuery) getQuestions,
    required TResult Function() getQuestionEvent,
    required TResult Function(String serachQuery) searchQuestion,
  }) {
    return getProfile(isLoad);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool camera)? pickImageScanning,
    TResult? Function(bool isLoad)? getProfile,
    TResult? Function(UserInfoChangeRequestModel userInfoChangeRequestModel)?
        editProfile,
    TResult? Function()? deleteProfile,
    TResult? Function(UserInfoChangeRequestModel userNameChanginRequestModel)?
        userInfoChange,
    TResult? Function(ForgottPasswordRequestModel forgottPasswordRequestModel)?
        resetPasswod,
    TResult? Function(ReportAProblemRequestModel reportAProblemRequestModel)?
        reportAProblem,
    TResult? Function(String serachQuery)? getQuestions,
    TResult? Function()? getQuestionEvent,
    TResult? Function(String serachQuery)? searchQuestion,
  }) {
    return getProfile?.call(isLoad);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool camera)? pickImageScanning,
    TResult Function(bool isLoad)? getProfile,
    TResult Function(UserInfoChangeRequestModel userInfoChangeRequestModel)?
        editProfile,
    TResult Function()? deleteProfile,
    TResult Function(UserInfoChangeRequestModel userNameChanginRequestModel)?
        userInfoChange,
    TResult Function(ForgottPasswordRequestModel forgottPasswordRequestModel)?
        resetPasswod,
    TResult Function(ReportAProblemRequestModel reportAProblemRequestModel)?
        reportAProblem,
    TResult Function(String serachQuery)? getQuestions,
    TResult Function()? getQuestionEvent,
    TResult Function(String serachQuery)? searchQuestion,
    required TResult orElse(),
  }) {
    if (getProfile != null) {
      return getProfile(isLoad);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PickImageScanning value) pickImageScanning,
    required TResult Function(GetProfile value) getProfile,
    required TResult Function(EditProfile value) editProfile,
    required TResult Function(DeleteProfile value) deleteProfile,
    required TResult Function(UserInfoChange value) userInfoChange,
    required TResult Function(ResetPasswod value) resetPasswod,
    required TResult Function(ReportAProblem value) reportAProblem,
    required TResult Function(GetQuestions value) getQuestions,
    required TResult Function(GetQuestionEvent value) getQuestionEvent,
    required TResult Function(SearchQuestion value) searchQuestion,
  }) {
    return getProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PickImageScanning value)? pickImageScanning,
    TResult? Function(GetProfile value)? getProfile,
    TResult? Function(EditProfile value)? editProfile,
    TResult? Function(DeleteProfile value)? deleteProfile,
    TResult? Function(UserInfoChange value)? userInfoChange,
    TResult? Function(ResetPasswod value)? resetPasswod,
    TResult? Function(ReportAProblem value)? reportAProblem,
    TResult? Function(GetQuestions value)? getQuestions,
    TResult? Function(GetQuestionEvent value)? getQuestionEvent,
    TResult? Function(SearchQuestion value)? searchQuestion,
  }) {
    return getProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PickImageScanning value)? pickImageScanning,
    TResult Function(GetProfile value)? getProfile,
    TResult Function(EditProfile value)? editProfile,
    TResult Function(DeleteProfile value)? deleteProfile,
    TResult Function(UserInfoChange value)? userInfoChange,
    TResult Function(ResetPasswod value)? resetPasswod,
    TResult Function(ReportAProblem value)? reportAProblem,
    TResult Function(GetQuestions value)? getQuestions,
    TResult Function(GetQuestionEvent value)? getQuestionEvent,
    TResult Function(SearchQuestion value)? searchQuestion,
    required TResult orElse(),
  }) {
    if (getProfile != null) {
      return getProfile(this);
    }
    return orElse();
  }
}

abstract class GetProfile implements ProfileEvent {
  const factory GetProfile({required final bool isLoad}) = _$GetProfileImpl;

  bool get isLoad;
  @JsonKey(ignore: true)
  _$$GetProfileImplCopyWith<_$GetProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditProfileImplCopyWith<$Res> {
  factory _$$EditProfileImplCopyWith(
          _$EditProfileImpl value, $Res Function(_$EditProfileImpl) then) =
      __$$EditProfileImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserInfoChangeRequestModel userInfoChangeRequestModel});
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
    Object? userInfoChangeRequestModel = null,
  }) {
    return _then(_$EditProfileImpl(
      userInfoChangeRequestModel: null == userInfoChangeRequestModel
          ? _value.userInfoChangeRequestModel
          : userInfoChangeRequestModel // ignore: cast_nullable_to_non_nullable
              as UserInfoChangeRequestModel,
    ));
  }
}

/// @nodoc

class _$EditProfileImpl implements EditProfile {
  const _$EditProfileImpl({required this.userInfoChangeRequestModel});

  @override
  final UserInfoChangeRequestModel userInfoChangeRequestModel;

  @override
  String toString() {
    return 'ProfileEvent.editProfile(userInfoChangeRequestModel: $userInfoChangeRequestModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditProfileImpl &&
            (identical(other.userInfoChangeRequestModel,
                    userInfoChangeRequestModel) ||
                other.userInfoChangeRequestModel ==
                    userInfoChangeRequestModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userInfoChangeRequestModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditProfileImplCopyWith<_$EditProfileImpl> get copyWith =>
      __$$EditProfileImplCopyWithImpl<_$EditProfileImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool camera) pickImageScanning,
    required TResult Function(bool isLoad) getProfile,
    required TResult Function(
            UserInfoChangeRequestModel userInfoChangeRequestModel)
        editProfile,
    required TResult Function() deleteProfile,
    required TResult Function(
            UserInfoChangeRequestModel userNameChanginRequestModel)
        userInfoChange,
    required TResult Function(
            ForgottPasswordRequestModel forgottPasswordRequestModel)
        resetPasswod,
    required TResult Function(
            ReportAProblemRequestModel reportAProblemRequestModel)
        reportAProblem,
    required TResult Function(String serachQuery) getQuestions,
    required TResult Function() getQuestionEvent,
    required TResult Function(String serachQuery) searchQuestion,
  }) {
    return editProfile(userInfoChangeRequestModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool camera)? pickImageScanning,
    TResult? Function(bool isLoad)? getProfile,
    TResult? Function(UserInfoChangeRequestModel userInfoChangeRequestModel)?
        editProfile,
    TResult? Function()? deleteProfile,
    TResult? Function(UserInfoChangeRequestModel userNameChanginRequestModel)?
        userInfoChange,
    TResult? Function(ForgottPasswordRequestModel forgottPasswordRequestModel)?
        resetPasswod,
    TResult? Function(ReportAProblemRequestModel reportAProblemRequestModel)?
        reportAProblem,
    TResult? Function(String serachQuery)? getQuestions,
    TResult? Function()? getQuestionEvent,
    TResult? Function(String serachQuery)? searchQuestion,
  }) {
    return editProfile?.call(userInfoChangeRequestModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool camera)? pickImageScanning,
    TResult Function(bool isLoad)? getProfile,
    TResult Function(UserInfoChangeRequestModel userInfoChangeRequestModel)?
        editProfile,
    TResult Function()? deleteProfile,
    TResult Function(UserInfoChangeRequestModel userNameChanginRequestModel)?
        userInfoChange,
    TResult Function(ForgottPasswordRequestModel forgottPasswordRequestModel)?
        resetPasswod,
    TResult Function(ReportAProblemRequestModel reportAProblemRequestModel)?
        reportAProblem,
    TResult Function(String serachQuery)? getQuestions,
    TResult Function()? getQuestionEvent,
    TResult Function(String serachQuery)? searchQuestion,
    required TResult orElse(),
  }) {
    if (editProfile != null) {
      return editProfile(userInfoChangeRequestModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PickImageScanning value) pickImageScanning,
    required TResult Function(GetProfile value) getProfile,
    required TResult Function(EditProfile value) editProfile,
    required TResult Function(DeleteProfile value) deleteProfile,
    required TResult Function(UserInfoChange value) userInfoChange,
    required TResult Function(ResetPasswod value) resetPasswod,
    required TResult Function(ReportAProblem value) reportAProblem,
    required TResult Function(GetQuestions value) getQuestions,
    required TResult Function(GetQuestionEvent value) getQuestionEvent,
    required TResult Function(SearchQuestion value) searchQuestion,
  }) {
    return editProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PickImageScanning value)? pickImageScanning,
    TResult? Function(GetProfile value)? getProfile,
    TResult? Function(EditProfile value)? editProfile,
    TResult? Function(DeleteProfile value)? deleteProfile,
    TResult? Function(UserInfoChange value)? userInfoChange,
    TResult? Function(ResetPasswod value)? resetPasswod,
    TResult? Function(ReportAProblem value)? reportAProblem,
    TResult? Function(GetQuestions value)? getQuestions,
    TResult? Function(GetQuestionEvent value)? getQuestionEvent,
    TResult? Function(SearchQuestion value)? searchQuestion,
  }) {
    return editProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PickImageScanning value)? pickImageScanning,
    TResult Function(GetProfile value)? getProfile,
    TResult Function(EditProfile value)? editProfile,
    TResult Function(DeleteProfile value)? deleteProfile,
    TResult Function(UserInfoChange value)? userInfoChange,
    TResult Function(ResetPasswod value)? resetPasswod,
    TResult Function(ReportAProblem value)? reportAProblem,
    TResult Function(GetQuestions value)? getQuestions,
    TResult Function(GetQuestionEvent value)? getQuestionEvent,
    TResult Function(SearchQuestion value)? searchQuestion,
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
      {required final UserInfoChangeRequestModel
          userInfoChangeRequestModel}) = _$EditProfileImpl;

  UserInfoChangeRequestModel get userInfoChangeRequestModel;
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

class _$DeleteProfileImpl implements DeleteProfile {
  const _$DeleteProfileImpl();

  @override
  String toString() {
    return 'ProfileEvent.deleteProfile()';
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
    required TResult Function(bool camera) pickImageScanning,
    required TResult Function(bool isLoad) getProfile,
    required TResult Function(
            UserInfoChangeRequestModel userInfoChangeRequestModel)
        editProfile,
    required TResult Function() deleteProfile,
    required TResult Function(
            UserInfoChangeRequestModel userNameChanginRequestModel)
        userInfoChange,
    required TResult Function(
            ForgottPasswordRequestModel forgottPasswordRequestModel)
        resetPasswod,
    required TResult Function(
            ReportAProblemRequestModel reportAProblemRequestModel)
        reportAProblem,
    required TResult Function(String serachQuery) getQuestions,
    required TResult Function() getQuestionEvent,
    required TResult Function(String serachQuery) searchQuestion,
  }) {
    return deleteProfile();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool camera)? pickImageScanning,
    TResult? Function(bool isLoad)? getProfile,
    TResult? Function(UserInfoChangeRequestModel userInfoChangeRequestModel)?
        editProfile,
    TResult? Function()? deleteProfile,
    TResult? Function(UserInfoChangeRequestModel userNameChanginRequestModel)?
        userInfoChange,
    TResult? Function(ForgottPasswordRequestModel forgottPasswordRequestModel)?
        resetPasswod,
    TResult? Function(ReportAProblemRequestModel reportAProblemRequestModel)?
        reportAProblem,
    TResult? Function(String serachQuery)? getQuestions,
    TResult? Function()? getQuestionEvent,
    TResult? Function(String serachQuery)? searchQuestion,
  }) {
    return deleteProfile?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool camera)? pickImageScanning,
    TResult Function(bool isLoad)? getProfile,
    TResult Function(UserInfoChangeRequestModel userInfoChangeRequestModel)?
        editProfile,
    TResult Function()? deleteProfile,
    TResult Function(UserInfoChangeRequestModel userNameChanginRequestModel)?
        userInfoChange,
    TResult Function(ForgottPasswordRequestModel forgottPasswordRequestModel)?
        resetPasswod,
    TResult Function(ReportAProblemRequestModel reportAProblemRequestModel)?
        reportAProblem,
    TResult Function(String serachQuery)? getQuestions,
    TResult Function()? getQuestionEvent,
    TResult Function(String serachQuery)? searchQuestion,
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
    required TResult Function(PickImageScanning value) pickImageScanning,
    required TResult Function(GetProfile value) getProfile,
    required TResult Function(EditProfile value) editProfile,
    required TResult Function(DeleteProfile value) deleteProfile,
    required TResult Function(UserInfoChange value) userInfoChange,
    required TResult Function(ResetPasswod value) resetPasswod,
    required TResult Function(ReportAProblem value) reportAProblem,
    required TResult Function(GetQuestions value) getQuestions,
    required TResult Function(GetQuestionEvent value) getQuestionEvent,
    required TResult Function(SearchQuestion value) searchQuestion,
  }) {
    return deleteProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PickImageScanning value)? pickImageScanning,
    TResult? Function(GetProfile value)? getProfile,
    TResult? Function(EditProfile value)? editProfile,
    TResult? Function(DeleteProfile value)? deleteProfile,
    TResult? Function(UserInfoChange value)? userInfoChange,
    TResult? Function(ResetPasswod value)? resetPasswod,
    TResult? Function(ReportAProblem value)? reportAProblem,
    TResult? Function(GetQuestions value)? getQuestions,
    TResult? Function(GetQuestionEvent value)? getQuestionEvent,
    TResult? Function(SearchQuestion value)? searchQuestion,
  }) {
    return deleteProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PickImageScanning value)? pickImageScanning,
    TResult Function(GetProfile value)? getProfile,
    TResult Function(EditProfile value)? editProfile,
    TResult Function(DeleteProfile value)? deleteProfile,
    TResult Function(UserInfoChange value)? userInfoChange,
    TResult Function(ResetPasswod value)? resetPasswod,
    TResult Function(ReportAProblem value)? reportAProblem,
    TResult Function(GetQuestions value)? getQuestions,
    TResult Function(GetQuestionEvent value)? getQuestionEvent,
    TResult Function(SearchQuestion value)? searchQuestion,
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
abstract class _$$UserInfoChangeImplCopyWith<$Res> {
  factory _$$UserInfoChangeImplCopyWith(_$UserInfoChangeImpl value,
          $Res Function(_$UserInfoChangeImpl) then) =
      __$$UserInfoChangeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserInfoChangeRequestModel userNameChanginRequestModel});
}

/// @nodoc
class __$$UserInfoChangeImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$UserInfoChangeImpl>
    implements _$$UserInfoChangeImplCopyWith<$Res> {
  __$$UserInfoChangeImplCopyWithImpl(
      _$UserInfoChangeImpl _value, $Res Function(_$UserInfoChangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userNameChanginRequestModel = null,
  }) {
    return _then(_$UserInfoChangeImpl(
      userNameChanginRequestModel: null == userNameChanginRequestModel
          ? _value.userNameChanginRequestModel
          : userNameChanginRequestModel // ignore: cast_nullable_to_non_nullable
              as UserInfoChangeRequestModel,
    ));
  }
}

/// @nodoc

class _$UserInfoChangeImpl implements UserInfoChange {
  const _$UserInfoChangeImpl({required this.userNameChanginRequestModel});

  @override
  final UserInfoChangeRequestModel userNameChanginRequestModel;

  @override
  String toString() {
    return 'ProfileEvent.userInfoChange(userNameChanginRequestModel: $userNameChanginRequestModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoChangeImpl &&
            (identical(other.userNameChanginRequestModel,
                    userNameChanginRequestModel) ||
                other.userNameChanginRequestModel ==
                    userNameChanginRequestModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userNameChanginRequestModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInfoChangeImplCopyWith<_$UserInfoChangeImpl> get copyWith =>
      __$$UserInfoChangeImplCopyWithImpl<_$UserInfoChangeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool camera) pickImageScanning,
    required TResult Function(bool isLoad) getProfile,
    required TResult Function(
            UserInfoChangeRequestModel userInfoChangeRequestModel)
        editProfile,
    required TResult Function() deleteProfile,
    required TResult Function(
            UserInfoChangeRequestModel userNameChanginRequestModel)
        userInfoChange,
    required TResult Function(
            ForgottPasswordRequestModel forgottPasswordRequestModel)
        resetPasswod,
    required TResult Function(
            ReportAProblemRequestModel reportAProblemRequestModel)
        reportAProblem,
    required TResult Function(String serachQuery) getQuestions,
    required TResult Function() getQuestionEvent,
    required TResult Function(String serachQuery) searchQuestion,
  }) {
    return userInfoChange(userNameChanginRequestModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool camera)? pickImageScanning,
    TResult? Function(bool isLoad)? getProfile,
    TResult? Function(UserInfoChangeRequestModel userInfoChangeRequestModel)?
        editProfile,
    TResult? Function()? deleteProfile,
    TResult? Function(UserInfoChangeRequestModel userNameChanginRequestModel)?
        userInfoChange,
    TResult? Function(ForgottPasswordRequestModel forgottPasswordRequestModel)?
        resetPasswod,
    TResult? Function(ReportAProblemRequestModel reportAProblemRequestModel)?
        reportAProblem,
    TResult? Function(String serachQuery)? getQuestions,
    TResult? Function()? getQuestionEvent,
    TResult? Function(String serachQuery)? searchQuestion,
  }) {
    return userInfoChange?.call(userNameChanginRequestModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool camera)? pickImageScanning,
    TResult Function(bool isLoad)? getProfile,
    TResult Function(UserInfoChangeRequestModel userInfoChangeRequestModel)?
        editProfile,
    TResult Function()? deleteProfile,
    TResult Function(UserInfoChangeRequestModel userNameChanginRequestModel)?
        userInfoChange,
    TResult Function(ForgottPasswordRequestModel forgottPasswordRequestModel)?
        resetPasswod,
    TResult Function(ReportAProblemRequestModel reportAProblemRequestModel)?
        reportAProblem,
    TResult Function(String serachQuery)? getQuestions,
    TResult Function()? getQuestionEvent,
    TResult Function(String serachQuery)? searchQuestion,
    required TResult orElse(),
  }) {
    if (userInfoChange != null) {
      return userInfoChange(userNameChanginRequestModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PickImageScanning value) pickImageScanning,
    required TResult Function(GetProfile value) getProfile,
    required TResult Function(EditProfile value) editProfile,
    required TResult Function(DeleteProfile value) deleteProfile,
    required TResult Function(UserInfoChange value) userInfoChange,
    required TResult Function(ResetPasswod value) resetPasswod,
    required TResult Function(ReportAProblem value) reportAProblem,
    required TResult Function(GetQuestions value) getQuestions,
    required TResult Function(GetQuestionEvent value) getQuestionEvent,
    required TResult Function(SearchQuestion value) searchQuestion,
  }) {
    return userInfoChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PickImageScanning value)? pickImageScanning,
    TResult? Function(GetProfile value)? getProfile,
    TResult? Function(EditProfile value)? editProfile,
    TResult? Function(DeleteProfile value)? deleteProfile,
    TResult? Function(UserInfoChange value)? userInfoChange,
    TResult? Function(ResetPasswod value)? resetPasswod,
    TResult? Function(ReportAProblem value)? reportAProblem,
    TResult? Function(GetQuestions value)? getQuestions,
    TResult? Function(GetQuestionEvent value)? getQuestionEvent,
    TResult? Function(SearchQuestion value)? searchQuestion,
  }) {
    return userInfoChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PickImageScanning value)? pickImageScanning,
    TResult Function(GetProfile value)? getProfile,
    TResult Function(EditProfile value)? editProfile,
    TResult Function(DeleteProfile value)? deleteProfile,
    TResult Function(UserInfoChange value)? userInfoChange,
    TResult Function(ResetPasswod value)? resetPasswod,
    TResult Function(ReportAProblem value)? reportAProblem,
    TResult Function(GetQuestions value)? getQuestions,
    TResult Function(GetQuestionEvent value)? getQuestionEvent,
    TResult Function(SearchQuestion value)? searchQuestion,
    required TResult orElse(),
  }) {
    if (userInfoChange != null) {
      return userInfoChange(this);
    }
    return orElse();
  }
}

abstract class UserInfoChange implements ProfileEvent {
  const factory UserInfoChange(
      {required final UserInfoChangeRequestModel
          userNameChanginRequestModel}) = _$UserInfoChangeImpl;

  UserInfoChangeRequestModel get userNameChanginRequestModel;
  @JsonKey(ignore: true)
  _$$UserInfoChangeImplCopyWith<_$UserInfoChangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetPasswodImplCopyWith<$Res> {
  factory _$$ResetPasswodImplCopyWith(
          _$ResetPasswodImpl value, $Res Function(_$ResetPasswodImpl) then) =
      __$$ResetPasswodImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ForgottPasswordRequestModel forgottPasswordRequestModel});
}

/// @nodoc
class __$$ResetPasswodImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$ResetPasswodImpl>
    implements _$$ResetPasswodImplCopyWith<$Res> {
  __$$ResetPasswodImplCopyWithImpl(
      _$ResetPasswodImpl _value, $Res Function(_$ResetPasswodImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forgottPasswordRequestModel = null,
  }) {
    return _then(_$ResetPasswodImpl(
      forgottPasswordRequestModel: null == forgottPasswordRequestModel
          ? _value.forgottPasswordRequestModel
          : forgottPasswordRequestModel // ignore: cast_nullable_to_non_nullable
              as ForgottPasswordRequestModel,
    ));
  }
}

/// @nodoc

class _$ResetPasswodImpl implements ResetPasswod {
  const _$ResetPasswodImpl({required this.forgottPasswordRequestModel});

  @override
  final ForgottPasswordRequestModel forgottPasswordRequestModel;

  @override
  String toString() {
    return 'ProfileEvent.resetPasswod(forgottPasswordRequestModel: $forgottPasswordRequestModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswodImpl &&
            (identical(other.forgottPasswordRequestModel,
                    forgottPasswordRequestModel) ||
                other.forgottPasswordRequestModel ==
                    forgottPasswordRequestModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, forgottPasswordRequestModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswodImplCopyWith<_$ResetPasswodImpl> get copyWith =>
      __$$ResetPasswodImplCopyWithImpl<_$ResetPasswodImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool camera) pickImageScanning,
    required TResult Function(bool isLoad) getProfile,
    required TResult Function(
            UserInfoChangeRequestModel userInfoChangeRequestModel)
        editProfile,
    required TResult Function() deleteProfile,
    required TResult Function(
            UserInfoChangeRequestModel userNameChanginRequestModel)
        userInfoChange,
    required TResult Function(
            ForgottPasswordRequestModel forgottPasswordRequestModel)
        resetPasswod,
    required TResult Function(
            ReportAProblemRequestModel reportAProblemRequestModel)
        reportAProblem,
    required TResult Function(String serachQuery) getQuestions,
    required TResult Function() getQuestionEvent,
    required TResult Function(String serachQuery) searchQuestion,
  }) {
    return resetPasswod(forgottPasswordRequestModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool camera)? pickImageScanning,
    TResult? Function(bool isLoad)? getProfile,
    TResult? Function(UserInfoChangeRequestModel userInfoChangeRequestModel)?
        editProfile,
    TResult? Function()? deleteProfile,
    TResult? Function(UserInfoChangeRequestModel userNameChanginRequestModel)?
        userInfoChange,
    TResult? Function(ForgottPasswordRequestModel forgottPasswordRequestModel)?
        resetPasswod,
    TResult? Function(ReportAProblemRequestModel reportAProblemRequestModel)?
        reportAProblem,
    TResult? Function(String serachQuery)? getQuestions,
    TResult? Function()? getQuestionEvent,
    TResult? Function(String serachQuery)? searchQuestion,
  }) {
    return resetPasswod?.call(forgottPasswordRequestModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool camera)? pickImageScanning,
    TResult Function(bool isLoad)? getProfile,
    TResult Function(UserInfoChangeRequestModel userInfoChangeRequestModel)?
        editProfile,
    TResult Function()? deleteProfile,
    TResult Function(UserInfoChangeRequestModel userNameChanginRequestModel)?
        userInfoChange,
    TResult Function(ForgottPasswordRequestModel forgottPasswordRequestModel)?
        resetPasswod,
    TResult Function(ReportAProblemRequestModel reportAProblemRequestModel)?
        reportAProblem,
    TResult Function(String serachQuery)? getQuestions,
    TResult Function()? getQuestionEvent,
    TResult Function(String serachQuery)? searchQuestion,
    required TResult orElse(),
  }) {
    if (resetPasswod != null) {
      return resetPasswod(forgottPasswordRequestModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PickImageScanning value) pickImageScanning,
    required TResult Function(GetProfile value) getProfile,
    required TResult Function(EditProfile value) editProfile,
    required TResult Function(DeleteProfile value) deleteProfile,
    required TResult Function(UserInfoChange value) userInfoChange,
    required TResult Function(ResetPasswod value) resetPasswod,
    required TResult Function(ReportAProblem value) reportAProblem,
    required TResult Function(GetQuestions value) getQuestions,
    required TResult Function(GetQuestionEvent value) getQuestionEvent,
    required TResult Function(SearchQuestion value) searchQuestion,
  }) {
    return resetPasswod(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PickImageScanning value)? pickImageScanning,
    TResult? Function(GetProfile value)? getProfile,
    TResult? Function(EditProfile value)? editProfile,
    TResult? Function(DeleteProfile value)? deleteProfile,
    TResult? Function(UserInfoChange value)? userInfoChange,
    TResult? Function(ResetPasswod value)? resetPasswod,
    TResult? Function(ReportAProblem value)? reportAProblem,
    TResult? Function(GetQuestions value)? getQuestions,
    TResult? Function(GetQuestionEvent value)? getQuestionEvent,
    TResult? Function(SearchQuestion value)? searchQuestion,
  }) {
    return resetPasswod?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PickImageScanning value)? pickImageScanning,
    TResult Function(GetProfile value)? getProfile,
    TResult Function(EditProfile value)? editProfile,
    TResult Function(DeleteProfile value)? deleteProfile,
    TResult Function(UserInfoChange value)? userInfoChange,
    TResult Function(ResetPasswod value)? resetPasswod,
    TResult Function(ReportAProblem value)? reportAProblem,
    TResult Function(GetQuestions value)? getQuestions,
    TResult Function(GetQuestionEvent value)? getQuestionEvent,
    TResult Function(SearchQuestion value)? searchQuestion,
    required TResult orElse(),
  }) {
    if (resetPasswod != null) {
      return resetPasswod(this);
    }
    return orElse();
  }
}

abstract class ResetPasswod implements ProfileEvent {
  const factory ResetPasswod(
      {required final ForgottPasswordRequestModel
          forgottPasswordRequestModel}) = _$ResetPasswodImpl;

  ForgottPasswordRequestModel get forgottPasswordRequestModel;
  @JsonKey(ignore: true)
  _$$ResetPasswodImplCopyWith<_$ResetPasswodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReportAProblemImplCopyWith<$Res> {
  factory _$$ReportAProblemImplCopyWith(_$ReportAProblemImpl value,
          $Res Function(_$ReportAProblemImpl) then) =
      __$$ReportAProblemImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ReportAProblemRequestModel reportAProblemRequestModel});
}

/// @nodoc
class __$$ReportAProblemImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$ReportAProblemImpl>
    implements _$$ReportAProblemImplCopyWith<$Res> {
  __$$ReportAProblemImplCopyWithImpl(
      _$ReportAProblemImpl _value, $Res Function(_$ReportAProblemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportAProblemRequestModel = null,
  }) {
    return _then(_$ReportAProblemImpl(
      reportAProblemRequestModel: null == reportAProblemRequestModel
          ? _value.reportAProblemRequestModel
          : reportAProblemRequestModel // ignore: cast_nullable_to_non_nullable
              as ReportAProblemRequestModel,
    ));
  }
}

/// @nodoc

class _$ReportAProblemImpl implements ReportAProblem {
  const _$ReportAProblemImpl({required this.reportAProblemRequestModel});

  @override
  final ReportAProblemRequestModel reportAProblemRequestModel;

  @override
  String toString() {
    return 'ProfileEvent.reportAProblem(reportAProblemRequestModel: $reportAProblemRequestModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportAProblemImpl &&
            (identical(other.reportAProblemRequestModel,
                    reportAProblemRequestModel) ||
                other.reportAProblemRequestModel ==
                    reportAProblemRequestModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reportAProblemRequestModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportAProblemImplCopyWith<_$ReportAProblemImpl> get copyWith =>
      __$$ReportAProblemImplCopyWithImpl<_$ReportAProblemImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool camera) pickImageScanning,
    required TResult Function(bool isLoad) getProfile,
    required TResult Function(
            UserInfoChangeRequestModel userInfoChangeRequestModel)
        editProfile,
    required TResult Function() deleteProfile,
    required TResult Function(
            UserInfoChangeRequestModel userNameChanginRequestModel)
        userInfoChange,
    required TResult Function(
            ForgottPasswordRequestModel forgottPasswordRequestModel)
        resetPasswod,
    required TResult Function(
            ReportAProblemRequestModel reportAProblemRequestModel)
        reportAProblem,
    required TResult Function(String serachQuery) getQuestions,
    required TResult Function() getQuestionEvent,
    required TResult Function(String serachQuery) searchQuestion,
  }) {
    return reportAProblem(reportAProblemRequestModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool camera)? pickImageScanning,
    TResult? Function(bool isLoad)? getProfile,
    TResult? Function(UserInfoChangeRequestModel userInfoChangeRequestModel)?
        editProfile,
    TResult? Function()? deleteProfile,
    TResult? Function(UserInfoChangeRequestModel userNameChanginRequestModel)?
        userInfoChange,
    TResult? Function(ForgottPasswordRequestModel forgottPasswordRequestModel)?
        resetPasswod,
    TResult? Function(ReportAProblemRequestModel reportAProblemRequestModel)?
        reportAProblem,
    TResult? Function(String serachQuery)? getQuestions,
    TResult? Function()? getQuestionEvent,
    TResult? Function(String serachQuery)? searchQuestion,
  }) {
    return reportAProblem?.call(reportAProblemRequestModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool camera)? pickImageScanning,
    TResult Function(bool isLoad)? getProfile,
    TResult Function(UserInfoChangeRequestModel userInfoChangeRequestModel)?
        editProfile,
    TResult Function()? deleteProfile,
    TResult Function(UserInfoChangeRequestModel userNameChanginRequestModel)?
        userInfoChange,
    TResult Function(ForgottPasswordRequestModel forgottPasswordRequestModel)?
        resetPasswod,
    TResult Function(ReportAProblemRequestModel reportAProblemRequestModel)?
        reportAProblem,
    TResult Function(String serachQuery)? getQuestions,
    TResult Function()? getQuestionEvent,
    TResult Function(String serachQuery)? searchQuestion,
    required TResult orElse(),
  }) {
    if (reportAProblem != null) {
      return reportAProblem(reportAProblemRequestModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PickImageScanning value) pickImageScanning,
    required TResult Function(GetProfile value) getProfile,
    required TResult Function(EditProfile value) editProfile,
    required TResult Function(DeleteProfile value) deleteProfile,
    required TResult Function(UserInfoChange value) userInfoChange,
    required TResult Function(ResetPasswod value) resetPasswod,
    required TResult Function(ReportAProblem value) reportAProblem,
    required TResult Function(GetQuestions value) getQuestions,
    required TResult Function(GetQuestionEvent value) getQuestionEvent,
    required TResult Function(SearchQuestion value) searchQuestion,
  }) {
    return reportAProblem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PickImageScanning value)? pickImageScanning,
    TResult? Function(GetProfile value)? getProfile,
    TResult? Function(EditProfile value)? editProfile,
    TResult? Function(DeleteProfile value)? deleteProfile,
    TResult? Function(UserInfoChange value)? userInfoChange,
    TResult? Function(ResetPasswod value)? resetPasswod,
    TResult? Function(ReportAProblem value)? reportAProblem,
    TResult? Function(GetQuestions value)? getQuestions,
    TResult? Function(GetQuestionEvent value)? getQuestionEvent,
    TResult? Function(SearchQuestion value)? searchQuestion,
  }) {
    return reportAProblem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PickImageScanning value)? pickImageScanning,
    TResult Function(GetProfile value)? getProfile,
    TResult Function(EditProfile value)? editProfile,
    TResult Function(DeleteProfile value)? deleteProfile,
    TResult Function(UserInfoChange value)? userInfoChange,
    TResult Function(ResetPasswod value)? resetPasswod,
    TResult Function(ReportAProblem value)? reportAProblem,
    TResult Function(GetQuestions value)? getQuestions,
    TResult Function(GetQuestionEvent value)? getQuestionEvent,
    TResult Function(SearchQuestion value)? searchQuestion,
    required TResult orElse(),
  }) {
    if (reportAProblem != null) {
      return reportAProblem(this);
    }
    return orElse();
  }
}

abstract class ReportAProblem implements ProfileEvent {
  const factory ReportAProblem(
      {required final ReportAProblemRequestModel
          reportAProblemRequestModel}) = _$ReportAProblemImpl;

  ReportAProblemRequestModel get reportAProblemRequestModel;
  @JsonKey(ignore: true)
  _$$ReportAProblemImplCopyWith<_$ReportAProblemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetQuestionsImplCopyWith<$Res> {
  factory _$$GetQuestionsImplCopyWith(
          _$GetQuestionsImpl value, $Res Function(_$GetQuestionsImpl) then) =
      __$$GetQuestionsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String serachQuery});
}

/// @nodoc
class __$$GetQuestionsImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$GetQuestionsImpl>
    implements _$$GetQuestionsImplCopyWith<$Res> {
  __$$GetQuestionsImplCopyWithImpl(
      _$GetQuestionsImpl _value, $Res Function(_$GetQuestionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serachQuery = null,
  }) {
    return _then(_$GetQuestionsImpl(
      serachQuery: null == serachQuery
          ? _value.serachQuery
          : serachQuery // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetQuestionsImpl implements GetQuestions {
  const _$GetQuestionsImpl({required this.serachQuery});

  @override
  final String serachQuery;

  @override
  String toString() {
    return 'ProfileEvent.getQuestions(serachQuery: $serachQuery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetQuestionsImpl &&
            (identical(other.serachQuery, serachQuery) ||
                other.serachQuery == serachQuery));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serachQuery);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetQuestionsImplCopyWith<_$GetQuestionsImpl> get copyWith =>
      __$$GetQuestionsImplCopyWithImpl<_$GetQuestionsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool camera) pickImageScanning,
    required TResult Function(bool isLoad) getProfile,
    required TResult Function(
            UserInfoChangeRequestModel userInfoChangeRequestModel)
        editProfile,
    required TResult Function() deleteProfile,
    required TResult Function(
            UserInfoChangeRequestModel userNameChanginRequestModel)
        userInfoChange,
    required TResult Function(
            ForgottPasswordRequestModel forgottPasswordRequestModel)
        resetPasswod,
    required TResult Function(
            ReportAProblemRequestModel reportAProblemRequestModel)
        reportAProblem,
    required TResult Function(String serachQuery) getQuestions,
    required TResult Function() getQuestionEvent,
    required TResult Function(String serachQuery) searchQuestion,
  }) {
    return getQuestions(serachQuery);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool camera)? pickImageScanning,
    TResult? Function(bool isLoad)? getProfile,
    TResult? Function(UserInfoChangeRequestModel userInfoChangeRequestModel)?
        editProfile,
    TResult? Function()? deleteProfile,
    TResult? Function(UserInfoChangeRequestModel userNameChanginRequestModel)?
        userInfoChange,
    TResult? Function(ForgottPasswordRequestModel forgottPasswordRequestModel)?
        resetPasswod,
    TResult? Function(ReportAProblemRequestModel reportAProblemRequestModel)?
        reportAProblem,
    TResult? Function(String serachQuery)? getQuestions,
    TResult? Function()? getQuestionEvent,
    TResult? Function(String serachQuery)? searchQuestion,
  }) {
    return getQuestions?.call(serachQuery);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool camera)? pickImageScanning,
    TResult Function(bool isLoad)? getProfile,
    TResult Function(UserInfoChangeRequestModel userInfoChangeRequestModel)?
        editProfile,
    TResult Function()? deleteProfile,
    TResult Function(UserInfoChangeRequestModel userNameChanginRequestModel)?
        userInfoChange,
    TResult Function(ForgottPasswordRequestModel forgottPasswordRequestModel)?
        resetPasswod,
    TResult Function(ReportAProblemRequestModel reportAProblemRequestModel)?
        reportAProblem,
    TResult Function(String serachQuery)? getQuestions,
    TResult Function()? getQuestionEvent,
    TResult Function(String serachQuery)? searchQuestion,
    required TResult orElse(),
  }) {
    if (getQuestions != null) {
      return getQuestions(serachQuery);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PickImageScanning value) pickImageScanning,
    required TResult Function(GetProfile value) getProfile,
    required TResult Function(EditProfile value) editProfile,
    required TResult Function(DeleteProfile value) deleteProfile,
    required TResult Function(UserInfoChange value) userInfoChange,
    required TResult Function(ResetPasswod value) resetPasswod,
    required TResult Function(ReportAProblem value) reportAProblem,
    required TResult Function(GetQuestions value) getQuestions,
    required TResult Function(GetQuestionEvent value) getQuestionEvent,
    required TResult Function(SearchQuestion value) searchQuestion,
  }) {
    return getQuestions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PickImageScanning value)? pickImageScanning,
    TResult? Function(GetProfile value)? getProfile,
    TResult? Function(EditProfile value)? editProfile,
    TResult? Function(DeleteProfile value)? deleteProfile,
    TResult? Function(UserInfoChange value)? userInfoChange,
    TResult? Function(ResetPasswod value)? resetPasswod,
    TResult? Function(ReportAProblem value)? reportAProblem,
    TResult? Function(GetQuestions value)? getQuestions,
    TResult? Function(GetQuestionEvent value)? getQuestionEvent,
    TResult? Function(SearchQuestion value)? searchQuestion,
  }) {
    return getQuestions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PickImageScanning value)? pickImageScanning,
    TResult Function(GetProfile value)? getProfile,
    TResult Function(EditProfile value)? editProfile,
    TResult Function(DeleteProfile value)? deleteProfile,
    TResult Function(UserInfoChange value)? userInfoChange,
    TResult Function(ResetPasswod value)? resetPasswod,
    TResult Function(ReportAProblem value)? reportAProblem,
    TResult Function(GetQuestions value)? getQuestions,
    TResult Function(GetQuestionEvent value)? getQuestionEvent,
    TResult Function(SearchQuestion value)? searchQuestion,
    required TResult orElse(),
  }) {
    if (getQuestions != null) {
      return getQuestions(this);
    }
    return orElse();
  }
}

abstract class GetQuestions implements ProfileEvent {
  const factory GetQuestions({required final String serachQuery}) =
      _$GetQuestionsImpl;

  String get serachQuery;
  @JsonKey(ignore: true)
  _$$GetQuestionsImplCopyWith<_$GetQuestionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetQuestionEventImplCopyWith<$Res> {
  factory _$$GetQuestionEventImplCopyWith(_$GetQuestionEventImpl value,
          $Res Function(_$GetQuestionEventImpl) then) =
      __$$GetQuestionEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetQuestionEventImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$GetQuestionEventImpl>
    implements _$$GetQuestionEventImplCopyWith<$Res> {
  __$$GetQuestionEventImplCopyWithImpl(_$GetQuestionEventImpl _value,
      $Res Function(_$GetQuestionEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetQuestionEventImpl implements GetQuestionEvent {
  const _$GetQuestionEventImpl();

  @override
  String toString() {
    return 'ProfileEvent.getQuestionEvent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetQuestionEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool camera) pickImageScanning,
    required TResult Function(bool isLoad) getProfile,
    required TResult Function(
            UserInfoChangeRequestModel userInfoChangeRequestModel)
        editProfile,
    required TResult Function() deleteProfile,
    required TResult Function(
            UserInfoChangeRequestModel userNameChanginRequestModel)
        userInfoChange,
    required TResult Function(
            ForgottPasswordRequestModel forgottPasswordRequestModel)
        resetPasswod,
    required TResult Function(
            ReportAProblemRequestModel reportAProblemRequestModel)
        reportAProblem,
    required TResult Function(String serachQuery) getQuestions,
    required TResult Function() getQuestionEvent,
    required TResult Function(String serachQuery) searchQuestion,
  }) {
    return getQuestionEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool camera)? pickImageScanning,
    TResult? Function(bool isLoad)? getProfile,
    TResult? Function(UserInfoChangeRequestModel userInfoChangeRequestModel)?
        editProfile,
    TResult? Function()? deleteProfile,
    TResult? Function(UserInfoChangeRequestModel userNameChanginRequestModel)?
        userInfoChange,
    TResult? Function(ForgottPasswordRequestModel forgottPasswordRequestModel)?
        resetPasswod,
    TResult? Function(ReportAProblemRequestModel reportAProblemRequestModel)?
        reportAProblem,
    TResult? Function(String serachQuery)? getQuestions,
    TResult? Function()? getQuestionEvent,
    TResult? Function(String serachQuery)? searchQuestion,
  }) {
    return getQuestionEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool camera)? pickImageScanning,
    TResult Function(bool isLoad)? getProfile,
    TResult Function(UserInfoChangeRequestModel userInfoChangeRequestModel)?
        editProfile,
    TResult Function()? deleteProfile,
    TResult Function(UserInfoChangeRequestModel userNameChanginRequestModel)?
        userInfoChange,
    TResult Function(ForgottPasswordRequestModel forgottPasswordRequestModel)?
        resetPasswod,
    TResult Function(ReportAProblemRequestModel reportAProblemRequestModel)?
        reportAProblem,
    TResult Function(String serachQuery)? getQuestions,
    TResult Function()? getQuestionEvent,
    TResult Function(String serachQuery)? searchQuestion,
    required TResult orElse(),
  }) {
    if (getQuestionEvent != null) {
      return getQuestionEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PickImageScanning value) pickImageScanning,
    required TResult Function(GetProfile value) getProfile,
    required TResult Function(EditProfile value) editProfile,
    required TResult Function(DeleteProfile value) deleteProfile,
    required TResult Function(UserInfoChange value) userInfoChange,
    required TResult Function(ResetPasswod value) resetPasswod,
    required TResult Function(ReportAProblem value) reportAProblem,
    required TResult Function(GetQuestions value) getQuestions,
    required TResult Function(GetQuestionEvent value) getQuestionEvent,
    required TResult Function(SearchQuestion value) searchQuestion,
  }) {
    return getQuestionEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PickImageScanning value)? pickImageScanning,
    TResult? Function(GetProfile value)? getProfile,
    TResult? Function(EditProfile value)? editProfile,
    TResult? Function(DeleteProfile value)? deleteProfile,
    TResult? Function(UserInfoChange value)? userInfoChange,
    TResult? Function(ResetPasswod value)? resetPasswod,
    TResult? Function(ReportAProblem value)? reportAProblem,
    TResult? Function(GetQuestions value)? getQuestions,
    TResult? Function(GetQuestionEvent value)? getQuestionEvent,
    TResult? Function(SearchQuestion value)? searchQuestion,
  }) {
    return getQuestionEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PickImageScanning value)? pickImageScanning,
    TResult Function(GetProfile value)? getProfile,
    TResult Function(EditProfile value)? editProfile,
    TResult Function(DeleteProfile value)? deleteProfile,
    TResult Function(UserInfoChange value)? userInfoChange,
    TResult Function(ResetPasswod value)? resetPasswod,
    TResult Function(ReportAProblem value)? reportAProblem,
    TResult Function(GetQuestions value)? getQuestions,
    TResult Function(GetQuestionEvent value)? getQuestionEvent,
    TResult Function(SearchQuestion value)? searchQuestion,
    required TResult orElse(),
  }) {
    if (getQuestionEvent != null) {
      return getQuestionEvent(this);
    }
    return orElse();
  }
}

abstract class GetQuestionEvent implements ProfileEvent {
  const factory GetQuestionEvent() = _$GetQuestionEventImpl;
}

/// @nodoc
abstract class _$$SearchQuestionImplCopyWith<$Res> {
  factory _$$SearchQuestionImplCopyWith(_$SearchQuestionImpl value,
          $Res Function(_$SearchQuestionImpl) then) =
      __$$SearchQuestionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String serachQuery});
}

/// @nodoc
class __$$SearchQuestionImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$SearchQuestionImpl>
    implements _$$SearchQuestionImplCopyWith<$Res> {
  __$$SearchQuestionImplCopyWithImpl(
      _$SearchQuestionImpl _value, $Res Function(_$SearchQuestionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serachQuery = null,
  }) {
    return _then(_$SearchQuestionImpl(
      serachQuery: null == serachQuery
          ? _value.serachQuery
          : serachQuery // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchQuestionImpl implements SearchQuestion {
  const _$SearchQuestionImpl({required this.serachQuery});

  @override
  final String serachQuery;

  @override
  String toString() {
    return 'ProfileEvent.searchQuestion(serachQuery: $serachQuery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchQuestionImpl &&
            (identical(other.serachQuery, serachQuery) ||
                other.serachQuery == serachQuery));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serachQuery);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchQuestionImplCopyWith<_$SearchQuestionImpl> get copyWith =>
      __$$SearchQuestionImplCopyWithImpl<_$SearchQuestionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool camera) pickImageScanning,
    required TResult Function(bool isLoad) getProfile,
    required TResult Function(
            UserInfoChangeRequestModel userInfoChangeRequestModel)
        editProfile,
    required TResult Function() deleteProfile,
    required TResult Function(
            UserInfoChangeRequestModel userNameChanginRequestModel)
        userInfoChange,
    required TResult Function(
            ForgottPasswordRequestModel forgottPasswordRequestModel)
        resetPasswod,
    required TResult Function(
            ReportAProblemRequestModel reportAProblemRequestModel)
        reportAProblem,
    required TResult Function(String serachQuery) getQuestions,
    required TResult Function() getQuestionEvent,
    required TResult Function(String serachQuery) searchQuestion,
  }) {
    return searchQuestion(serachQuery);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool camera)? pickImageScanning,
    TResult? Function(bool isLoad)? getProfile,
    TResult? Function(UserInfoChangeRequestModel userInfoChangeRequestModel)?
        editProfile,
    TResult? Function()? deleteProfile,
    TResult? Function(UserInfoChangeRequestModel userNameChanginRequestModel)?
        userInfoChange,
    TResult? Function(ForgottPasswordRequestModel forgottPasswordRequestModel)?
        resetPasswod,
    TResult? Function(ReportAProblemRequestModel reportAProblemRequestModel)?
        reportAProblem,
    TResult? Function(String serachQuery)? getQuestions,
    TResult? Function()? getQuestionEvent,
    TResult? Function(String serachQuery)? searchQuestion,
  }) {
    return searchQuestion?.call(serachQuery);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool camera)? pickImageScanning,
    TResult Function(bool isLoad)? getProfile,
    TResult Function(UserInfoChangeRequestModel userInfoChangeRequestModel)?
        editProfile,
    TResult Function()? deleteProfile,
    TResult Function(UserInfoChangeRequestModel userNameChanginRequestModel)?
        userInfoChange,
    TResult Function(ForgottPasswordRequestModel forgottPasswordRequestModel)?
        resetPasswod,
    TResult Function(ReportAProblemRequestModel reportAProblemRequestModel)?
        reportAProblem,
    TResult Function(String serachQuery)? getQuestions,
    TResult Function()? getQuestionEvent,
    TResult Function(String serachQuery)? searchQuestion,
    required TResult orElse(),
  }) {
    if (searchQuestion != null) {
      return searchQuestion(serachQuery);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PickImageScanning value) pickImageScanning,
    required TResult Function(GetProfile value) getProfile,
    required TResult Function(EditProfile value) editProfile,
    required TResult Function(DeleteProfile value) deleteProfile,
    required TResult Function(UserInfoChange value) userInfoChange,
    required TResult Function(ResetPasswod value) resetPasswod,
    required TResult Function(ReportAProblem value) reportAProblem,
    required TResult Function(GetQuestions value) getQuestions,
    required TResult Function(GetQuestionEvent value) getQuestionEvent,
    required TResult Function(SearchQuestion value) searchQuestion,
  }) {
    return searchQuestion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PickImageScanning value)? pickImageScanning,
    TResult? Function(GetProfile value)? getProfile,
    TResult? Function(EditProfile value)? editProfile,
    TResult? Function(DeleteProfile value)? deleteProfile,
    TResult? Function(UserInfoChange value)? userInfoChange,
    TResult? Function(ResetPasswod value)? resetPasswod,
    TResult? Function(ReportAProblem value)? reportAProblem,
    TResult? Function(GetQuestions value)? getQuestions,
    TResult? Function(GetQuestionEvent value)? getQuestionEvent,
    TResult? Function(SearchQuestion value)? searchQuestion,
  }) {
    return searchQuestion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PickImageScanning value)? pickImageScanning,
    TResult Function(GetProfile value)? getProfile,
    TResult Function(EditProfile value)? editProfile,
    TResult Function(DeleteProfile value)? deleteProfile,
    TResult Function(UserInfoChange value)? userInfoChange,
    TResult Function(ResetPasswod value)? resetPasswod,
    TResult Function(ReportAProblem value)? reportAProblem,
    TResult Function(GetQuestions value)? getQuestions,
    TResult Function(GetQuestionEvent value)? getQuestionEvent,
    TResult Function(SearchQuestion value)? searchQuestion,
    required TResult orElse(),
  }) {
    if (searchQuestion != null) {
      return searchQuestion(this);
    }
    return orElse();
  }
}

abstract class SearchQuestion implements ProfileEvent {
  const factory SearchQuestion({required final String serachQuery}) =
      _$SearchQuestionImpl;

  String get serachQuery;
  @JsonKey(ignore: true)
  _$$SearchQuestionImplCopyWith<_$SearchQuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProfileState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get questionLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  bool get profileLoading => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;
  bool get profileNameUpdated => throw _privateConstructorUsedError;
  GetUserInfoModel? get getUserInfoModel => throw _privateConstructorUsedError;
  ImageModel? get imageModel => throw _privateConstructorUsedError;
  bool? get uploaded => throw _privateConstructorUsedError;
  SuccessResponseModel? get successResponseModel =>
      throw _privateConstructorUsedError;
  UpdateUserInfoModel? get updateUserInfoModel =>
      throw _privateConstructorUsedError;
  ForegottPasswordResponceMdel? get foregottPasswordResponceMdel =>
      throw _privateConstructorUsedError;
  List<Questions>? get questionList => throw _privateConstructorUsedError;

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
      bool questionLoading,
      bool hasError,
      bool profileLoading,
      String? message,
      String? userName,
      bool profileNameUpdated,
      GetUserInfoModel? getUserInfoModel,
      ImageModel? imageModel,
      bool? uploaded,
      SuccessResponseModel? successResponseModel,
      UpdateUserInfoModel? updateUserInfoModel,
      ForegottPasswordResponceMdel? foregottPasswordResponceMdel,
      List<Questions>? questionList});
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
    Object? questionLoading = null,
    Object? hasError = null,
    Object? profileLoading = null,
    Object? message = freezed,
    Object? userName = freezed,
    Object? profileNameUpdated = null,
    Object? getUserInfoModel = freezed,
    Object? imageModel = freezed,
    Object? uploaded = freezed,
    Object? successResponseModel = freezed,
    Object? updateUserInfoModel = freezed,
    Object? foregottPasswordResponceMdel = freezed,
    Object? questionList = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      questionLoading: null == questionLoading
          ? _value.questionLoading
          : questionLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      profileLoading: null == profileLoading
          ? _value.profileLoading
          : profileLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      profileNameUpdated: null == profileNameUpdated
          ? _value.profileNameUpdated
          : profileNameUpdated // ignore: cast_nullable_to_non_nullable
              as bool,
      getUserInfoModel: freezed == getUserInfoModel
          ? _value.getUserInfoModel
          : getUserInfoModel // ignore: cast_nullable_to_non_nullable
              as GetUserInfoModel?,
      imageModel: freezed == imageModel
          ? _value.imageModel
          : imageModel // ignore: cast_nullable_to_non_nullable
              as ImageModel?,
      uploaded: freezed == uploaded
          ? _value.uploaded
          : uploaded // ignore: cast_nullable_to_non_nullable
              as bool?,
      successResponseModel: freezed == successResponseModel
          ? _value.successResponseModel
          : successResponseModel // ignore: cast_nullable_to_non_nullable
              as SuccessResponseModel?,
      updateUserInfoModel: freezed == updateUserInfoModel
          ? _value.updateUserInfoModel
          : updateUserInfoModel // ignore: cast_nullable_to_non_nullable
              as UpdateUserInfoModel?,
      foregottPasswordResponceMdel: freezed == foregottPasswordResponceMdel
          ? _value.foregottPasswordResponceMdel
          : foregottPasswordResponceMdel // ignore: cast_nullable_to_non_nullable
              as ForegottPasswordResponceMdel?,
      questionList: freezed == questionList
          ? _value.questionList
          : questionList // ignore: cast_nullable_to_non_nullable
              as List<Questions>?,
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
      bool questionLoading,
      bool hasError,
      bool profileLoading,
      String? message,
      String? userName,
      bool profileNameUpdated,
      GetUserInfoModel? getUserInfoModel,
      ImageModel? imageModel,
      bool? uploaded,
      SuccessResponseModel? successResponseModel,
      UpdateUserInfoModel? updateUserInfoModel,
      ForegottPasswordResponceMdel? foregottPasswordResponceMdel,
      List<Questions>? questionList});
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
    Object? questionLoading = null,
    Object? hasError = null,
    Object? profileLoading = null,
    Object? message = freezed,
    Object? userName = freezed,
    Object? profileNameUpdated = null,
    Object? getUserInfoModel = freezed,
    Object? imageModel = freezed,
    Object? uploaded = freezed,
    Object? successResponseModel = freezed,
    Object? updateUserInfoModel = freezed,
    Object? foregottPasswordResponceMdel = freezed,
    Object? questionList = freezed,
  }) {
    return _then(_$InitialImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      questionLoading: null == questionLoading
          ? _value.questionLoading
          : questionLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      profileLoading: null == profileLoading
          ? _value.profileLoading
          : profileLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      profileNameUpdated: null == profileNameUpdated
          ? _value.profileNameUpdated
          : profileNameUpdated // ignore: cast_nullable_to_non_nullable
              as bool,
      getUserInfoModel: freezed == getUserInfoModel
          ? _value.getUserInfoModel
          : getUserInfoModel // ignore: cast_nullable_to_non_nullable
              as GetUserInfoModel?,
      imageModel: freezed == imageModel
          ? _value.imageModel
          : imageModel // ignore: cast_nullable_to_non_nullable
              as ImageModel?,
      uploaded: freezed == uploaded
          ? _value.uploaded
          : uploaded // ignore: cast_nullable_to_non_nullable
              as bool?,
      successResponseModel: freezed == successResponseModel
          ? _value.successResponseModel
          : successResponseModel // ignore: cast_nullable_to_non_nullable
              as SuccessResponseModel?,
      updateUserInfoModel: freezed == updateUserInfoModel
          ? _value.updateUserInfoModel
          : updateUserInfoModel // ignore: cast_nullable_to_non_nullable
              as UpdateUserInfoModel?,
      foregottPasswordResponceMdel: freezed == foregottPasswordResponceMdel
          ? _value.foregottPasswordResponceMdel
          : foregottPasswordResponceMdel // ignore: cast_nullable_to_non_nullable
              as ForegottPasswordResponceMdel?,
      questionList: freezed == questionList
          ? _value._questionList
          : questionList // ignore: cast_nullable_to_non_nullable
              as List<Questions>?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.isLoading,
      required this.questionLoading,
      required this.hasError,
      required this.profileLoading,
      this.message,
      this.userName,
      required this.profileNameUpdated,
      this.getUserInfoModel,
      this.imageModel,
      this.uploaded,
      this.successResponseModel,
      this.updateUserInfoModel,
      this.foregottPasswordResponceMdel,
      final List<Questions>? questionList})
      : _questionList = questionList;

  @override
  final bool isLoading;
  @override
  final bool questionLoading;
  @override
  final bool hasError;
  @override
  final bool profileLoading;
  @override
  final String? message;
  @override
  final String? userName;
  @override
  final bool profileNameUpdated;
  @override
  final GetUserInfoModel? getUserInfoModel;
  @override
  final ImageModel? imageModel;
  @override
  final bool? uploaded;
  @override
  final SuccessResponseModel? successResponseModel;
  @override
  final UpdateUserInfoModel? updateUserInfoModel;
  @override
  final ForegottPasswordResponceMdel? foregottPasswordResponceMdel;
  final List<Questions>? _questionList;
  @override
  List<Questions>? get questionList {
    final value = _questionList;
    if (value == null) return null;
    if (_questionList is EqualUnmodifiableListView) return _questionList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProfileState(isLoading: $isLoading, questionLoading: $questionLoading, hasError: $hasError, profileLoading: $profileLoading, message: $message, userName: $userName, profileNameUpdated: $profileNameUpdated, getUserInfoModel: $getUserInfoModel, imageModel: $imageModel, uploaded: $uploaded, successResponseModel: $successResponseModel, updateUserInfoModel: $updateUserInfoModel, foregottPasswordResponceMdel: $foregottPasswordResponceMdel, questionList: $questionList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.questionLoading, questionLoading) ||
                other.questionLoading == questionLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.profileLoading, profileLoading) ||
                other.profileLoading == profileLoading) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.profileNameUpdated, profileNameUpdated) ||
                other.profileNameUpdated == profileNameUpdated) &&
            (identical(other.getUserInfoModel, getUserInfoModel) ||
                other.getUserInfoModel == getUserInfoModel) &&
            (identical(other.imageModel, imageModel) ||
                other.imageModel == imageModel) &&
            (identical(other.uploaded, uploaded) ||
                other.uploaded == uploaded) &&
            (identical(other.successResponseModel, successResponseModel) ||
                other.successResponseModel == successResponseModel) &&
            (identical(other.updateUserInfoModel, updateUserInfoModel) ||
                other.updateUserInfoModel == updateUserInfoModel) &&
            (identical(other.foregottPasswordResponceMdel,
                    foregottPasswordResponceMdel) ||
                other.foregottPasswordResponceMdel ==
                    foregottPasswordResponceMdel) &&
            const DeepCollectionEquality()
                .equals(other._questionList, _questionList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      questionLoading,
      hasError,
      profileLoading,
      message,
      userName,
      profileNameUpdated,
      getUserInfoModel,
      imageModel,
      uploaded,
      successResponseModel,
      updateUserInfoModel,
      foregottPasswordResponceMdel,
      const DeepCollectionEquality().hash(_questionList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements ProfileState {
  const factory _Initial(
      {required final bool isLoading,
      required final bool questionLoading,
      required final bool hasError,
      required final bool profileLoading,
      final String? message,
      final String? userName,
      required final bool profileNameUpdated,
      final GetUserInfoModel? getUserInfoModel,
      final ImageModel? imageModel,
      final bool? uploaded,
      final SuccessResponseModel? successResponseModel,
      final UpdateUserInfoModel? updateUserInfoModel,
      final ForegottPasswordResponceMdel? foregottPasswordResponceMdel,
      final List<Questions>? questionList}) = _$InitialImpl;

  @override
  bool get isLoading;
  @override
  bool get questionLoading;
  @override
  bool get hasError;
  @override
  bool get profileLoading;
  @override
  String? get message;
  @override
  String? get userName;
  @override
  bool get profileNameUpdated;
  @override
  GetUserInfoModel? get getUserInfoModel;
  @override
  ImageModel? get imageModel;
  @override
  bool? get uploaded;
  @override
  SuccessResponseModel? get successResponseModel;
  @override
  UpdateUserInfoModel? get updateUserInfoModel;
  @override
  ForegottPasswordResponceMdel? get foregottPasswordResponceMdel;
  @override
  List<Questions>? get questionList;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
