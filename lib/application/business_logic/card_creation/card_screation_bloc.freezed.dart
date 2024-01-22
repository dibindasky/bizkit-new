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
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool camera) pickImage,
    required TResult Function(List<File> images) processImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool camera)? pickImage,
    TResult? Function(List<File> images)? processImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool camera)? pickImage,
    TResult Function(List<File> images)? processImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_ProcessImage value) processImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_ProcessImage value)? processImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_ProcessImage value)? processImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardScreationEventCopyWith<$Res> {
  factory $CardScreationEventCopyWith(
          CardScreationEvent value, $Res Function(CardScreationEvent) then) =
      _$CardScreationEventCopyWithImpl<$Res, CardScreationEvent>;
}

/// @nodoc
class _$CardScreationEventCopyWithImpl<$Res, $Val extends CardScreationEvent>
    implements $CardScreationEventCopyWith<$Res> {
  _$CardScreationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PickImageImplCopyWith<$Res> {
  factory _$$PickImageImplCopyWith(
          _$PickImageImpl value, $Res Function(_$PickImageImpl) then) =
      __$$PickImageImplCopyWithImpl<$Res>;
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
    required TResult Function(List<File> images) processImage,
  }) {
    return pickImage(camera);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool camera)? pickImage,
    TResult? Function(List<File> images)? processImage,
  }) {
    return pickImage?.call(camera);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool camera)? pickImage,
    TResult Function(List<File> images)? processImage,
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
    required TResult Function(_ProcessImage value) processImage,
  }) {
    return pickImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_ProcessImage value)? processImage,
  }) {
    return pickImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_ProcessImage value)? processImage,
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

  bool get camera;
  @JsonKey(ignore: true)
  _$$PickImageImplCopyWith<_$PickImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProcessImageImplCopyWith<$Res> {
  factory _$$ProcessImageImplCopyWith(
          _$ProcessImageImpl value, $Res Function(_$ProcessImageImpl) then) =
      __$$ProcessImageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<File> images});
}

/// @nodoc
class __$$ProcessImageImplCopyWithImpl<$Res>
    extends _$CardScreationEventCopyWithImpl<$Res, _$ProcessImageImpl>
    implements _$$ProcessImageImplCopyWith<$Res> {
  __$$ProcessImageImplCopyWithImpl(
      _$ProcessImageImpl _value, $Res Function(_$ProcessImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = null,
  }) {
    return _then(_$ProcessImageImpl(
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<File>,
    ));
  }
}

/// @nodoc

class _$ProcessImageImpl implements _ProcessImage {
  _$ProcessImageImpl({required final List<File> images}) : _images = images;

  final List<File> _images;
  @override
  List<File> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'CardScreationEvent.processImage(images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessImageImpl &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessImageImplCopyWith<_$ProcessImageImpl> get copyWith =>
      __$$ProcessImageImplCopyWithImpl<_$ProcessImageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool camera) pickImage,
    required TResult Function(List<File> images) processImage,
  }) {
    return processImage(images);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool camera)? pickImage,
    TResult? Function(List<File> images)? processImage,
  }) {
    return processImage?.call(images);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool camera)? pickImage,
    TResult Function(List<File> images)? processImage,
    required TResult orElse(),
  }) {
    if (processImage != null) {
      return processImage(images);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_ProcessImage value) processImage,
  }) {
    return processImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_ProcessImage value)? processImage,
  }) {
    return processImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_ProcessImage value)? processImage,
    required TResult orElse(),
  }) {
    if (processImage != null) {
      return processImage(this);
    }
    return orElse();
  }
}

abstract class _ProcessImage implements CardScreationEvent {
  factory _ProcessImage({required final List<File> images}) =
      _$ProcessImageImpl;

  List<File> get images;
  @JsonKey(ignore: true)
  _$$ProcessImageImplCopyWith<_$ProcessImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CardScreationState {
  List<File>? get scanimages => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;
  String? get mesasge => throw _privateConstructorUsedError;
  ScannedImageDatasModel? get convertedText =>
      throw _privateConstructorUsedError;

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
  $Res call(
      {List<File>? scanimages,
      bool isLoading,
      bool hasError,
      bool? success,
      String? mesasge,
      ScannedImageDatasModel? convertedText});
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
    Object? isLoading = null,
    Object? hasError = null,
    Object? success = freezed,
    Object? mesasge = freezed,
    Object? convertedText = freezed,
  }) {
    return _then(_value.copyWith(
      scanimages: freezed == scanimages
          ? _value.scanimages
          : scanimages // ignore: cast_nullable_to_non_nullable
              as List<File>?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      mesasge: freezed == mesasge
          ? _value.mesasge
          : mesasge // ignore: cast_nullable_to_non_nullable
              as String?,
      convertedText: freezed == convertedText
          ? _value.convertedText
          : convertedText // ignore: cast_nullable_to_non_nullable
              as ScannedImageDatasModel?,
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
  $Res call(
      {List<File>? scanimages,
      bool isLoading,
      bool hasError,
      bool? success,
      String? mesasge,
      ScannedImageDatasModel? convertedText});
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
    Object? isLoading = null,
    Object? hasError = null,
    Object? success = freezed,
    Object? mesasge = freezed,
    Object? convertedText = freezed,
  }) {
    return _then(_$InitialImpl(
      scanimages: freezed == scanimages
          ? _value._scanimages
          : scanimages // ignore: cast_nullable_to_non_nullable
              as List<File>?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      mesasge: freezed == mesasge
          ? _value.mesasge
          : mesasge // ignore: cast_nullable_to_non_nullable
              as String?,
      convertedText: freezed == convertedText
          ? _value.convertedText
          : convertedText // ignore: cast_nullable_to_non_nullable
              as ScannedImageDatasModel?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {final List<File>? scanimages,
      required this.isLoading,
      required this.hasError,
      this.success,
      this.mesasge,
      this.convertedText})
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
  final bool isLoading;
  @override
  final bool hasError;
  @override
  final bool? success;
  @override
  final String? mesasge;
  @override
  final ScannedImageDatasModel? convertedText;

  @override
  String toString() {
    return 'CardScreationState(scanimages: $scanimages, isLoading: $isLoading, hasError: $hasError, success: $success, mesasge: $mesasge, convertedText: $convertedText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality()
                .equals(other._scanimages, _scanimages) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.mesasge, mesasge) || other.mesasge == mesasge) &&
            (identical(other.convertedText, convertedText) ||
                other.convertedText == convertedText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_scanimages),
      isLoading,
      hasError,
      success,
      mesasge,
      convertedText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements CardScreationState {
  const factory _Initial(
      {final List<File>? scanimages,
      required final bool isLoading,
      required final bool hasError,
      final bool? success,
      final String? mesasge,
      final ScannedImageDatasModel? convertedText}) = _$InitialImpl;

  @override
  List<File>? get scanimages;
  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  bool? get success;
  @override
  String? get mesasge;
  @override
  ScannedImageDatasModel? get convertedText;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
