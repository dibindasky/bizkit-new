// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_second_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CardSecondEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getAllCardsSecond,
    required TResult Function() updateCardSecond,
    required TResult Function() getCardSecondEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getAllCardsSecond,
    TResult? Function()? updateCardSecond,
    TResult? Function()? getCardSecondEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getAllCardsSecond,
    TResult Function()? updateCardSecond,
    TResult Function()? getCardSecondEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetAllCardsSecond value) getAllCardsSecond,
    required TResult Function(UpdateCardSecond value) updateCardSecond,
    required TResult Function(GetCardSecondEvent value) getCardSecondEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetAllCardsSecond value)? getAllCardsSecond,
    TResult? Function(UpdateCardSecond value)? updateCardSecond,
    TResult? Function(GetCardSecondEvent value)? getCardSecondEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetAllCardsSecond value)? getAllCardsSecond,
    TResult Function(UpdateCardSecond value)? updateCardSecond,
    TResult Function(GetCardSecondEvent value)? getCardSecondEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardSecondEventCopyWith<$Res> {
  factory $CardSecondEventCopyWith(
          CardSecondEvent value, $Res Function(CardSecondEvent) then) =
      _$CardSecondEventCopyWithImpl<$Res, CardSecondEvent>;
}

/// @nodoc
class _$CardSecondEventCopyWithImpl<$Res, $Val extends CardSecondEvent>
    implements $CardSecondEventCopyWith<$Res> {
  _$CardSecondEventCopyWithImpl(this._value, this._then);

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
    extends _$CardSecondEventCopyWithImpl<$Res, _$StartedImpl>
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
    return 'CardSecondEvent.started()';
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
    required TResult Function() getAllCardsSecond,
    required TResult Function() updateCardSecond,
    required TResult Function() getCardSecondEvent,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getAllCardsSecond,
    TResult? Function()? updateCardSecond,
    TResult? Function()? getCardSecondEvent,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getAllCardsSecond,
    TResult Function()? updateCardSecond,
    TResult Function()? getCardSecondEvent,
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
    required TResult Function(GetAllCardsSecond value) getAllCardsSecond,
    required TResult Function(UpdateCardSecond value) updateCardSecond,
    required TResult Function(GetCardSecondEvent value) getCardSecondEvent,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetAllCardsSecond value)? getAllCardsSecond,
    TResult? Function(UpdateCardSecond value)? updateCardSecond,
    TResult? Function(GetCardSecondEvent value)? getCardSecondEvent,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetAllCardsSecond value)? getAllCardsSecond,
    TResult Function(UpdateCardSecond value)? updateCardSecond,
    TResult Function(GetCardSecondEvent value)? getCardSecondEvent,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements CardSecondEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetAllCardsSecondImplCopyWith<$Res> {
  factory _$$GetAllCardsSecondImplCopyWith(_$GetAllCardsSecondImpl value,
          $Res Function(_$GetAllCardsSecondImpl) then) =
      __$$GetAllCardsSecondImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAllCardsSecondImplCopyWithImpl<$Res>
    extends _$CardSecondEventCopyWithImpl<$Res, _$GetAllCardsSecondImpl>
    implements _$$GetAllCardsSecondImplCopyWith<$Res> {
  __$$GetAllCardsSecondImplCopyWithImpl(_$GetAllCardsSecondImpl _value,
      $Res Function(_$GetAllCardsSecondImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetAllCardsSecondImpl implements GetAllCardsSecond {
  const _$GetAllCardsSecondImpl();

  @override
  String toString() {
    return 'CardSecondEvent.getAllCardsSecond()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetAllCardsSecondImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getAllCardsSecond,
    required TResult Function() updateCardSecond,
    required TResult Function() getCardSecondEvent,
  }) {
    return getAllCardsSecond();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getAllCardsSecond,
    TResult? Function()? updateCardSecond,
    TResult? Function()? getCardSecondEvent,
  }) {
    return getAllCardsSecond?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getAllCardsSecond,
    TResult Function()? updateCardSecond,
    TResult Function()? getCardSecondEvent,
    required TResult orElse(),
  }) {
    if (getAllCardsSecond != null) {
      return getAllCardsSecond();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetAllCardsSecond value) getAllCardsSecond,
    required TResult Function(UpdateCardSecond value) updateCardSecond,
    required TResult Function(GetCardSecondEvent value) getCardSecondEvent,
  }) {
    return getAllCardsSecond(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetAllCardsSecond value)? getAllCardsSecond,
    TResult? Function(UpdateCardSecond value)? updateCardSecond,
    TResult? Function(GetCardSecondEvent value)? getCardSecondEvent,
  }) {
    return getAllCardsSecond?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetAllCardsSecond value)? getAllCardsSecond,
    TResult Function(UpdateCardSecond value)? updateCardSecond,
    TResult Function(GetCardSecondEvent value)? getCardSecondEvent,
    required TResult orElse(),
  }) {
    if (getAllCardsSecond != null) {
      return getAllCardsSecond(this);
    }
    return orElse();
  }
}

