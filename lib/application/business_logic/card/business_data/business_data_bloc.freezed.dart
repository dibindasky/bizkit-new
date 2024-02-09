// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_data_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BusinessDataEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SocialMediaHandle socialMediaHandle)
        addSocialMedia,
    required TResult Function(int index) removeSocialMedia,
    required TResult Function(Accredition accredition) addAccredition,
    required TResult Function(int index) removeAccredition,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SocialMediaHandle socialMediaHandle)? addSocialMedia,
    TResult? Function(int index)? removeSocialMedia,
    TResult? Function(Accredition accredition)? addAccredition,
    TResult? Function(int index)? removeAccredition,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SocialMediaHandle socialMediaHandle)? addSocialMedia,
    TResult Function(int index)? removeSocialMedia,
    TResult Function(Accredition accredition)? addAccredition,
    TResult Function(int index)? removeAccredition,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddSocialMedia value) addSocialMedia,
    required TResult Function(RemoveSocialMedia value) removeSocialMedia,
    required TResult Function(AddAccredition value) addAccredition,
    required TResult Function(RemoveAccredition value) removeAccredition,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddSocialMedia value)? addSocialMedia,
    TResult? Function(RemoveSocialMedia value)? removeSocialMedia,
    TResult? Function(AddAccredition value)? addAccredition,
    TResult? Function(RemoveAccredition value)? removeAccredition,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddSocialMedia value)? addSocialMedia,
    TResult Function(RemoveSocialMedia value)? removeSocialMedia,
    TResult Function(AddAccredition value)? addAccredition,
    TResult Function(RemoveAccredition value)? removeAccredition,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessDataEventCopyWith<$Res> {
  factory $BusinessDataEventCopyWith(
          BusinessDataEvent value, $Res Function(BusinessDataEvent) then) =
      _$BusinessDataEventCopyWithImpl<$Res, BusinessDataEvent>;
}

/// @nodoc
class _$BusinessDataEventCopyWithImpl<$Res, $Val extends BusinessDataEvent>
    implements $BusinessDataEventCopyWith<$Res> {
  _$BusinessDataEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AddSocialMediaImplCopyWith<$Res> {
  factory _$$AddSocialMediaImplCopyWith(_$AddSocialMediaImpl value,
          $Res Function(_$AddSocialMediaImpl) then) =
      __$$AddSocialMediaImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SocialMediaHandle socialMediaHandle});
}

/// @nodoc
class __$$AddSocialMediaImplCopyWithImpl<$Res>
    extends _$BusinessDataEventCopyWithImpl<$Res, _$AddSocialMediaImpl>
    implements _$$AddSocialMediaImplCopyWith<$Res> {
  __$$AddSocialMediaImplCopyWithImpl(
      _$AddSocialMediaImpl _value, $Res Function(_$AddSocialMediaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? socialMediaHandle = null,
  }) {
    return _then(_$AddSocialMediaImpl(
      socialMediaHandle: null == socialMediaHandle
          ? _value.socialMediaHandle
          : socialMediaHandle // ignore: cast_nullable_to_non_nullable
              as SocialMediaHandle,
    ));
  }
}

/// @nodoc

class _$AddSocialMediaImpl implements AddSocialMedia {
  const _$AddSocialMediaImpl({required this.socialMediaHandle});

  @override
  final SocialMediaHandle socialMediaHandle;

