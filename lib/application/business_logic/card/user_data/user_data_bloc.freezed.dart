// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_data_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserDataEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool camera) pickImage,
    required TResult Function(int index) removeImage,
    required TResult Function(List<ImageModel> images) processImage,
    required TResult Function() getUserDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool camera)? pickImage,
    TResult? Function(int index)? removeImage,
    TResult? Function(List<ImageModel> images)? processImage,
    TResult? Function()? getUserDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool camera)? pickImage,
    TResult Function(int index)? removeImage,
    TResult Function(List<ImageModel> images)? processImage,
    TResult Function()? getUserDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PickImage value) pickImage,
    required TResult Function(RemoveImage value) removeImage,
    required TResult Function(ProcessImage value) processImage,
    required TResult Function(GetUserDetail value) getUserDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PickImage value)? pickImage,
    TResult? Function(RemoveImage value)? removeImage,
    TResult? Function(ProcessImage value)? processImage,
    TResult? Function(GetUserDetail value)? getUserDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PickImage value)? pickImage,
    TResult Function(RemoveImage value)? removeImage,
    TResult Function(ProcessImage value)? processImage,
    TResult Function(GetUserDetail value)? getUserDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataEventCopyWith<$Res> {
  factory $UserDataEventCopyWith(
          UserDataEvent value, $Res Function(UserDataEvent) then) =
      _$UserDataEventCopyWithImpl<$Res, UserDataEvent>;
}

/// @nodoc
class _$UserDataEventCopyWithImpl<$Res, $Val extends UserDataEvent>
    implements $UserDataEventCopyWith<$Res> {
  _$UserDataEventCopyWithImpl(this._value, this._then);

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
    extends _$UserDataEventCopyWithImpl<$Res, _$PickImageImpl>
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

class _$PickImageImpl implements PickImage {
  _$PickImageImpl({required this.camera});

  @override
  final bool camera;

  @override
  String toString() {
    return 'UserDataEvent.pickImage(camera: $camera)';
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
    required TResult Function(int index) removeImage,
    required TResult Function(List<ImageModel> images) processImage,
    required TResult Function() getUserDetail,
  }) {
    return pickImage(camera);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool camera)? pickImage,
    TResult? Function(int index)? removeImage,
    TResult? Function(List<ImageModel> images)? processImage,
    TResult? Function()? getUserDetail,
  }) {
    return pickImage?.call(camera);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool camera)? pickImage,
    TResult Function(int index)? removeImage,
    TResult Function(List<ImageModel> images)? processImage,
    TResult Function()? getUserDetail,
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
    required TResult Function(PickImage value) pickImage,
    required TResult Function(RemoveImage value) removeImage,
    required TResult Function(ProcessImage value) processImage,
    required TResult Function(GetUserDetail value) getUserDetail,
  }) {
    return pickImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PickImage value)? pickImage,
    TResult? Function(RemoveImage value)? removeImage,
    TResult? Function(ProcessImage value)? processImage,
    TResult? Function(GetUserDetail value)? getUserDetail,
  }) {
    return pickImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PickImage value)? pickImage,
    TResult Function(RemoveImage value)? removeImage,
    TResult Function(ProcessImage value)? processImage,
    TResult Function(GetUserDetail value)? getUserDetail,
    required TResult orElse(),
  }) {
    if (pickImage != null) {
      return pickImage(this);
    }
    return orElse();
  }
}

abstract class PickImage implements UserDataEvent {
  factory PickImage({required final bool camera}) = _$PickImageImpl;

  bool get camera;
  @JsonKey(ignore: true)
  _$$PickImageImplCopyWith<_$PickImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveImageImplCopyWith<$Res> {
  factory _$$RemoveImageImplCopyWith(
          _$RemoveImageImpl value, $Res Function(_$RemoveImageImpl) then) =
      __$$RemoveImageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$RemoveImageImplCopyWithImpl<$Res>
    extends _$UserDataEventCopyWithImpl<$Res, _$RemoveImageImpl>
    implements _$$RemoveImageImplCopyWith<$Res> {
  __$$RemoveImageImplCopyWithImpl(
      _$RemoveImageImpl _value, $Res Function(_$RemoveImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$RemoveImageImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RemoveImageImpl implements RemoveImage {
  _$RemoveImageImpl({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'UserDataEvent.removeImage(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveImageImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveImageImplCopyWith<_$RemoveImageImpl> get copyWith =>
      __$$RemoveImageImplCopyWithImpl<_$RemoveImageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool camera) pickImage,
    required TResult Function(int index) removeImage,
    required TResult Function(List<ImageModel> images) processImage,
    required TResult Function() getUserDetail,
  }) {
    return removeImage(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool camera)? pickImage,
    TResult? Function(int index)? removeImage,
    TResult? Function(List<ImageModel> images)? processImage,
    TResult? Function()? getUserDetail,
  }) {
    return removeImage?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool camera)? pickImage,
    TResult Function(int index)? removeImage,
    TResult Function(List<ImageModel> images)? processImage,
    TResult Function()? getUserDetail,
    required TResult orElse(),
  }) {
    if (removeImage != null) {
      return removeImage(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PickImage value) pickImage,
    required TResult Function(RemoveImage value) removeImage,
    required TResult Function(ProcessImage value) processImage,
    required TResult Function(GetUserDetail value) getUserDetail,
  }) {
    return removeImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PickImage value)? pickImage,
    TResult? Function(RemoveImage value)? removeImage,
    TResult? Function(ProcessImage value)? processImage,
    TResult? Function(GetUserDetail value)? getUserDetail,
  }) {
    return removeImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PickImage value)? pickImage,
    TResult Function(RemoveImage value)? removeImage,
    TResult Function(ProcessImage value)? processImage,
    TResult Function(GetUserDetail value)? getUserDetail,
    required TResult orElse(),
  }) {
    if (removeImage != null) {
      return removeImage(this);
    }
    return orElse();
  }
}

