// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_screation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CardScreationEvent {
  bool get camera => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool camera) pickImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool camera)? pickImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool camera)? pickImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PickImage value) pickImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PickImage value)? pickImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PickImage value)? pickImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CardScreationEventCopyWith<CardScreationEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardScreationEventCopyWith<$Res> {
  factory $CardScreationEventCopyWith(
          CardScreationEvent value, $Res Function(CardScreationEvent) then) =
      _$CardScreationEventCopyWithImpl<$Res, CardScreationEvent>;
  @useResult
  $Res call({bool camera});
}

/// @nodoc
class _$CardScreationEventCopyWithImpl<$Res, $Val extends CardScreationEvent>
    implements $CardScreationEventCopyWith<$Res> {
  _$CardScreationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? camera = null,
  }) {
    return _then(_value.copyWith(
      camera: null == camera
          ? _value.camera
          : camera // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PickImageImplCopyWith<$Res>
    implements $CardScreationEventCopyWith<$Res> {
  factory _$$PickImageImplCopyWith(
          _$PickImageImpl value, $Res Function(_$PickImageImpl) then) =
      __$$PickImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool camera});
}

/// @nodoc
class __$$PickImageImplCopyWithImpl<$Res>
    extends _$CardScreationEventCopyWithImpl<$Res, _$PickImageImpl>
    implements _$$PickImageImplCopyWith<$Res> {
  __$$PickImageImplCopyWithImpl(
      _$PickImageImpl _value, $Res Function(_$PickImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? camera = null,
  }) {
    return _then(_$PickImageImpl(
      camera: null == camera
          ? _value.camera
          : camera // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PickImageImpl implements _PickImage {
  _$PickImageImpl({required this.camera});

  @override
  final bool camera;

  @override
  String toString() {
    return 'CardScreationEvent.pickImage(camera: $camera)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PickImageImpl &&
            (identical(other.camera, camera) || other.camera == camera));
  }

  @override
  int get hashCode => Object.hash(runtimeType, camera);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PickImageImplCopyWith<_$PickImageImpl> get copyWith =>
      __$$PickImageImplCopyWithImpl<_$PickImageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool camera) pickImage,
  }) {
    return pickImage(camera);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool camera)? pickImage,
  }) {
    return pickImage?.call(camera);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool camera)? pickImage,
    required TResult orElse(),
  }) {
    if (pickImage != null) {
      return pickImage(camera);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PickImage value) pickImage,
  }) {
    return pickImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PickImage value)? pickImage,
  }) {
    return pickImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PickImage value)? pickImage,
    required TResult orElse(),
  }) {
    if (pickImage != null) {
      return pickImage(this);
    }
    return orElse();
  }
}

abstract class _PickImage implements CardScreationEvent {
  factory _PickImage({required final bool camera}) = _$PickImageImpl;

  @override
  bool get camera;
  @override
  @JsonKey(ignore: true)
  _$$PickImageImplCopyWith<_$PickImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CardScreationState {
  List<File>? get scanimages => throw _privateConstructorUsedError;
  String? get mesasge => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CardScreationStateCopyWith<CardScreationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardScreationStateCopyWith<$Res> {
  factory $CardScreationStateCopyWith(
          CardScreationState value, $Res Function(CardScreationState) then) =
      _$CardScreationStateCopyWithImpl<$Res, CardScreationState>;
  @useResult
  $Res call({List<File>? scanimages, String? mesasge});
}

/// @nodoc
class _$CardScreationStateCopyWithImpl<$Res, $Val extends CardScreationState>
    implements $CardScreationStateCopyWith<$Res> {
  _$CardScreationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scanimages = freezed,
    Object? mesasge = freezed,
  }) {
    return _then(_value.copyWith(
      scanimages: freezed == scanimages
          ? _value.scanimages
          : scanimages // ignore: cast_nullable_to_non_nullable
              as List<File>?,
      mesasge: freezed == mesasge
          ? _value.mesasge
          : mesasge // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $CardScreationStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<File>? scanimages, String? mesasge});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CardScreationStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scanimages = freezed,
    Object? mesasge = freezed,
  }) {
    return _then(_$InitialImpl(
      scanimages: freezed == scanimages
          ? _value._scanimages
          : scanimages // ignore: cast_nullable_to_non_nullable
              as List<File>?,
      mesasge: freezed == mesasge
          ? _value.mesasge
          : mesasge // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl({final List<File>? scanimages, this.mesasge})
      : _scanimages = scanimages;

  final List<File>? _scanimages;
  @override
  List<File>? get scanimages {
    final value = _scanimages;
    if (value == null) return null;
    if (_scanimages is EqualUnmodifiableListView) return _scanimages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? mesasge;

  @override
  String toString() {
    return 'CardScreationState(scanimages: $scanimages, mesasge: $mesasge)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality()
                .equals(other._scanimages, _scanimages) &&
            (identical(other.mesasge, mesasge) || other.mesasge == mesasge));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_scanimages), mesasge);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements CardScreationState {
  const factory _Initial(
      {final List<File>? scanimages, final String? mesasge}) = _$InitialImpl;

  @override
  List<File>? get scanimages;
  @override
  String? get mesasge;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