  @override
  String toString() {
    return 'BusinessDataEvent.addSocialMedia(socialMediaHandle: $socialMediaHandle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddSocialMediaImpl &&
            (identical(other.socialMediaHandle, socialMediaHandle) ||
                other.socialMediaHandle == socialMediaHandle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, socialMediaHandle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddSocialMediaImplCopyWith<_$AddSocialMediaImpl> get copyWith =>
      __$$AddSocialMediaImplCopyWithImpl<_$AddSocialMediaImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SocialMediaHandle socialMediaHandle)
        addSocialMedia,
    required TResult Function(int index) removeSocialMedia,
    required TResult Function(Accredition accredition) addAccredition,
    required TResult Function(int index) removeAccredition,
  }) {
    return addSocialMedia(socialMediaHandle);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SocialMediaHandle socialMediaHandle)? addSocialMedia,
    TResult? Function(int index)? removeSocialMedia,
    TResult? Function(Accredition accredition)? addAccredition,
    TResult? Function(int index)? removeAccredition,
  }) {
    return addSocialMedia?.call(socialMediaHandle);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SocialMediaHandle socialMediaHandle)? addSocialMedia,
    TResult Function(int index)? removeSocialMedia,
    TResult Function(Accredition accredition)? addAccredition,
    TResult Function(int index)? removeAccredition,
    required TResult orElse(),
  }) {
    if (addSocialMedia != null) {
      return addSocialMedia(socialMediaHandle);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddSocialMedia value) addSocialMedia,
    required TResult Function(RemoveSocialMedia value) removeSocialMedia,
    required TResult Function(AddAccredition value) addAccredition,
    required TResult Function(RemoveAccredition value) removeAccredition,
  }) {
    return addSocialMedia(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddSocialMedia value)? addSocialMedia,
    TResult? Function(RemoveSocialMedia value)? removeSocialMedia,
    TResult? Function(AddAccredition value)? addAccredition,
    TResult? Function(RemoveAccredition value)? removeAccredition,
  }) {
    return addSocialMedia?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddSocialMedia value)? addSocialMedia,
    TResult Function(RemoveSocialMedia value)? removeSocialMedia,
    TResult Function(AddAccredition value)? addAccredition,
    TResult Function(RemoveAccredition value)? removeAccredition,
    required TResult orElse(),
  }) {
    if (addSocialMedia != null) {
      return addSocialMedia(this);
    }
    return orElse();
  }
}

abstract class AddSocialMedia implements BusinessDataEvent {
  const factory AddSocialMedia(
          {required final SocialMediaHandle socialMediaHandle}) =
      _$AddSocialMediaImpl;

  SocialMediaHandle get socialMediaHandle;
  @JsonKey(ignore: true)
  _$$AddSocialMediaImplCopyWith<_$AddSocialMediaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveSocialMediaImplCopyWith<$Res> {
  factory _$$RemoveSocialMediaImplCopyWith(_$RemoveSocialMediaImpl value,
          $Res Function(_$RemoveSocialMediaImpl) then) =
      __$$RemoveSocialMediaImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$RemoveSocialMediaImplCopyWithImpl<$Res>
    extends _$BusinessDataEventCopyWithImpl<$Res, _$RemoveSocialMediaImpl>
    implements _$$RemoveSocialMediaImplCopyWith<$Res> {
  __$$RemoveSocialMediaImplCopyWithImpl(_$RemoveSocialMediaImpl _value,
      $Res Function(_$RemoveSocialMediaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$RemoveSocialMediaImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RemoveSocialMediaImpl implements RemoveSocialMedia {
  const _$RemoveSocialMediaImpl({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'BusinessDataEvent.removeSocialMedia(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveSocialMediaImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveSocialMediaImplCopyWith<_$RemoveSocialMediaImpl> get copyWith =>
      __$$RemoveSocialMediaImplCopyWithImpl<_$RemoveSocialMediaImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SocialMediaHandle socialMediaHandle)
        addSocialMedia,
    required TResult Function(int index) removeSocialMedia,
    required TResult Function(Accredition accredition) addAccredition,
    required TResult Function(int index) removeAccredition,
  }) {
    return removeSocialMedia(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SocialMediaHandle socialMediaHandle)? addSocialMedia,
    TResult? Function(int index)? removeSocialMedia,
    TResult? Function(Accredition accredition)? addAccredition,
    TResult? Function(int index)? removeAccredition,
  }) {
    return removeSocialMedia?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SocialMediaHandle socialMediaHandle)? addSocialMedia,
    TResult Function(int index)? removeSocialMedia,
    TResult Function(Accredition accredition)? addAccredition,
    TResult Function(int index)? removeAccredition,
    required TResult orElse(),
  }) {
    if (removeSocialMedia != null) {
      return removeSocialMedia(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddSocialMedia value) addSocialMedia,
    required TResult Function(RemoveSocialMedia value) removeSocialMedia,
    required TResult Function(AddAccredition value) addAccredition,
    required TResult Function(RemoveAccredition value) removeAccredition,
  }) {
    return removeSocialMedia(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddSocialMedia value)? addSocialMedia,
    TResult? Function(RemoveSocialMedia value)? removeSocialMedia,
    TResult? Function(AddAccredition value)? addAccredition,
    TResult? Function(RemoveAccredition value)? removeAccredition,
  }) {
    return removeSocialMedia?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddSocialMedia value)? addSocialMedia,
    TResult Function(RemoveSocialMedia value)? removeSocialMedia,
    TResult Function(AddAccredition value)? addAccredition,
    TResult Function(RemoveAccredition value)? removeAccredition,
    required TResult orElse(),
  }) {
    if (removeSocialMedia != null) {
      return removeSocialMedia(this);
    }
    return orElse();
  }
}