abstract class RemoveImage implements UserDataEvent {
  factory RemoveImage({required final int index}) = _$RemoveImageImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$RemoveImageImplCopyWith<_$RemoveImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProcessImageImplCopyWith<$Res> {
  factory _$$ProcessImageImplCopyWith(
          _$ProcessImageImpl value, $Res Function(_$ProcessImageImpl) then) =
      __$$ProcessImageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ImageModel> images});
}

/// @nodoc
class __$$ProcessImageImplCopyWithImpl<$Res>
    extends _$UserDataEventCopyWithImpl<$Res, _$ProcessImageImpl>
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
              as List<ImageModel>,
    ));
  }
}

/// @nodoc

class _$ProcessImageImpl implements ProcessImage {
  _$ProcessImageImpl({required final List<ImageModel> images})
      : _images = images;

  final List<ImageModel> _images;
  @override
  List<ImageModel> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'UserDataEvent.processImage(images: $images)';
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
    required TResult Function(int index) removeImage,
    required TResult Function(List<ImageModel> images) processImage,
    required TResult Function() getUserDetail,
  }) {
    return processImage(images);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool camera)? pickImage,
    TResult? Function(int index)? removeImage,
    TResult? Function(List<ImageModel> images)? processImage,
    TResult? Function()? getUserDetail,
  }) {
    return processImage?.call(images);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool camera)? pickImage,
    TResult Function(int index)? removeImage,
    TResult Function(List<ImageModel> images)? processImage,
    TResult Function()? getUserDetail,
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
    required TResult Function(PickImage value) pickImage,
    required TResult Function(RemoveImage value) removeImage,
    required TResult Function(ProcessImage value) processImage,
    required TResult Function(GetUserDetail value) getUserDetail,
  }) {
    return processImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PickImage value)? pickImage,
    TResult? Function(RemoveImage value)? removeImage,
    TResult? Function(ProcessImage value)? processImage,
    TResult? Function(GetUserDetail value)? getUserDetail,
  }) {
    return processImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PickImage value)? pickImage,
    TResult Function(RemoveImage value)? removeImage,
    TResult Function(ProcessImage value)? processImage,
    TResult Function(GetUserDetail value)? getUserDetail,
    required TResult orElse(),
  }) {
    if (processImage != null) {
      return processImage(this);
    }
    return orElse();
  }
}

abstract class ProcessImage implements UserDataEvent {
  factory ProcessImage({required final List<ImageModel> images}) =
      _$ProcessImageImpl;

  List<ImageModel> get images;
  @JsonKey(ignore: true)
  _$$ProcessImageImplCopyWith<_$ProcessImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetUserDetailImplCopyWith<$Res> {
  factory _$$GetUserDetailImplCopyWith(
          _$GetUserDetailImpl value, $Res Function(_$GetUserDetailImpl) then) =
      __$$GetUserDetailImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetUserDetailImplCopyWithImpl<$Res>
    extends _$UserDataEventCopyWithImpl<$Res, _$GetUserDetailImpl>
    implements _$$GetUserDetailImplCopyWith<$Res> {
  __$$GetUserDetailImplCopyWithImpl(
      _$GetUserDetailImpl _value, $Res Function(_$GetUserDetailImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetUserDetailImpl implements GetUserDetail {
  _$GetUserDetailImpl();

  @override
  String toString() {
    return 'UserDataEvent.getUserDetail()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetUserDetailImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool camera) pickImage,
    required TResult Function(int index) removeImage,
    required TResult Function(List<ImageModel> images) processImage,
    required TResult Function() getUserDetail,
  }) {
    return getUserDetail();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool camera)? pickImage,
    TResult? Function(int index)? removeImage,
    TResult? Function(List<ImageModel> images)? processImage,
    TResult? Function()? getUserDetail,
  }) {
    return getUserDetail?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool camera)? pickImage,
    TResult Function(int index)? removeImage,
    TResult Function(List<ImageModel> images)? processImage,
    TResult Function()? getUserDetail,
    required TResult orElse(),
  }) {
    if (getUserDetail != null) {
      return getUserDetail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PickImage value) pickImage,
    required TResult Function(RemoveImage value) removeImage,
    required TResult Function(ProcessImage value) processImage,
    required TResult Function(GetUserDetail value) getUserDetail,
  }) {
    return getUserDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PickImage value)? pickImage,
    TResult? Function(RemoveImage value)? removeImage,
    TResult? Function(ProcessImage value)? processImage,
    TResult? Function(GetUserDetail value)? getUserDetail,
  }) {
    return getUserDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PickImage value)? pickImage,
    TResult Function(RemoveImage value)? removeImage,
    TResult Function(ProcessImage value)? processImage,
    TResult Function(GetUserDetail value)? getUserDetail,
    required TResult orElse(),
  }) {
    if (getUserDetail != null) {
      return getUserDetail(this);
    }
    return orElse();
  }
}

