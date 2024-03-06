// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReminderEvent {
  CreateReminderModel get createReminderModel =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CreateReminderModel createReminderModel)
        createReminder,
    required TResult Function(CreateReminderModel createReminderModel)
        editReminder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CreateReminderModel createReminderModel)? createReminder,
    TResult? Function(CreateReminderModel createReminderModel)? editReminder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CreateReminderModel createReminderModel)? createReminder,
    TResult Function(CreateReminderModel createReminderModel)? editReminder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateReminder value) createReminder,
    required TResult Function(EditReminder value) editReminder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateReminder value)? createReminder,
    TResult? Function(EditReminder value)? editReminder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateReminder value)? createReminder,
    TResult Function(EditReminder value)? editReminder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReminderEventCopyWith<ReminderEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderEventCopyWith<$Res> {
  factory $ReminderEventCopyWith(
          ReminderEvent value, $Res Function(ReminderEvent) then) =
      _$ReminderEventCopyWithImpl<$Res, ReminderEvent>;
  @useResult
  $Res call({CreateReminderModel createReminderModel});
}

/// @nodoc
class _$ReminderEventCopyWithImpl<$Res, $Val extends ReminderEvent>
    implements $ReminderEventCopyWith<$Res> {
  _$ReminderEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createReminderModel = null,
  }) {
    return _then(_value.copyWith(
      createReminderModel: null == createReminderModel
          ? _value.createReminderModel
          : createReminderModel // ignore: cast_nullable_to_non_nullable
              as CreateReminderModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateReminderImplCopyWith<$Res>
    implements $ReminderEventCopyWith<$Res> {
  factory _$$CreateReminderImplCopyWith(_$CreateReminderImpl value,
          $Res Function(_$CreateReminderImpl) then) =
      __$$CreateReminderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CreateReminderModel createReminderModel});
}

/// @nodoc
class __$$CreateReminderImplCopyWithImpl<$Res>
    extends _$ReminderEventCopyWithImpl<$Res, _$CreateReminderImpl>
    implements _$$CreateReminderImplCopyWith<$Res> {
  __$$CreateReminderImplCopyWithImpl(
      _$CreateReminderImpl _value, $Res Function(_$CreateReminderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createReminderModel = null,
  }) {
    return _then(_$CreateReminderImpl(
      createReminderModel: null == createReminderModel
          ? _value.createReminderModel
          : createReminderModel // ignore: cast_nullable_to_non_nullable
              as CreateReminderModel,
    ));
  }
}

/// @nodoc

class _$CreateReminderImpl implements CreateReminder {
  const _$CreateReminderImpl({required this.createReminderModel});

  @override
  final CreateReminderModel createReminderModel;

  @override
  String toString() {
    return 'ReminderEvent.createReminder(createReminderModel: $createReminderModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateReminderImpl &&
            (identical(other.createReminderModel, createReminderModel) ||
                other.createReminderModel == createReminderModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, createReminderModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateReminderImplCopyWith<_$CreateReminderImpl> get copyWith =>
      __$$CreateReminderImplCopyWithImpl<_$CreateReminderImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CreateReminderModel createReminderModel)
        createReminder,
    required TResult Function(CreateReminderModel createReminderModel)
        editReminder,
  }) {
    return createReminder(createReminderModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CreateReminderModel createReminderModel)? createReminder,
    TResult? Function(CreateReminderModel createReminderModel)? editReminder,
  }) {
    return createReminder?.call(createReminderModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CreateReminderModel createReminderModel)? createReminder,
    TResult Function(CreateReminderModel createReminderModel)? editReminder,
    required TResult orElse(),
  }) {
    if (createReminder != null) {
      return createReminder(createReminderModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateReminder value) createReminder,
    required TResult Function(EditReminder value) editReminder,
  }) {
    return createReminder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateReminder value)? createReminder,
    TResult? Function(EditReminder value)? editReminder,
  }) {
    return createReminder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateReminder value)? createReminder,
    TResult Function(EditReminder value)? editReminder,
    required TResult orElse(),
  }) {
    if (createReminder != null) {
      return createReminder(this);
    }
    return orElse();
  }
}

abstract class CreateReminder implements ReminderEvent {
  const factory CreateReminder(
          {required final CreateReminderModel createReminderModel}) =
      _$CreateReminderImpl;

  @override
  CreateReminderModel get createReminderModel;
  @override
  @JsonKey(ignore: true)
  _$$CreateReminderImplCopyWith<_$CreateReminderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditReminderImplCopyWith<$Res>
    implements $ReminderEventCopyWith<$Res> {
  factory _$$EditReminderImplCopyWith(
          _$EditReminderImpl value, $Res Function(_$EditReminderImpl) then) =
      __$$EditReminderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CreateReminderModel createReminderModel});
}