abstract class RemoveSocialMedia implements BusinessDataEvent {
  const factory RemoveSocialMedia({required final int index}) =
      _$RemoveSocialMediaImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$RemoveSocialMediaImplCopyWith<_$RemoveSocialMediaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddAccreditionImplCopyWith<$Res> {
  factory _$$AddAccreditionImplCopyWith(_$AddAccreditionImpl value,
          $Res Function(_$AddAccreditionImpl) then) =
      __$$AddAccreditionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Accredition accredition});
}

/// @nodoc
class __$$AddAccreditionImplCopyWithImpl<$Res>
    extends _$BusinessDataEventCopyWithImpl<$Res, _$AddAccreditionImpl>
    implements _$$AddAccreditionImplCopyWith<$Res> {
  __$$AddAccreditionImplCopyWithImpl(
      _$AddAccreditionImpl _value, $Res Function(_$AddAccreditionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accredition = null,
  }) {
    return _then(_$AddAccreditionImpl(
      accredition: null == accredition
          ? _value.accredition
          : accredition // ignore: cast_nullable_to_non_nullable
              as Accredition,
    ));
  }
}

/// @nodoc

class _$AddAccreditionImpl implements AddAccredition {
  const _$AddAccreditionImpl({required this.accredition});

  @override
  final Accredition accredition;

  @override
  String toString() {
    return 'BusinessDataEvent.addAccredition(accredition: $accredition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddAccreditionImpl &&
            (identical(other.accredition, accredition) ||
                other.accredition == accredition));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accredition);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddAccreditionImplCopyWith<_$AddAccreditionImpl> get copyWith =>
      __$$AddAccreditionImplCopyWithImpl<_$AddAccreditionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SocialMediaHandle socialMediaHandle)
        addSocialMedia,
    required TResult Function(int index) removeSocialMedia,
    required TResult Function(Accredition accredition) addAccredition,
    required TResult Function(int index) removeAccredition,
  }) {
    return addAccredition(accredition);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SocialMediaHandle socialMediaHandle)? addSocialMedia,
    TResult? Function(int index)? removeSocialMedia,
    TResult? Function(Accredition accredition)? addAccredition,
    TResult? Function(int index)? removeAccredition,
  }) {
    return addAccredition?.call(accredition);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SocialMediaHandle socialMediaHandle)? addSocialMedia,
    TResult Function(int index)? removeSocialMedia,
    TResult Function(Accredition accredition)? addAccredition,
    TResult Function(int index)? removeAccredition,
    required TResult orElse(),
  }) {
    if (addAccredition != null) {
      return addAccredition(accredition);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddSocialMedia value) addSocialMedia,
    required TResult Function(RemoveSocialMedia value) removeSocialMedia,
    required TResult Function(AddAccredition value) addAccredition,
    required TResult Function(RemoveAccredition value) removeAccredition,
  }) {
    return addAccredition(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddSocialMedia value)? addSocialMedia,
    TResult? Function(RemoveSocialMedia value)? removeSocialMedia,
    TResult? Function(AddAccredition value)? addAccredition,
    TResult? Function(RemoveAccredition value)? removeAccredition,
  }) {
    return addAccredition?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddSocialMedia value)? addSocialMedia,
    TResult Function(RemoveSocialMedia value)? removeSocialMedia,
    TResult Function(AddAccredition value)? addAccredition,
    TResult Function(RemoveAccredition value)? removeAccredition,
    required TResult orElse(),
  }) {
    if (addAccredition != null) {
      return addAccredition(this);
    }
    return orElse();
  }
}