abstract class GetAllCardsSecond implements CardSecondEvent {
  const factory GetAllCardsSecond() = _$GetAllCardsSecondImpl;
}

/// @nodoc
abstract class _$$UpdateCardSecondImplCopyWith<$Res> {
  factory _$$UpdateCardSecondImplCopyWith(_$UpdateCardSecondImpl value,
          $Res Function(_$UpdateCardSecondImpl) then) =
      __$$UpdateCardSecondImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateCardSecondImplCopyWithImpl<$Res>
    extends _$CardSecondEventCopyWithImpl<$Res, _$UpdateCardSecondImpl>
    implements _$$UpdateCardSecondImplCopyWith<$Res> {
  __$$UpdateCardSecondImplCopyWithImpl(_$UpdateCardSecondImpl _value,
      $Res Function(_$UpdateCardSecondImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UpdateCardSecondImpl implements UpdateCardSecond {
  const _$UpdateCardSecondImpl();

  @override
  String toString() {
    return 'CardSecondEvent.updateCardSecond()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UpdateCardSecondImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getAllCardsSecond,
    required TResult Function() updateCardSecond,
    required TResult Function() getCardSecondEvent,
  }) {
    return updateCardSecond();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getAllCardsSecond,
    TResult? Function()? updateCardSecond,
    TResult? Function()? getCardSecondEvent,
  }) {
    return updateCardSecond?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getAllCardsSecond,
    TResult Function()? updateCardSecond,
    TResult Function()? getCardSecondEvent,
    required TResult orElse(),
  }) {
    if (updateCardSecond != null) {
      return updateCardSecond();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetAllCardsSecond value) getAllCardsSecond,
    required TResult Function(UpdateCardSecond value) updateCardSecond,
    required TResult Function(GetCardSecondEvent value) getCardSecondEvent,
  }) {
    return updateCardSecond(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetAllCardsSecond value)? getAllCardsSecond,
    TResult? Function(UpdateCardSecond value)? updateCardSecond,
    TResult? Function(GetCardSecondEvent value)? getCardSecondEvent,
  }) {
    return updateCardSecond?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetAllCardsSecond value)? getAllCardsSecond,
    TResult Function(UpdateCardSecond value)? updateCardSecond,
    TResult Function(GetCardSecondEvent value)? getCardSecondEvent,
    required TResult orElse(),
  }) {
    if (updateCardSecond != null) {
      return updateCardSecond(this);
    }
    return orElse();
  }
}

abstract class UpdateCardSecond implements CardSecondEvent {
  const factory UpdateCardSecond() = _$UpdateCardSecondImpl;
}