abstract class GetUserDetail implements UserDataEvent {
  factory GetUserDetail() = _$GetUserDetailImpl;
}

/// @nodoc
mixin _$UserDataState {
  bool get hasError => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<ImageModel> get scannedImagesCardCreation =>
      throw _privateConstructorUsedError;
  ScannedImageDatasModel? get scannedImageDatasModel =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserDataStateCopyWith<UserDataState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataStateCopyWith<$Res> {
  factory $UserDataStateCopyWith(
          UserDataState value, $Res Function(UserDataState) then) =
      _$UserDataStateCopyWithImpl<$Res, UserDataState>;
  @useResult
  $Res call(
      {bool hasError,
      bool isLoading,
      String? message,
      List<ImageModel> scannedImagesCardCreation,
      ScannedImageDatasModel? scannedImageDatasModel});
}

/// @nodoc
class _$UserDataStateCopyWithImpl<$Res, $Val extends UserDataState>
    implements $UserDataStateCopyWith<$Res> {
  _$UserDataStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasError = null,
    Object? isLoading = null,
    Object? message = freezed,
    Object? scannedImagesCardCreation = null,
    Object? scannedImageDatasModel = freezed,
  }) {
    return _then(_value.copyWith(
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      scannedImagesCardCreation: null == scannedImagesCardCreation
          ? _value.scannedImagesCardCreation
          : scannedImagesCardCreation // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>,
      scannedImageDatasModel: freezed == scannedImageDatasModel
          ? _value.scannedImageDatasModel
          : scannedImageDatasModel // ignore: cast_nullable_to_non_nullable
              as ScannedImageDatasModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $UserDataStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool hasError,
      bool isLoading,
      String? message,
      List<ImageModel> scannedImagesCardCreation,
      ScannedImageDatasModel? scannedImageDatasModel});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$UserDataStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasError = null,
    Object? isLoading = null,
    Object? message = freezed,
    Object? scannedImagesCardCreation = null,
    Object? scannedImageDatasModel = freezed,
  }) {
    return _then(_$InitialImpl(
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      scannedImagesCardCreation: null == scannedImagesCardCreation
          ? _value._scannedImagesCardCreation
          : scannedImagesCardCreation // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>,
      scannedImageDatasModel: freezed == scannedImageDatasModel
          ? _value.scannedImageDatasModel
          : scannedImageDatasModel // ignore: cast_nullable_to_non_nullable
              as ScannedImageDatasModel?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.hasError,
      required this.isLoading,
      this.message,
      required final List<ImageModel> scannedImagesCardCreation,
      this.scannedImageDatasModel})
      : _scannedImagesCardCreation = scannedImagesCardCreation;

  @override
  final bool hasError;
  @override
  final bool isLoading;
  @override
  final String? message;
  final List<ImageModel> _scannedImagesCardCreation;
  @override
  List<ImageModel> get scannedImagesCardCreation {
    if (_scannedImagesCardCreation is EqualUnmodifiableListView)
      return _scannedImagesCardCreation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scannedImagesCardCreation);
  }

  @override
  final ScannedImageDatasModel? scannedImageDatasModel;

  @override
  String toString() {
    return 'UserDataState(hasError: $hasError, isLoading: $isLoading, message: $message, scannedImagesCardCreation: $scannedImagesCardCreation, scannedImageDatasModel: $scannedImageDatasModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(
                other._scannedImagesCardCreation, _scannedImagesCardCreation) &&
            (identical(other.scannedImageDatasModel, scannedImageDatasModel) ||
                other.scannedImageDatasModel == scannedImageDatasModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      hasError,
      isLoading,
      message,
      const DeepCollectionEquality().hash(_scannedImagesCardCreation),
      scannedImageDatasModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements UserDataState {
  const factory _Initial(
      {required final bool hasError,
      required final bool isLoading,
      final String? message,
      required final List<ImageModel> scannedImagesCardCreation,
      final ScannedImageDatasModel? scannedImageDatasModel}) = _$InitialImpl;

  @override
  bool get hasError;
  @override
  bool get isLoading;
  @override
  String? get message;
  @override
  List<ImageModel> get scannedImagesCardCreation;
  @override
  ScannedImageDatasModel? get scannedImageDatasModel;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