abstract class AddAccredition implements BusinessDataEvent {
  const factory AddAccredition({required final Accredition accredition}) =
      _$AddAccreditionImpl;

  Accredition get accredition;
  @JsonKey(ignore: true)
  _$$AddAccreditionImplCopyWith<_$AddAccreditionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveAccreditionImplCopyWith<$Res> {
  factory _$$RemoveAccreditionImplCopyWith(_$RemoveAccreditionImpl value,
          $Res Function(_$RemoveAccreditionImpl) then) =
      __$$RemoveAccreditionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$RemoveAccreditionImplCopyWithImpl<$Res>
    extends _$BusinessDataEventCopyWithImpl<$Res, _$RemoveAccreditionImpl>
    implements _$$RemoveAccreditionImplCopyWith<$Res> {
  __$$RemoveAccreditionImplCopyWithImpl(_$RemoveAccreditionImpl _value,
      $Res Function(_$RemoveAccreditionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$RemoveAccreditionImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RemoveAccreditionImpl implements RemoveAccredition {
  const _$RemoveAccreditionImpl({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'BusinessDataEvent.removeAccredition(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveAccreditionImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveAccreditionImplCopyWith<_$RemoveAccreditionImpl> get copyWith =>
      __$$RemoveAccreditionImplCopyWithImpl<_$RemoveAccreditionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SocialMediaHandle socialMediaHandle)
        addSocialMedia,
    required TResult Function(int index) removeSocialMedia,
    required TResult Function(Accredition accredition) addAccredition,
    required TResult Function(int index) removeAccredition,
  }) {
    return removeAccredition(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SocialMediaHandle socialMediaHandle)? addSocialMedia,
    TResult? Function(int index)? removeSocialMedia,
    TResult? Function(Accredition accredition)? addAccredition,
    TResult? Function(int index)? removeAccredition,
  }) {
    return removeAccredition?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SocialMediaHandle socialMediaHandle)? addSocialMedia,
    TResult Function(int index)? removeSocialMedia,
    TResult Function(Accredition accredition)? addAccredition,
    TResult Function(int index)? removeAccredition,
    required TResult orElse(),
  }) {
    if (removeAccredition != null) {
      return removeAccredition(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddSocialMedia value) addSocialMedia,
    required TResult Function(RemoveSocialMedia value) removeSocialMedia,
    required TResult Function(AddAccredition value) addAccredition,
    required TResult Function(RemoveAccredition value) removeAccredition,
  }) {
    return removeAccredition(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddSocialMedia value)? addSocialMedia,
    TResult? Function(RemoveSocialMedia value)? removeSocialMedia,
    TResult? Function(AddAccredition value)? addAccredition,
    TResult? Function(RemoveAccredition value)? removeAccredition,
  }) {
    return removeAccredition?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddSocialMedia value)? addSocialMedia,
    TResult Function(RemoveSocialMedia value)? removeSocialMedia,
    TResult Function(AddAccredition value)? addAccredition,
    TResult Function(RemoveAccredition value)? removeAccredition,
    required TResult orElse(),
  }) {
    if (removeAccredition != null) {
      return removeAccredition(this);
    }
    return orElse();
  }
}