/// @nodoc
abstract class _$$GetCardSecondEventImplCopyWith<$Res> {
  factory _$$GetCardSecondEventImplCopyWith(_$GetCardSecondEventImpl value,
          $Res Function(_$GetCardSecondEventImpl) then) =
      __$$GetCardSecondEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetCardSecondEventImplCopyWithImpl<$Res>
    extends _$CardSecondEventCopyWithImpl<$Res, _$GetCardSecondEventImpl>
    implements _$$GetCardSecondEventImplCopyWith<$Res> {
  __$$GetCardSecondEventImplCopyWithImpl(_$GetCardSecondEventImpl _value,
      $Res Function(_$GetCardSecondEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetCardSecondEventImpl implements GetCardSecondEvent {
  const _$GetCardSecondEventImpl();

  @override
  String toString() {
    return 'CardSecondEvent.getCardSecondEvent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetCardSecondEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getAllCardsSecond,
    required TResult Function() updateCardSecond,
    required TResult Function() getCardSecondEvent,
  }) {
    return getCardSecondEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getAllCardsSecond,
    TResult? Function()? updateCardSecond,
    TResult? Function()? getCardSecondEvent,
  }) {
    return getCardSecondEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getAllCardsSecond,
    TResult Function()? updateCardSecond,
    TResult Function()? getCardSecondEvent,
    required TResult orElse(),
  }) {
    if (getCardSecondEvent != null) {
      return getCardSecondEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetAllCardsSecond value) getAllCardsSecond,
    required TResult Function(UpdateCardSecond value) updateCardSecond,
    required TResult Function(GetCardSecondEvent value) getCardSecondEvent,
  }) {
    return getCardSecondEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetAllCardsSecond value)? getAllCardsSecond,
    TResult? Function(UpdateCardSecond value)? updateCardSecond,
    TResult? Function(GetCardSecondEvent value)? getCardSecondEvent,
  }) {
    return getCardSecondEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetAllCardsSecond value)? getAllCardsSecond,
    TResult Function(UpdateCardSecond value)? updateCardSecond,
    TResult Function(GetCardSecondEvent value)? getCardSecondEvent,
    required TResult orElse(),
  }) {
    if (getCardSecondEvent != null) {
      return getCardSecondEvent(this);
    }
    return orElse();
  }
}

abstract class GetCardSecondEvent implements CardSecondEvent {
  const factory GetCardSecondEvent() = _$GetCardSecondEventImpl;
}

/// @nodoc
mixin _$CardSecondState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isPageLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<SecondCard>? get secondCards => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CardSecondStateCopyWith<CardSecondState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardSecondStateCopyWith<$Res> {
  factory $CardSecondStateCopyWith(
          CardSecondState value, $Res Function(CardSecondState) then) =
      _$CardSecondStateCopyWithImpl<$Res, CardSecondState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isPageLoading,
      bool hasError,
      String? message,
      List<SecondCard>? secondCards});
}

/// @nodoc
class _$CardSecondStateCopyWithImpl<$Res, $Val extends CardSecondState>
    implements $CardSecondStateCopyWith<$Res> {
  _$CardSecondStateCopyWithImpl(this._value, this._then);

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
    Object? secondCards = freezed,
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
      secondCards: freezed == secondCards
          ? _value.secondCards
          : secondCards // ignore: cast_nullable_to_non_nullable
              as List<SecondCard>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $CardSecondStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isPageLoading,
      bool hasError,
      String? message,
      List<SecondCard>? secondCards});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CardSecondStateCopyWithImpl<$Res, _$InitialImpl>
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
    Object? secondCards = freezed,
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
      secondCards: freezed == secondCards
          ? _value._secondCards
          : secondCards // ignore: cast_nullable_to_non_nullable
              as List<SecondCard>?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.isLoading,
      required this.isPageLoading,
      required this.hasError,
      this.message,
      final List<SecondCard>? secondCards})
      : _secondCards = secondCards;

  @override
  final bool isLoading;
  @override
  final bool isPageLoading;
  @override
  final bool hasError;
  @override
  final String? message;
  final List<SecondCard>? _secondCards;
  @override
  List<SecondCard>? get secondCards {
    final value = _secondCards;
    if (value == null) return null;
    if (_secondCards is EqualUnmodifiableListView) return _secondCards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CardSecondState(isLoading: $isLoading, isPageLoading: $isPageLoading, hasError: $hasError, message: $message, secondCards: $secondCards)';
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
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._secondCards, _secondCards));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isPageLoading,
      hasError, message, const DeepCollectionEquality().hash(_secondCards));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements CardSecondState {
  const factory _Initial(
      {required final bool isLoading,
      required final bool isPageLoading,
      required final bool hasError,
      final String? message,
      final List<SecondCard>? secondCards}) = _$InitialImpl;

  @override
  bool get isLoading;
  @override
  bool get isPageLoading;
  @override
  bool get hasError;
  @override
  String? get message;
  @override
  List<SecondCard>? get secondCards;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
