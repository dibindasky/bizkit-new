// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotificationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoad) getNotification,
    required TResult Function() getNotificationEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoad)? getNotification,
    TResult? Function()? getNotificationEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoad)? getNotification,
    TResult Function()? getNotificationEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetNotification value) getNotification,
    required TResult Function(GetNotificationEvent value) getNotificationEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetNotification value)? getNotification,
    TResult? Function(GetNotificationEvent value)? getNotificationEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetNotification value)? getNotification,
    TResult Function(GetNotificationEvent value)? getNotificationEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationEventCopyWith<$Res> {
  factory $NotificationEventCopyWith(
          NotificationEvent value, $Res Function(NotificationEvent) then) =
      _$NotificationEventCopyWithImpl<$Res, NotificationEvent>;
}

/// @nodoc
class _$NotificationEventCopyWithImpl<$Res, $Val extends NotificationEvent>
    implements $NotificationEventCopyWith<$Res> {
  _$NotificationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetNotificationImplCopyWith<$Res> {
  factory _$$GetNotificationImplCopyWith(_$GetNotificationImpl value,
          $Res Function(_$GetNotificationImpl) then) =
      __$$GetNotificationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isLoad});
}

/// @nodoc
class __$$GetNotificationImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$GetNotificationImpl>
    implements _$$GetNotificationImplCopyWith<$Res> {
  __$$GetNotificationImplCopyWithImpl(
      _$GetNotificationImpl _value, $Res Function(_$GetNotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoad = null,
  }) {
    return _then(_$GetNotificationImpl(
      isLoad: null == isLoad
          ? _value.isLoad
          : isLoad // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GetNotificationImpl implements GetNotification {
  const _$GetNotificationImpl({required this.isLoad});

  @override
  final bool isLoad;

  @override
  String toString() {
    return 'NotificationEvent.getNotification(isLoad: $isLoad)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetNotificationImpl &&
            (identical(other.isLoad, isLoad) || other.isLoad == isLoad));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoad);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetNotificationImplCopyWith<_$GetNotificationImpl> get copyWith =>
      __$$GetNotificationImplCopyWithImpl<_$GetNotificationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoad) getNotification,
    required TResult Function() getNotificationEvent,
  }) {
    return getNotification(isLoad);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoad)? getNotification,
    TResult? Function()? getNotificationEvent,
  }) {
    return getNotification?.call(isLoad);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoad)? getNotification,
    TResult Function()? getNotificationEvent,
    required TResult orElse(),
  }) {
    if (getNotification != null) {
      return getNotification(isLoad);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetNotification value) getNotification,
    required TResult Function(GetNotificationEvent value) getNotificationEvent,
  }) {
    return getNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetNotification value)? getNotification,
    TResult? Function(GetNotificationEvent value)? getNotificationEvent,
  }) {
    return getNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetNotification value)? getNotification,
    TResult Function(GetNotificationEvent value)? getNotificationEvent,
    required TResult orElse(),
  }) {
    if (getNotification != null) {
      return getNotification(this);
    }
    return orElse();
  }
}

abstract class GetNotification implements NotificationEvent {
  const factory GetNotification({required final bool isLoad}) =
      _$GetNotificationImpl;

  bool get isLoad;
  @JsonKey(ignore: true)
  _$$GetNotificationImplCopyWith<_$GetNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetNotificationEventImplCopyWith<$Res> {
  factory _$$GetNotificationEventImplCopyWith(_$GetNotificationEventImpl value,
          $Res Function(_$GetNotificationEventImpl) then) =
      __$$GetNotificationEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetNotificationEventImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$GetNotificationEventImpl>
    implements _$$GetNotificationEventImplCopyWith<$Res> {
  __$$GetNotificationEventImplCopyWithImpl(_$GetNotificationEventImpl _value,
      $Res Function(_$GetNotificationEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetNotificationEventImpl implements GetNotificationEvent {
  const _$GetNotificationEventImpl();

  @override
  String toString() {
    return 'NotificationEvent.getNotificationEvent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetNotificationEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoad) getNotification,
    required TResult Function() getNotificationEvent,
  }) {
    return getNotificationEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoad)? getNotification,
    TResult? Function()? getNotificationEvent,
  }) {
    return getNotificationEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoad)? getNotification,
    TResult Function()? getNotificationEvent,
    required TResult orElse(),
  }) {
    if (getNotificationEvent != null) {
      return getNotificationEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetNotification value) getNotification,
    required TResult Function(GetNotificationEvent value) getNotificationEvent,
  }) {
    return getNotificationEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetNotification value)? getNotification,
    TResult? Function(GetNotificationEvent value)? getNotificationEvent,
  }) {
    return getNotificationEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetNotification value)? getNotification,
    TResult Function(GetNotificationEvent value)? getNotificationEvent,
    required TResult orElse(),
  }) {
    if (getNotificationEvent != null) {
      return getNotificationEvent(this);
    }
    return orElse();
  }
}

abstract class GetNotificationEvent implements NotificationEvent {
  const factory GetNotificationEvent() = _$GetNotificationEventImpl;
}

/// @nodoc
mixin _$NotificationState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  bool get notificationLoading => throw _privateConstructorUsedError;
  List<Notification>? get notification => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationStateCopyWith<NotificationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationStateCopyWith<$Res> {
  factory $NotificationStateCopyWith(
          NotificationState value, $Res Function(NotificationState) then) =
      _$NotificationStateCopyWithImpl<$Res, NotificationState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      String? message,
      bool notificationLoading,
      List<Notification>? notification});
}

/// @nodoc
class _$NotificationStateCopyWithImpl<$Res, $Val extends NotificationState>
    implements $NotificationStateCopyWith<$Res> {
  _$NotificationStateCopyWithImpl(this._value, this._then);

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
    Object? notificationLoading = null,
    Object? notification = freezed,
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
      notificationLoading: null == notificationLoading
          ? _value.notificationLoading
          : notificationLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      notification: freezed == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as List<Notification>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $NotificationStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      String? message,
      bool notificationLoading,
      List<Notification>? notification});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$InitialImpl>
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
    Object? notificationLoading = null,
    Object? notification = freezed,
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
      notificationLoading: null == notificationLoading
          ? _value.notificationLoading
          : notificationLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      notification: freezed == notification
          ? _value._notification
          : notification // ignore: cast_nullable_to_non_nullable
              as List<Notification>?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.isLoading,
      required this.hasError,
      this.message,
      required this.notificationLoading,
      final List<Notification>? notification})
      : _notification = notification;

  @override
  final bool isLoading;
  @override
  final bool hasError;
  @override
  final String? message;
  @override
  final bool notificationLoading;
  final List<Notification>? _notification;
  @override
  List<Notification>? get notification {
    final value = _notification;
    if (value == null) return null;
    if (_notification is EqualUnmodifiableListView) return _notification;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'NotificationState(isLoading: $isLoading, hasError: $hasError, message: $message, notificationLoading: $notificationLoading, notification: $notification)';
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
            (identical(other.notificationLoading, notificationLoading) ||
                other.notificationLoading == notificationLoading) &&
            const DeepCollectionEquality()
                .equals(other._notification, _notification));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, hasError, message,
      notificationLoading, const DeepCollectionEquality().hash(_notification));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements NotificationState {
  const factory _Initial(
      {required final bool isLoading,
      required final bool hasError,
      final String? message,
      required final bool notificationLoading,
      final List<Notification>? notification}) = _$InitialImpl;

  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  String? get message;
  @override
  bool get notificationLoading;
  @override
  List<Notification>? get notification;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