abstract class RemoveAccredition implements BusinessDataEvent {
  const factory RemoveAccredition({required final int index}) =
      _$RemoveAccreditionImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$RemoveAccreditionImplCopyWith<_$RemoveAccreditionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BusinessDataState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  List<SocialMediaHandle> get socialMedias =>
      throw _privateConstructorUsedError;
  List<Accredition> get accreditions => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BusinessDataStateCopyWith<BusinessDataState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessDataStateCopyWith<$Res> {
  factory $BusinessDataStateCopyWith(
          BusinessDataState value, $Res Function(BusinessDataState) then) =
      _$BusinessDataStateCopyWithImpl<$Res, BusinessDataState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      List<SocialMediaHandle> socialMedias,
      List<Accredition> accreditions,
      String? message});
}

/// @nodoc
class _$BusinessDataStateCopyWithImpl<$Res, $Val extends BusinessDataState>
    implements $BusinessDataStateCopyWith<$Res> {
  _$BusinessDataStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? socialMedias = null,
    Object? accreditions = null,
    Object? message = freezed,
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
      socialMedias: null == socialMedias
          ? _value.socialMedias
          : socialMedias // ignore: cast_nullable_to_non_nullable
              as List<SocialMediaHandle>,
      accreditions: null == accreditions
          ? _value.accreditions
          : accreditions // ignore: cast_nullable_to_non_nullable
              as List<Accredition>,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $BusinessDataStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      List<SocialMediaHandle> socialMedias,
      List<Accredition> accreditions,
      String? message});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$BusinessDataStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? socialMedias = null,
    Object? accreditions = null,
    Object? message = freezed,
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
      socialMedias: null == socialMedias
          ? _value._socialMedias
          : socialMedias // ignore: cast_nullable_to_non_nullable
              as List<SocialMediaHandle>,
      accreditions: null == accreditions
          ? _value._accreditions
          : accreditions // ignore: cast_nullable_to_non_nullable
              as List<Accredition>,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.isLoading,
      required this.hasError,
      required final List<SocialMediaHandle> socialMedias,
      required final List<Accredition> accreditions,
      this.message})
      : _socialMedias = socialMedias,
        _accreditions = accreditions;

  @override
  final bool isLoading;
  @override
  final bool hasError;
  final List<SocialMediaHandle> _socialMedias;
  @override
  List<SocialMediaHandle> get socialMedias {
    if (_socialMedias is EqualUnmodifiableListView) return _socialMedias;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_socialMedias);
  }

  final List<Accredition> _accreditions;
  @override
  List<Accredition> get accreditions {
    if (_accreditions is EqualUnmodifiableListView) return _accreditions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accreditions);
  }

  @override
  final String? message;

  @override
  String toString() {
    return 'BusinessDataState(isLoading: $isLoading, hasError: $hasError, socialMedias: $socialMedias, accreditions: $accreditions, message: $message)';
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
            const DeepCollectionEquality()
                .equals(other._socialMedias, _socialMedias) &&
            const DeepCollectionEquality()
                .equals(other._accreditions, _accreditions) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      hasError,
      const DeepCollectionEquality().hash(_socialMedias),
      const DeepCollectionEquality().hash(_accreditions),
      message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements BusinessDataState {
  const factory _Initial(
      {required final bool isLoading,
      required final bool hasError,
      required final List<SocialMediaHandle> socialMedias,
      required final List<Accredition> accreditions,
      final String? message}) = _$InitialImpl;

  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  List<SocialMediaHandle> get socialMedias;
  @override
  List<Accredition> get accreditions;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