/// @nodoc
class __$$EditReminderImplCopyWithImpl<$Res>
    extends _$ReminderEventCopyWithImpl<$Res, _$EditReminderImpl>
    implements _$$EditReminderImplCopyWith<$Res> {
  __$$EditReminderImplCopyWithImpl(
      _$EditReminderImpl _value, $Res Function(_$EditReminderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createReminderModel = null,
  }) {
    return _then(_$EditReminderImpl(
      createReminderModel: null == createReminderModel
          ? _value.createReminderModel
          : createReminderModel // ignore: cast_nullable_to_non_nullable
              as CreateReminderModel,
    ));
  }
}

/// @nodoc

class _$EditReminderImpl implements EditReminder {
  const _$EditReminderImpl({required this.createReminderModel});

  @override
  final CreateReminderModel createReminderModel;

  @override
  String toString() {
    return 'ReminderEvent.editReminder(createReminderModel: $createReminderModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditReminderImpl &&
            (identical(other.createReminderModel, createReminderModel) ||
                other.createReminderModel == createReminderModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, createReminderModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditReminderImplCopyWith<_$EditReminderImpl> get copyWith =>
      __$$EditReminderImplCopyWithImpl<_$EditReminderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CreateReminderModel createReminderModel)
        createReminder,
    required TResult Function(CreateReminderModel createReminderModel)
        editReminder,
  }) {
    return editReminder(createReminderModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CreateReminderModel createReminderModel)? createReminder,
    TResult? Function(CreateReminderModel createReminderModel)? editReminder,
  }) {
    return editReminder?.call(createReminderModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CreateReminderModel createReminderModel)? createReminder,
    TResult Function(CreateReminderModel createReminderModel)? editReminder,
    required TResult orElse(),
  }) {
    if (editReminder != null) {
      return editReminder(createReminderModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateReminder value) createReminder,
    required TResult Function(EditReminder value) editReminder,
  }) {
    return editReminder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateReminder value)? createReminder,
    TResult? Function(EditReminder value)? editReminder,
  }) {
    return editReminder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateReminder value)? createReminder,
    TResult Function(EditReminder value)? editReminder,
    required TResult orElse(),
  }) {
    if (editReminder != null) {
      return editReminder(this);
    }
    return orElse();
  }
}

abstract class EditReminder implements ReminderEvent {
  const factory EditReminder(
          {required final CreateReminderModel createReminderModel}) =
      _$EditReminderImpl;

  @override
  CreateReminderModel get createReminderModel;
  @override
  @JsonKey(ignore: true)
  _$$EditReminderImplCopyWith<_$EditReminderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReminderState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isPageLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReminderStateCopyWith<ReminderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderStateCopyWith<$Res> {
  factory $ReminderStateCopyWith(
          ReminderState value, $Res Function(ReminderState) then) =
      _$ReminderStateCopyWithImpl<$Res, ReminderState>;
  @useResult
  $Res call(
      {bool isLoading, bool isPageLoading, bool hasError, String? message});
}

/// @nodoc
class _$ReminderStateCopyWithImpl<$Res, $Val extends ReminderState>
    implements $ReminderStateCopyWith<$Res> {
  _$ReminderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isPageLoading = null,
    Object? hasError = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isPageLoading: null == isPageLoading
          ? _value.isPageLoading
          : isPageLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $ReminderStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading, bool isPageLoading, bool hasError, String? message});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ReminderStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isPageLoading = null,
    Object? hasError = null,
    Object? message = freezed,
  }) {
    return _then(_$InitialImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isPageLoading: null == isPageLoading
          ? _value.isPageLoading
          : isPageLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
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
      required this.isPageLoading,
      required this.hasError,
      this.message});

  @override
  final bool isLoading;
  @override
  final bool isPageLoading;
  @override
  final bool hasError;
  @override
  final String? message;

  @override
  String toString() {
    return 'ReminderState(isLoading: $isLoading, isPageLoading: $isPageLoading, hasError: $hasError, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isPageLoading, isPageLoading) ||
                other.isPageLoading == isPageLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, isPageLoading, hasError, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements ReminderState {
  const factory _Initial(
      {required final bool isLoading,
      required final bool isPageLoading,
      required final bool hasError,
      final String? message}) = _$InitialImpl;

  @override
  bool get isLoading;
  @override
  bool get isPageLoading;
  @override
  bool get hasError;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
