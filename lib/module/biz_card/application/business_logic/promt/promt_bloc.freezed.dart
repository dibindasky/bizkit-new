// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promt_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PromtEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkPrompt,
    required TResult Function() closePrompt,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkPrompt,
    TResult? Function()? closePrompt,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkPrompt,
    TResult Function()? closePrompt,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckPrompt value) checkPrompt,
    required TResult Function(ClosePrompt value) closePrompt,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckPrompt value)? checkPrompt,
    TResult? Function(ClosePrompt value)? closePrompt,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckPrompt value)? checkPrompt,
    TResult Function(ClosePrompt value)? closePrompt,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromtEventCopyWith<$Res> {
  factory $PromtEventCopyWith(
          PromtEvent value, $Res Function(PromtEvent) then) =
      _$PromtEventCopyWithImpl<$Res, PromtEvent>;
}

/// @nodoc
class _$PromtEventCopyWithImpl<$Res, $Val extends PromtEvent>
    implements $PromtEventCopyWith<$Res> {
  _$PromtEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CheckPromptImplCopyWith<$Res> {
  factory _$$CheckPromptImplCopyWith(
          _$CheckPromptImpl value, $Res Function(_$CheckPromptImpl) then) =
      __$$CheckPromptImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckPromptImplCopyWithImpl<$Res>
    extends _$PromtEventCopyWithImpl<$Res, _$CheckPromptImpl>
    implements _$$CheckPromptImplCopyWith<$Res> {
  __$$CheckPromptImplCopyWithImpl(
      _$CheckPromptImpl _value, $Res Function(_$CheckPromptImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CheckPromptImpl implements CheckPrompt {
  const _$CheckPromptImpl();

  @override
  String toString() {
    return 'PromtEvent.checkPrompt()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckPromptImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkPrompt,
    required TResult Function() closePrompt,
  }) {
    return checkPrompt();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkPrompt,
    TResult? Function()? closePrompt,
  }) {
    return checkPrompt?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkPrompt,
    TResult Function()? closePrompt,
    required TResult orElse(),
  }) {
    if (checkPrompt != null) {
      return checkPrompt();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckPrompt value) checkPrompt,
    required TResult Function(ClosePrompt value) closePrompt,
  }) {
    return checkPrompt(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckPrompt value)? checkPrompt,
    TResult? Function(ClosePrompt value)? closePrompt,
  }) {
    return checkPrompt?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckPrompt value)? checkPrompt,
    TResult Function(ClosePrompt value)? closePrompt,
    required TResult orElse(),
  }) {
    if (checkPrompt != null) {
      return checkPrompt(this);
    }
    return orElse();
  }
}

abstract class CheckPrompt implements PromtEvent {
  const factory CheckPrompt() = _$CheckPromptImpl;
}

/// @nodoc
abstract class _$$ClosePromptImplCopyWith<$Res> {
  factory _$$ClosePromptImplCopyWith(
          _$ClosePromptImpl value, $Res Function(_$ClosePromptImpl) then) =
      __$$ClosePromptImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClosePromptImplCopyWithImpl<$Res>
    extends _$PromtEventCopyWithImpl<$Res, _$ClosePromptImpl>
    implements _$$ClosePromptImplCopyWith<$Res> {
  __$$ClosePromptImplCopyWithImpl(
      _$ClosePromptImpl _value, $Res Function(_$ClosePromptImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClosePromptImpl implements ClosePrompt {
  const _$ClosePromptImpl();

  @override
  String toString() {
    return 'PromtEvent.closePrompt()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClosePromptImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkPrompt,
    required TResult Function() closePrompt,
  }) {
    return closePrompt();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkPrompt,
    TResult? Function()? closePrompt,
  }) {
    return closePrompt?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkPrompt,
    TResult Function()? closePrompt,
    required TResult orElse(),
  }) {
    if (closePrompt != null) {
      return closePrompt();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckPrompt value) checkPrompt,
    required TResult Function(ClosePrompt value) closePrompt,
  }) {
    return closePrompt(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckPrompt value)? checkPrompt,
    TResult? Function(ClosePrompt value)? closePrompt,
  }) {
    return closePrompt?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckPrompt value)? checkPrompt,
    TResult Function(ClosePrompt value)? closePrompt,
    required TResult orElse(),
  }) {
    if (closePrompt != null) {
      return closePrompt(this);
    }
    return orElse();
  }
}

abstract class ClosePrompt implements PromtEvent {
  const factory ClosePrompt() = _$ClosePromptImpl;
}

/// @nodoc
mixin _$PromtState {
  bool get show => throw _privateConstructorUsedError;
  bool get hasCard => throw _privateConstructorUsedError;
  bool get hasReminder => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PromtStateCopyWith<PromtState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromtStateCopyWith<$Res> {
  factory $PromtStateCopyWith(
          PromtState value, $Res Function(PromtState) then) =
      _$PromtStateCopyWithImpl<$Res, PromtState>;
  @useResult
  $Res call({bool show, bool hasCard, bool hasReminder, String? message});
}

/// @nodoc
class _$PromtStateCopyWithImpl<$Res, $Val extends PromtState>
    implements $PromtStateCopyWith<$Res> {
  _$PromtStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? show = null,
    Object? hasCard = null,
    Object? hasReminder = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      show: null == show
          ? _value.show
          : show // ignore: cast_nullable_to_non_nullable
              as bool,
      hasCard: null == hasCard
          ? _value.hasCard
          : hasCard // ignore: cast_nullable_to_non_nullable
              as bool,
      hasReminder: null == hasReminder
          ? _value.hasReminder
          : hasReminder // ignore: cast_nullable_to_non_nullable
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
    implements $PromtStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool show, bool hasCard, bool hasReminder, String? message});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PromtStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? show = null,
    Object? hasCard = null,
    Object? hasReminder = null,
    Object? message = freezed,
  }) {
    return _then(_$InitialImpl(
      show: null == show
          ? _value.show
          : show // ignore: cast_nullable_to_non_nullable
              as bool,
      hasCard: null == hasCard
          ? _value.hasCard
          : hasCard // ignore: cast_nullable_to_non_nullable
              as bool,
      hasReminder: null == hasReminder
          ? _value.hasReminder
          : hasReminder // ignore: cast_nullable_to_non_nullable
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
      {required this.show,
      required this.hasCard,
      required this.hasReminder,
      this.message});

  @override
  final bool show;
  @override
  final bool hasCard;
  @override
  final bool hasReminder;
  @override
  final String? message;

  @override
  String toString() {
    return 'PromtState(show: $show, hasCard: $hasCard, hasReminder: $hasReminder, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.show, show) || other.show == show) &&
            (identical(other.hasCard, hasCard) || other.hasCard == hasCard) &&
            (identical(other.hasReminder, hasReminder) ||
                other.hasReminder == hasReminder) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, show, hasCard, hasReminder, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements PromtState {
  const factory _Initial(
      {required final bool show,
      required final bool hasCard,
      required final bool hasReminder,
      final String? message}) = _$InitialImpl;

  @override
  bool get show;
  @override
  bool get hasCard;
  @override
  bool get hasReminder;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
