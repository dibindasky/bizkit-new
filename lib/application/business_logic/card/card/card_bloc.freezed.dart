// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CardEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool call) getCards,
    required TResult Function() getCardsnextPage,
    required TResult Function(int id) getCardyUserId,
    required TResult Function(int id) getCardyCardId,
    required TResult Function(int id) setDefault,
    required TResult Function(int id) deleteCard,
    required TResult Function(int id) archiveCard,
    required TResult Function(bool isLoad) getArchievedCards,
    required TResult Function() getArchievedCardsEvent,
    required TResult Function(int cardId) restoreArchieveCards,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool call)? getCards,
    TResult? Function()? getCardsnextPage,
    TResult? Function(int id)? getCardyUserId,
    TResult? Function(int id)? getCardyCardId,
    TResult? Function(int id)? setDefault,
    TResult? Function(int id)? deleteCard,
    TResult? Function(int id)? archiveCard,
    TResult? Function(bool isLoad)? getArchievedCards,
    TResult? Function()? getArchievedCardsEvent,
    TResult? Function(int cardId)? restoreArchieveCards,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool call)? getCards,
    TResult Function()? getCardsnextPage,
    TResult Function(int id)? getCardyUserId,
    TResult Function(int id)? getCardyCardId,
    TResult Function(int id)? setDefault,
    TResult Function(int id)? deleteCard,
    TResult Function(int id)? archiveCard,
    TResult Function(bool isLoad)? getArchievedCards,
    TResult Function()? getArchievedCardsEvent,
    TResult Function(int cardId)? restoreArchieveCards,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCards value) getCards,
    required TResult Function(GetCardsnextPage value) getCardsnextPage,
    required TResult Function(GetCardyUserId value) getCardyUserId,
    required TResult Function(GetCardyCardId value) getCardyCardId,
    required TResult Function(SetDefault value) setDefault,
    required TResult Function(DeleteCard value) deleteCard,
    required TResult Function(ArchiveCard value) archiveCard,
    required TResult Function(GetArchievedCards value) getArchievedCards,
    required TResult Function(GetArchievedCardsEvent value)
        getArchievedCardsEvent,
    required TResult Function(RestoreArchieveCards value) restoreArchieveCards,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCards value)? getCards,
    TResult? Function(GetCardsnextPage value)? getCardsnextPage,
    TResult? Function(GetCardyUserId value)? getCardyUserId,
    TResult? Function(GetCardyCardId value)? getCardyCardId,
    TResult? Function(SetDefault value)? setDefault,
    TResult? Function(DeleteCard value)? deleteCard,
    TResult? Function(ArchiveCard value)? archiveCard,
    TResult? Function(GetArchievedCards value)? getArchievedCards,
    TResult? Function(GetArchievedCardsEvent value)? getArchievedCardsEvent,
    TResult? Function(RestoreArchieveCards value)? restoreArchieveCards,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCards value)? getCards,
    TResult Function(GetCardsnextPage value)? getCardsnextPage,
    TResult Function(GetCardyUserId value)? getCardyUserId,
    TResult Function(GetCardyCardId value)? getCardyCardId,
    TResult Function(SetDefault value)? setDefault,
    TResult Function(DeleteCard value)? deleteCard,
    TResult Function(ArchiveCard value)? archiveCard,
    TResult Function(GetArchievedCards value)? getArchievedCards,
    TResult Function(GetArchievedCardsEvent value)? getArchievedCardsEvent,
    TResult Function(RestoreArchieveCards value)? restoreArchieveCards,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardEventCopyWith<$Res> {
  factory $CardEventCopyWith(CardEvent value, $Res Function(CardEvent) then) =
      _$CardEventCopyWithImpl<$Res, CardEvent>;
}

/// @nodoc
class _$CardEventCopyWithImpl<$Res, $Val extends CardEvent>
    implements $CardEventCopyWith<$Res> {
  _$CardEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetCardsImplCopyWith<$Res> {
  factory _$$GetCardsImplCopyWith(
          _$GetCardsImpl value, $Res Function(_$GetCardsImpl) then) =
      __$$GetCardsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool call});
}

/// @nodoc
class __$$GetCardsImplCopyWithImpl<$Res>
    extends _$CardEventCopyWithImpl<$Res, _$GetCardsImpl>
    implements _$$GetCardsImplCopyWith<$Res> {
  __$$GetCardsImplCopyWithImpl(
      _$GetCardsImpl _value, $Res Function(_$GetCardsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? call = null,
  }) {
    return _then(_$GetCardsImpl(
      call: null == call
          ? _value.call
          : call // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GetCardsImpl implements GetCards {
  const _$GetCardsImpl({required this.call});

  @override
  final bool call;

  @override
  String toString() {
    return 'CardEvent.getCards(call: $call)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCardsImpl &&
            (identical(other.call, call) || other.call == call));
  }

  @override
  int get hashCode => Object.hash(runtimeType, call);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCardsImplCopyWith<_$GetCardsImpl> get copyWith =>
      __$$GetCardsImplCopyWithImpl<_$GetCardsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool call) getCards,
    required TResult Function() getCardsnextPage,
    required TResult Function(int id) getCardyUserId,
    required TResult Function(int id) getCardyCardId,
    required TResult Function(int id) setDefault,
    required TResult Function(int id) deleteCard,
    required TResult Function(int id) archiveCard,
    required TResult Function(bool isLoad) getArchievedCards,
    required TResult Function() getArchievedCardsEvent,
    required TResult Function(int cardId) restoreArchieveCards,
  }) {
    return getCards(call);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool call)? getCards,
    TResult? Function()? getCardsnextPage,
    TResult? Function(int id)? getCardyUserId,
    TResult? Function(int id)? getCardyCardId,
    TResult? Function(int id)? setDefault,
    TResult? Function(int id)? deleteCard,
    TResult? Function(int id)? archiveCard,
    TResult? Function(bool isLoad)? getArchievedCards,
    TResult? Function()? getArchievedCardsEvent,
    TResult? Function(int cardId)? restoreArchieveCards,
  }) {
    return getCards?.call(call);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool call)? getCards,
    TResult Function()? getCardsnextPage,
    TResult Function(int id)? getCardyUserId,
    TResult Function(int id)? getCardyCardId,
    TResult Function(int id)? setDefault,
    TResult Function(int id)? deleteCard,
    TResult Function(int id)? archiveCard,
    TResult Function(bool isLoad)? getArchievedCards,
    TResult Function()? getArchievedCardsEvent,
    TResult Function(int cardId)? restoreArchieveCards,
    required TResult orElse(),
  }) {
    if (getCards != null) {
      return getCards(call);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCards value) getCards,
    required TResult Function(GetCardsnextPage value) getCardsnextPage,
    required TResult Function(GetCardyUserId value) getCardyUserId,
    required TResult Function(GetCardyCardId value) getCardyCardId,
    required TResult Function(SetDefault value) setDefault,
    required TResult Function(DeleteCard value) deleteCard,
    required TResult Function(ArchiveCard value) archiveCard,
    required TResult Function(GetArchievedCards value) getArchievedCards,
    required TResult Function(GetArchievedCardsEvent value)
        getArchievedCardsEvent,
    required TResult Function(RestoreArchieveCards value) restoreArchieveCards,
  }) {
    return getCards(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCards value)? getCards,
    TResult? Function(GetCardsnextPage value)? getCardsnextPage,
    TResult? Function(GetCardyUserId value)? getCardyUserId,
    TResult? Function(GetCardyCardId value)? getCardyCardId,
    TResult? Function(SetDefault value)? setDefault,
    TResult? Function(DeleteCard value)? deleteCard,
    TResult? Function(ArchiveCard value)? archiveCard,
    TResult? Function(GetArchievedCards value)? getArchievedCards,
    TResult? Function(GetArchievedCardsEvent value)? getArchievedCardsEvent,
    TResult? Function(RestoreArchieveCards value)? restoreArchieveCards,
  }) {
    return getCards?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCards value)? getCards,
    TResult Function(GetCardsnextPage value)? getCardsnextPage,
    TResult Function(GetCardyUserId value)? getCardyUserId,
    TResult Function(GetCardyCardId value)? getCardyCardId,
    TResult Function(SetDefault value)? setDefault,
    TResult Function(DeleteCard value)? deleteCard,
    TResult Function(ArchiveCard value)? archiveCard,
    TResult Function(GetArchievedCards value)? getArchievedCards,
    TResult Function(GetArchievedCardsEvent value)? getArchievedCardsEvent,
    TResult Function(RestoreArchieveCards value)? restoreArchieveCards,
    required TResult orElse(),
  }) {
    if (getCards != null) {
      return getCards(this);
    }
    return orElse();
  }
}

abstract class GetCards implements CardEvent {
  const factory GetCards({required final bool call}) = _$GetCardsImpl;

  bool get call;
  @JsonKey(ignore: true)
  _$$GetCardsImplCopyWith<_$GetCardsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetCardsnextPageImplCopyWith<$Res> {
  factory _$$GetCardsnextPageImplCopyWith(_$GetCardsnextPageImpl value,
          $Res Function(_$GetCardsnextPageImpl) then) =
      __$$GetCardsnextPageImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetCardsnextPageImplCopyWithImpl<$Res>
    extends _$CardEventCopyWithImpl<$Res, _$GetCardsnextPageImpl>
    implements _$$GetCardsnextPageImplCopyWith<$Res> {
  __$$GetCardsnextPageImplCopyWithImpl(_$GetCardsnextPageImpl _value,
      $Res Function(_$GetCardsnextPageImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetCardsnextPageImpl implements GetCardsnextPage {
  const _$GetCardsnextPageImpl();

  @override
  String toString() {
    return 'CardEvent.getCardsnextPage()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetCardsnextPageImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool call) getCards,
    required TResult Function() getCardsnextPage,
    required TResult Function(int id) getCardyUserId,
    required TResult Function(int id) getCardyCardId,
    required TResult Function(int id) setDefault,
    required TResult Function(int id) deleteCard,
    required TResult Function(int id) archiveCard,
    required TResult Function(bool isLoad) getArchievedCards,
    required TResult Function() getArchievedCardsEvent,
    required TResult Function(int cardId) restoreArchieveCards,
  }) {
    return getCardsnextPage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool call)? getCards,
    TResult? Function()? getCardsnextPage,
    TResult? Function(int id)? getCardyUserId,
    TResult? Function(int id)? getCardyCardId,
    TResult? Function(int id)? setDefault,
    TResult? Function(int id)? deleteCard,
    TResult? Function(int id)? archiveCard,
    TResult? Function(bool isLoad)? getArchievedCards,
    TResult? Function()? getArchievedCardsEvent,
    TResult? Function(int cardId)? restoreArchieveCards,
  }) {
    return getCardsnextPage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool call)? getCards,
    TResult Function()? getCardsnextPage,
    TResult Function(int id)? getCardyUserId,
    TResult Function(int id)? getCardyCardId,
    TResult Function(int id)? setDefault,
    TResult Function(int id)? deleteCard,
    TResult Function(int id)? archiveCard,
    TResult Function(bool isLoad)? getArchievedCards,
    TResult Function()? getArchievedCardsEvent,
    TResult Function(int cardId)? restoreArchieveCards,
    required TResult orElse(),
  }) {
    if (getCardsnextPage != null) {
      return getCardsnextPage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCards value) getCards,
    required TResult Function(GetCardsnextPage value) getCardsnextPage,
    required TResult Function(GetCardyUserId value) getCardyUserId,
    required TResult Function(GetCardyCardId value) getCardyCardId,
    required TResult Function(SetDefault value) setDefault,
    required TResult Function(DeleteCard value) deleteCard,
    required TResult Function(ArchiveCard value) archiveCard,
    required TResult Function(GetArchievedCards value) getArchievedCards,
    required TResult Function(GetArchievedCardsEvent value)
        getArchievedCardsEvent,
    required TResult Function(RestoreArchieveCards value) restoreArchieveCards,
  }) {
    return getCardsnextPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCards value)? getCards,
    TResult? Function(GetCardsnextPage value)? getCardsnextPage,
    TResult? Function(GetCardyUserId value)? getCardyUserId,
    TResult? Function(GetCardyCardId value)? getCardyCardId,
    TResult? Function(SetDefault value)? setDefault,
    TResult? Function(DeleteCard value)? deleteCard,
    TResult? Function(ArchiveCard value)? archiveCard,
    TResult? Function(GetArchievedCards value)? getArchievedCards,
    TResult? Function(GetArchievedCardsEvent value)? getArchievedCardsEvent,
    TResult? Function(RestoreArchieveCards value)? restoreArchieveCards,
  }) {
    return getCardsnextPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCards value)? getCards,
    TResult Function(GetCardsnextPage value)? getCardsnextPage,
    TResult Function(GetCardyUserId value)? getCardyUserId,
    TResult Function(GetCardyCardId value)? getCardyCardId,
    TResult Function(SetDefault value)? setDefault,
    TResult Function(DeleteCard value)? deleteCard,
    TResult Function(ArchiveCard value)? archiveCard,
    TResult Function(GetArchievedCards value)? getArchievedCards,
    TResult Function(GetArchievedCardsEvent value)? getArchievedCardsEvent,
    TResult Function(RestoreArchieveCards value)? restoreArchieveCards,
    required TResult orElse(),
  }) {
    if (getCardsnextPage != null) {
      return getCardsnextPage(this);
    }
    return orElse();
  }
}

abstract class GetCardsnextPage implements CardEvent {
  const factory GetCardsnextPage() = _$GetCardsnextPageImpl;
}

/// @nodoc
abstract class _$$GetCardyUserIdImplCopyWith<$Res> {
  factory _$$GetCardyUserIdImplCopyWith(_$GetCardyUserIdImpl value,
          $Res Function(_$GetCardyUserIdImpl) then) =
      __$$GetCardyUserIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$GetCardyUserIdImplCopyWithImpl<$Res>
    extends _$CardEventCopyWithImpl<$Res, _$GetCardyUserIdImpl>
    implements _$$GetCardyUserIdImplCopyWith<$Res> {
  __$$GetCardyUserIdImplCopyWithImpl(
      _$GetCardyUserIdImpl _value, $Res Function(_$GetCardyUserIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$GetCardyUserIdImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetCardyUserIdImpl implements GetCardyUserId {
  const _$GetCardyUserIdImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'CardEvent.getCardyUserId(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCardyUserIdImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCardyUserIdImplCopyWith<_$GetCardyUserIdImpl> get copyWith =>
      __$$GetCardyUserIdImplCopyWithImpl<_$GetCardyUserIdImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool call) getCards,
    required TResult Function() getCardsnextPage,
    required TResult Function(int id) getCardyUserId,
    required TResult Function(int id) getCardyCardId,
    required TResult Function(int id) setDefault,
    required TResult Function(int id) deleteCard,
    required TResult Function(int id) archiveCard,
    required TResult Function(bool isLoad) getArchievedCards,
    required TResult Function() getArchievedCardsEvent,
    required TResult Function(int cardId) restoreArchieveCards,
  }) {
    return getCardyUserId(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool call)? getCards,
    TResult? Function()? getCardsnextPage,
    TResult? Function(int id)? getCardyUserId,
    TResult? Function(int id)? getCardyCardId,
    TResult? Function(int id)? setDefault,
    TResult? Function(int id)? deleteCard,
    TResult? Function(int id)? archiveCard,
    TResult? Function(bool isLoad)? getArchievedCards,
    TResult? Function()? getArchievedCardsEvent,
    TResult? Function(int cardId)? restoreArchieveCards,
  }) {
    return getCardyUserId?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool call)? getCards,
    TResult Function()? getCardsnextPage,
    TResult Function(int id)? getCardyUserId,
    TResult Function(int id)? getCardyCardId,
    TResult Function(int id)? setDefault,
    TResult Function(int id)? deleteCard,
    TResult Function(int id)? archiveCard,
    TResult Function(bool isLoad)? getArchievedCards,
    TResult Function()? getArchievedCardsEvent,
    TResult Function(int cardId)? restoreArchieveCards,
    required TResult orElse(),
  }) {
    if (getCardyUserId != null) {
      return getCardyUserId(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCards value) getCards,
    required TResult Function(GetCardsnextPage value) getCardsnextPage,
    required TResult Function(GetCardyUserId value) getCardyUserId,
    required TResult Function(GetCardyCardId value) getCardyCardId,
    required TResult Function(SetDefault value) setDefault,
    required TResult Function(DeleteCard value) deleteCard,
    required TResult Function(ArchiveCard value) archiveCard,
    required TResult Function(GetArchievedCards value) getArchievedCards,
    required TResult Function(GetArchievedCardsEvent value)
        getArchievedCardsEvent,
    required TResult Function(RestoreArchieveCards value) restoreArchieveCards,
  }) {
    return getCardyUserId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCards value)? getCards,
    TResult? Function(GetCardsnextPage value)? getCardsnextPage,
    TResult? Function(GetCardyUserId value)? getCardyUserId,
    TResult? Function(GetCardyCardId value)? getCardyCardId,
    TResult? Function(SetDefault value)? setDefault,
    TResult? Function(DeleteCard value)? deleteCard,
    TResult? Function(ArchiveCard value)? archiveCard,
    TResult? Function(GetArchievedCards value)? getArchievedCards,
    TResult? Function(GetArchievedCardsEvent value)? getArchievedCardsEvent,
    TResult? Function(RestoreArchieveCards value)? restoreArchieveCards,
  }) {
    return getCardyUserId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCards value)? getCards,
    TResult Function(GetCardsnextPage value)? getCardsnextPage,
    TResult Function(GetCardyUserId value)? getCardyUserId,
    TResult Function(GetCardyCardId value)? getCardyCardId,
    TResult Function(SetDefault value)? setDefault,
    TResult Function(DeleteCard value)? deleteCard,
    TResult Function(ArchiveCard value)? archiveCard,
    TResult Function(GetArchievedCards value)? getArchievedCards,
    TResult Function(GetArchievedCardsEvent value)? getArchievedCardsEvent,
    TResult Function(RestoreArchieveCards value)? restoreArchieveCards,
    required TResult orElse(),
  }) {
    if (getCardyUserId != null) {
      return getCardyUserId(this);
    }
    return orElse();
  }
}

abstract class GetCardyUserId implements CardEvent {
  const factory GetCardyUserId({required final int id}) = _$GetCardyUserIdImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$GetCardyUserIdImplCopyWith<_$GetCardyUserIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetCardyCardIdImplCopyWith<$Res> {
  factory _$$GetCardyCardIdImplCopyWith(_$GetCardyCardIdImpl value,
          $Res Function(_$GetCardyCardIdImpl) then) =
      __$$GetCardyCardIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$GetCardyCardIdImplCopyWithImpl<$Res>
    extends _$CardEventCopyWithImpl<$Res, _$GetCardyCardIdImpl>
    implements _$$GetCardyCardIdImplCopyWith<$Res> {
  __$$GetCardyCardIdImplCopyWithImpl(
      _$GetCardyCardIdImpl _value, $Res Function(_$GetCardyCardIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$GetCardyCardIdImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetCardyCardIdImpl implements GetCardyCardId {
  const _$GetCardyCardIdImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'CardEvent.getCardyCardId(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCardyCardIdImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCardyCardIdImplCopyWith<_$GetCardyCardIdImpl> get copyWith =>
      __$$GetCardyCardIdImplCopyWithImpl<_$GetCardyCardIdImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool call) getCards,
    required TResult Function() getCardsnextPage,
    required TResult Function(int id) getCardyUserId,
    required TResult Function(int id) getCardyCardId,
    required TResult Function(int id) setDefault,
    required TResult Function(int id) deleteCard,
    required TResult Function(int id) archiveCard,
    required TResult Function(bool isLoad) getArchievedCards,
    required TResult Function() getArchievedCardsEvent,
    required TResult Function(int cardId) restoreArchieveCards,
  }) {
    return getCardyCardId(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool call)? getCards,
    TResult? Function()? getCardsnextPage,
    TResult? Function(int id)? getCardyUserId,
    TResult? Function(int id)? getCardyCardId,
    TResult? Function(int id)? setDefault,
    TResult? Function(int id)? deleteCard,
    TResult? Function(int id)? archiveCard,
    TResult? Function(bool isLoad)? getArchievedCards,
    TResult? Function()? getArchievedCardsEvent,
    TResult? Function(int cardId)? restoreArchieveCards,
  }) {
    return getCardyCardId?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool call)? getCards,
    TResult Function()? getCardsnextPage,
    TResult Function(int id)? getCardyUserId,
    TResult Function(int id)? getCardyCardId,
    TResult Function(int id)? setDefault,
    TResult Function(int id)? deleteCard,
    TResult Function(int id)? archiveCard,
    TResult Function(bool isLoad)? getArchievedCards,
    TResult Function()? getArchievedCardsEvent,
    TResult Function(int cardId)? restoreArchieveCards,
    required TResult orElse(),
  }) {
    if (getCardyCardId != null) {
      return getCardyCardId(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCards value) getCards,
    required TResult Function(GetCardsnextPage value) getCardsnextPage,
    required TResult Function(GetCardyUserId value) getCardyUserId,
    required TResult Function(GetCardyCardId value) getCardyCardId,
    required TResult Function(SetDefault value) setDefault,
    required TResult Function(DeleteCard value) deleteCard,
    required TResult Function(ArchiveCard value) archiveCard,
    required TResult Function(GetArchievedCards value) getArchievedCards,
    required TResult Function(GetArchievedCardsEvent value)
        getArchievedCardsEvent,
    required TResult Function(RestoreArchieveCards value) restoreArchieveCards,
  }) {
    return getCardyCardId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCards value)? getCards,
    TResult? Function(GetCardsnextPage value)? getCardsnextPage,
    TResult? Function(GetCardyUserId value)? getCardyUserId,
    TResult? Function(GetCardyCardId value)? getCardyCardId,
    TResult? Function(SetDefault value)? setDefault,
    TResult? Function(DeleteCard value)? deleteCard,
    TResult? Function(ArchiveCard value)? archiveCard,
    TResult? Function(GetArchievedCards value)? getArchievedCards,
    TResult? Function(GetArchievedCardsEvent value)? getArchievedCardsEvent,
    TResult? Function(RestoreArchieveCards value)? restoreArchieveCards,
  }) {
    return getCardyCardId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCards value)? getCards,
    TResult Function(GetCardsnextPage value)? getCardsnextPage,
    TResult Function(GetCardyUserId value)? getCardyUserId,
    TResult Function(GetCardyCardId value)? getCardyCardId,
    TResult Function(SetDefault value)? setDefault,
    TResult Function(DeleteCard value)? deleteCard,
    TResult Function(ArchiveCard value)? archiveCard,
    TResult Function(GetArchievedCards value)? getArchievedCards,
    TResult Function(GetArchievedCardsEvent value)? getArchievedCardsEvent,
    TResult Function(RestoreArchieveCards value)? restoreArchieveCards,
    required TResult orElse(),
  }) {
    if (getCardyCardId != null) {
      return getCardyCardId(this);
    }
    return orElse();
  }
}

abstract class GetCardyCardId implements CardEvent {
  const factory GetCardyCardId({required final int id}) = _$GetCardyCardIdImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$GetCardyCardIdImplCopyWith<_$GetCardyCardIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetDefaultImplCopyWith<$Res> {
  factory _$$SetDefaultImplCopyWith(
          _$SetDefaultImpl value, $Res Function(_$SetDefaultImpl) then) =
      __$$SetDefaultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$SetDefaultImplCopyWithImpl<$Res>
    extends _$CardEventCopyWithImpl<$Res, _$SetDefaultImpl>
    implements _$$SetDefaultImplCopyWith<$Res> {
  __$$SetDefaultImplCopyWithImpl(
      _$SetDefaultImpl _value, $Res Function(_$SetDefaultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$SetDefaultImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SetDefaultImpl implements SetDefault {
  const _$SetDefaultImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'CardEvent.setDefault(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetDefaultImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetDefaultImplCopyWith<_$SetDefaultImpl> get copyWith =>
      __$$SetDefaultImplCopyWithImpl<_$SetDefaultImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool call) getCards,
    required TResult Function() getCardsnextPage,
    required TResult Function(int id) getCardyUserId,
    required TResult Function(int id) getCardyCardId,
    required TResult Function(int id) setDefault,
    required TResult Function(int id) deleteCard,
    required TResult Function(int id) archiveCard,
    required TResult Function(bool isLoad) getArchievedCards,
    required TResult Function() getArchievedCardsEvent,
    required TResult Function(int cardId) restoreArchieveCards,
  }) {
    return setDefault(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool call)? getCards,
    TResult? Function()? getCardsnextPage,
    TResult? Function(int id)? getCardyUserId,
    TResult? Function(int id)? getCardyCardId,
    TResult? Function(int id)? setDefault,
    TResult? Function(int id)? deleteCard,
    TResult? Function(int id)? archiveCard,
    TResult? Function(bool isLoad)? getArchievedCards,
    TResult? Function()? getArchievedCardsEvent,
    TResult? Function(int cardId)? restoreArchieveCards,
  }) {
    return setDefault?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool call)? getCards,
    TResult Function()? getCardsnextPage,
    TResult Function(int id)? getCardyUserId,
    TResult Function(int id)? getCardyCardId,
    TResult Function(int id)? setDefault,
    TResult Function(int id)? deleteCard,
    TResult Function(int id)? archiveCard,
    TResult Function(bool isLoad)? getArchievedCards,
    TResult Function()? getArchievedCardsEvent,
    TResult Function(int cardId)? restoreArchieveCards,
    required TResult orElse(),
  }) {
    if (setDefault != null) {
      return setDefault(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCards value) getCards,
    required TResult Function(GetCardsnextPage value) getCardsnextPage,
    required TResult Function(GetCardyUserId value) getCardyUserId,
    required TResult Function(GetCardyCardId value) getCardyCardId,
    required TResult Function(SetDefault value) setDefault,
    required TResult Function(DeleteCard value) deleteCard,
    required TResult Function(ArchiveCard value) archiveCard,
    required TResult Function(GetArchievedCards value) getArchievedCards,
    required TResult Function(GetArchievedCardsEvent value)
        getArchievedCardsEvent,
    required TResult Function(RestoreArchieveCards value) restoreArchieveCards,
  }) {
    return setDefault(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCards value)? getCards,
    TResult? Function(GetCardsnextPage value)? getCardsnextPage,
    TResult? Function(GetCardyUserId value)? getCardyUserId,
    TResult? Function(GetCardyCardId value)? getCardyCardId,
    TResult? Function(SetDefault value)? setDefault,
    TResult? Function(DeleteCard value)? deleteCard,
    TResult? Function(ArchiveCard value)? archiveCard,
    TResult? Function(GetArchievedCards value)? getArchievedCards,
    TResult? Function(GetArchievedCardsEvent value)? getArchievedCardsEvent,
    TResult? Function(RestoreArchieveCards value)? restoreArchieveCards,
  }) {
    return setDefault?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCards value)? getCards,
    TResult Function(GetCardsnextPage value)? getCardsnextPage,
    TResult Function(GetCardyUserId value)? getCardyUserId,
    TResult Function(GetCardyCardId value)? getCardyCardId,
    TResult Function(SetDefault value)? setDefault,
    TResult Function(DeleteCard value)? deleteCard,
    TResult Function(ArchiveCard value)? archiveCard,
    TResult Function(GetArchievedCards value)? getArchievedCards,
    TResult Function(GetArchievedCardsEvent value)? getArchievedCardsEvent,
    TResult Function(RestoreArchieveCards value)? restoreArchieveCards,
    required TResult orElse(),
  }) {
    if (setDefault != null) {
      return setDefault(this);
    }
    return orElse();
  }
}

abstract class SetDefault implements CardEvent {
  const factory SetDefault({required final int id}) = _$SetDefaultImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$SetDefaultImplCopyWith<_$SetDefaultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteCardImplCopyWith<$Res> {
  factory _$$DeleteCardImplCopyWith(
          _$DeleteCardImpl value, $Res Function(_$DeleteCardImpl) then) =
      __$$DeleteCardImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$DeleteCardImplCopyWithImpl<$Res>
    extends _$CardEventCopyWithImpl<$Res, _$DeleteCardImpl>
    implements _$$DeleteCardImplCopyWith<$Res> {
  __$$DeleteCardImplCopyWithImpl(
      _$DeleteCardImpl _value, $Res Function(_$DeleteCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeleteCardImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteCardImpl implements DeleteCard {
  const _$DeleteCardImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'CardEvent.deleteCard(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteCardImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteCardImplCopyWith<_$DeleteCardImpl> get copyWith =>
      __$$DeleteCardImplCopyWithImpl<_$DeleteCardImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool call) getCards,
    required TResult Function() getCardsnextPage,
    required TResult Function(int id) getCardyUserId,
    required TResult Function(int id) getCardyCardId,
    required TResult Function(int id) setDefault,
    required TResult Function(int id) deleteCard,
    required TResult Function(int id) archiveCard,
    required TResult Function(bool isLoad) getArchievedCards,
    required TResult Function() getArchievedCardsEvent,
    required TResult Function(int cardId) restoreArchieveCards,
  }) {
    return deleteCard(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool call)? getCards,
    TResult? Function()? getCardsnextPage,
    TResult? Function(int id)? getCardyUserId,
    TResult? Function(int id)? getCardyCardId,
    TResult? Function(int id)? setDefault,
    TResult? Function(int id)? deleteCard,
    TResult? Function(int id)? archiveCard,
    TResult? Function(bool isLoad)? getArchievedCards,
    TResult? Function()? getArchievedCardsEvent,
    TResult? Function(int cardId)? restoreArchieveCards,
  }) {
    return deleteCard?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool call)? getCards,
    TResult Function()? getCardsnextPage,
    TResult Function(int id)? getCardyUserId,
    TResult Function(int id)? getCardyCardId,
    TResult Function(int id)? setDefault,
    TResult Function(int id)? deleteCard,
    TResult Function(int id)? archiveCard,
    TResult Function(bool isLoad)? getArchievedCards,
    TResult Function()? getArchievedCardsEvent,
    TResult Function(int cardId)? restoreArchieveCards,
    required TResult orElse(),
  }) {
    if (deleteCard != null) {
      return deleteCard(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCards value) getCards,
    required TResult Function(GetCardsnextPage value) getCardsnextPage,
    required TResult Function(GetCardyUserId value) getCardyUserId,
    required TResult Function(GetCardyCardId value) getCardyCardId,
    required TResult Function(SetDefault value) setDefault,
    required TResult Function(DeleteCard value) deleteCard,
    required TResult Function(ArchiveCard value) archiveCard,
    required TResult Function(GetArchievedCards value) getArchievedCards,
    required TResult Function(GetArchievedCardsEvent value)
        getArchievedCardsEvent,
    required TResult Function(RestoreArchieveCards value) restoreArchieveCards,
  }) {
    return deleteCard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCards value)? getCards,
    TResult? Function(GetCardsnextPage value)? getCardsnextPage,
    TResult? Function(GetCardyUserId value)? getCardyUserId,
    TResult? Function(GetCardyCardId value)? getCardyCardId,
    TResult? Function(SetDefault value)? setDefault,
    TResult? Function(DeleteCard value)? deleteCard,
    TResult? Function(ArchiveCard value)? archiveCard,
    TResult? Function(GetArchievedCards value)? getArchievedCards,
    TResult? Function(GetArchievedCardsEvent value)? getArchievedCardsEvent,
    TResult? Function(RestoreArchieveCards value)? restoreArchieveCards,
  }) {
    return deleteCard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCards value)? getCards,
    TResult Function(GetCardsnextPage value)? getCardsnextPage,
    TResult Function(GetCardyUserId value)? getCardyUserId,
    TResult Function(GetCardyCardId value)? getCardyCardId,
    TResult Function(SetDefault value)? setDefault,
    TResult Function(DeleteCard value)? deleteCard,
    TResult Function(ArchiveCard value)? archiveCard,
    TResult Function(GetArchievedCards value)? getArchievedCards,
    TResult Function(GetArchievedCardsEvent value)? getArchievedCardsEvent,
    TResult Function(RestoreArchieveCards value)? restoreArchieveCards,
    required TResult orElse(),
  }) {
    if (deleteCard != null) {
      return deleteCard(this);
    }
    return orElse();
  }
}

abstract class DeleteCard implements CardEvent {
  const factory DeleteCard({required final int id}) = _$DeleteCardImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$DeleteCardImplCopyWith<_$DeleteCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ArchiveCardImplCopyWith<$Res> {
  factory _$$ArchiveCardImplCopyWith(
          _$ArchiveCardImpl value, $Res Function(_$ArchiveCardImpl) then) =
      __$$ArchiveCardImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$ArchiveCardImplCopyWithImpl<$Res>
    extends _$CardEventCopyWithImpl<$Res, _$ArchiveCardImpl>
    implements _$$ArchiveCardImplCopyWith<$Res> {
  __$$ArchiveCardImplCopyWithImpl(
      _$ArchiveCardImpl _value, $Res Function(_$ArchiveCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$ArchiveCardImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ArchiveCardImpl implements ArchiveCard {
  const _$ArchiveCardImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'CardEvent.archiveCard(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArchiveCardImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArchiveCardImplCopyWith<_$ArchiveCardImpl> get copyWith =>
      __$$ArchiveCardImplCopyWithImpl<_$ArchiveCardImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool call) getCards,
    required TResult Function() getCardsnextPage,
    required TResult Function(int id) getCardyUserId,
    required TResult Function(int id) getCardyCardId,
    required TResult Function(int id) setDefault,
    required TResult Function(int id) deleteCard,
    required TResult Function(int id) archiveCard,
    required TResult Function(bool isLoad) getArchievedCards,
    required TResult Function() getArchievedCardsEvent,
    required TResult Function(int cardId) restoreArchieveCards,
  }) {
    return archiveCard(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool call)? getCards,
    TResult? Function()? getCardsnextPage,
    TResult? Function(int id)? getCardyUserId,
    TResult? Function(int id)? getCardyCardId,
    TResult? Function(int id)? setDefault,
    TResult? Function(int id)? deleteCard,
    TResult? Function(int id)? archiveCard,
    TResult? Function(bool isLoad)? getArchievedCards,
    TResult? Function()? getArchievedCardsEvent,
    TResult? Function(int cardId)? restoreArchieveCards,
  }) {
    return archiveCard?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool call)? getCards,
    TResult Function()? getCardsnextPage,
    TResult Function(int id)? getCardyUserId,
    TResult Function(int id)? getCardyCardId,
    TResult Function(int id)? setDefault,
    TResult Function(int id)? deleteCard,
    TResult Function(int id)? archiveCard,
    TResult Function(bool isLoad)? getArchievedCards,
    TResult Function()? getArchievedCardsEvent,
    TResult Function(int cardId)? restoreArchieveCards,
    required TResult orElse(),
  }) {
    if (archiveCard != null) {
      return archiveCard(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCards value) getCards,
    required TResult Function(GetCardsnextPage value) getCardsnextPage,
    required TResult Function(GetCardyUserId value) getCardyUserId,
    required TResult Function(GetCardyCardId value) getCardyCardId,
    required TResult Function(SetDefault value) setDefault,
    required TResult Function(DeleteCard value) deleteCard,
    required TResult Function(ArchiveCard value) archiveCard,
    required TResult Function(GetArchievedCards value) getArchievedCards,
    required TResult Function(GetArchievedCardsEvent value)
        getArchievedCardsEvent,
    required TResult Function(RestoreArchieveCards value) restoreArchieveCards,
  }) {
    return archiveCard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCards value)? getCards,
    TResult? Function(GetCardsnextPage value)? getCardsnextPage,
    TResult? Function(GetCardyUserId value)? getCardyUserId,
    TResult? Function(GetCardyCardId value)? getCardyCardId,
    TResult? Function(SetDefault value)? setDefault,
    TResult? Function(DeleteCard value)? deleteCard,
    TResult? Function(ArchiveCard value)? archiveCard,
    TResult? Function(GetArchievedCards value)? getArchievedCards,
    TResult? Function(GetArchievedCardsEvent value)? getArchievedCardsEvent,
    TResult? Function(RestoreArchieveCards value)? restoreArchieveCards,
  }) {
    return archiveCard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCards value)? getCards,
    TResult Function(GetCardsnextPage value)? getCardsnextPage,
    TResult Function(GetCardyUserId value)? getCardyUserId,
    TResult Function(GetCardyCardId value)? getCardyCardId,
    TResult Function(SetDefault value)? setDefault,
    TResult Function(DeleteCard value)? deleteCard,
    TResult Function(ArchiveCard value)? archiveCard,
    TResult Function(GetArchievedCards value)? getArchievedCards,
    TResult Function(GetArchievedCardsEvent value)? getArchievedCardsEvent,
    TResult Function(RestoreArchieveCards value)? restoreArchieveCards,
    required TResult orElse(),
  }) {
    if (archiveCard != null) {
      return archiveCard(this);
    }
    return orElse();
  }
}

abstract class ArchiveCard implements CardEvent {
  const factory ArchiveCard({required final int id}) = _$ArchiveCardImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$ArchiveCardImplCopyWith<_$ArchiveCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetArchievedCardsImplCopyWith<$Res> {
  factory _$$GetArchievedCardsImplCopyWith(_$GetArchievedCardsImpl value,
          $Res Function(_$GetArchievedCardsImpl) then) =
      __$$GetArchievedCardsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isLoad});
}

/// @nodoc
class __$$GetArchievedCardsImplCopyWithImpl<$Res>
    extends _$CardEventCopyWithImpl<$Res, _$GetArchievedCardsImpl>
    implements _$$GetArchievedCardsImplCopyWith<$Res> {
  __$$GetArchievedCardsImplCopyWithImpl(_$GetArchievedCardsImpl _value,
      $Res Function(_$GetArchievedCardsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoad = null,
  }) {
    return _then(_$GetArchievedCardsImpl(
      isLoad: null == isLoad
          ? _value.isLoad
          : isLoad // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GetArchievedCardsImpl implements GetArchievedCards {
  const _$GetArchievedCardsImpl({required this.isLoad});

  @override
  final bool isLoad;

  @override
  String toString() {
    return 'CardEvent.getArchievedCards(isLoad: $isLoad)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetArchievedCardsImpl &&
            (identical(other.isLoad, isLoad) || other.isLoad == isLoad));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoad);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetArchievedCardsImplCopyWith<_$GetArchievedCardsImpl> get copyWith =>
      __$$GetArchievedCardsImplCopyWithImpl<_$GetArchievedCardsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool call) getCards,
    required TResult Function() getCardsnextPage,
    required TResult Function(int id) getCardyUserId,
    required TResult Function(int id) getCardyCardId,
    required TResult Function(int id) setDefault,
    required TResult Function(int id) deleteCard,
    required TResult Function(int id) archiveCard,
    required TResult Function(bool isLoad) getArchievedCards,
    required TResult Function() getArchievedCardsEvent,
    required TResult Function(int cardId) restoreArchieveCards,
  }) {
    return getArchievedCards(isLoad);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool call)? getCards,
    TResult? Function()? getCardsnextPage,
    TResult? Function(int id)? getCardyUserId,
    TResult? Function(int id)? getCardyCardId,
    TResult? Function(int id)? setDefault,
    TResult? Function(int id)? deleteCard,
    TResult? Function(int id)? archiveCard,
    TResult? Function(bool isLoad)? getArchievedCards,
    TResult? Function()? getArchievedCardsEvent,
    TResult? Function(int cardId)? restoreArchieveCards,
  }) {
    return getArchievedCards?.call(isLoad);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool call)? getCards,
    TResult Function()? getCardsnextPage,
    TResult Function(int id)? getCardyUserId,
    TResult Function(int id)? getCardyCardId,
    TResult Function(int id)? setDefault,
    TResult Function(int id)? deleteCard,
    TResult Function(int id)? archiveCard,
    TResult Function(bool isLoad)? getArchievedCards,
    TResult Function()? getArchievedCardsEvent,
    TResult Function(int cardId)? restoreArchieveCards,
    required TResult orElse(),
  }) {
    if (getArchievedCards != null) {
      return getArchievedCards(isLoad);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCards value) getCards,
    required TResult Function(GetCardsnextPage value) getCardsnextPage,
    required TResult Function(GetCardyUserId value) getCardyUserId,
    required TResult Function(GetCardyCardId value) getCardyCardId,
    required TResult Function(SetDefault value) setDefault,
    required TResult Function(DeleteCard value) deleteCard,
    required TResult Function(ArchiveCard value) archiveCard,
    required TResult Function(GetArchievedCards value) getArchievedCards,
    required TResult Function(GetArchievedCardsEvent value)
        getArchievedCardsEvent,
    required TResult Function(RestoreArchieveCards value) restoreArchieveCards,
  }) {
    return getArchievedCards(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCards value)? getCards,
    TResult? Function(GetCardsnextPage value)? getCardsnextPage,
    TResult? Function(GetCardyUserId value)? getCardyUserId,
    TResult? Function(GetCardyCardId value)? getCardyCardId,
    TResult? Function(SetDefault value)? setDefault,
    TResult? Function(DeleteCard value)? deleteCard,
    TResult? Function(ArchiveCard value)? archiveCard,
    TResult? Function(GetArchievedCards value)? getArchievedCards,
    TResult? Function(GetArchievedCardsEvent value)? getArchievedCardsEvent,
    TResult? Function(RestoreArchieveCards value)? restoreArchieveCards,
  }) {
    return getArchievedCards?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCards value)? getCards,
    TResult Function(GetCardsnextPage value)? getCardsnextPage,
    TResult Function(GetCardyUserId value)? getCardyUserId,
    TResult Function(GetCardyCardId value)? getCardyCardId,
    TResult Function(SetDefault value)? setDefault,
    TResult Function(DeleteCard value)? deleteCard,
    TResult Function(ArchiveCard value)? archiveCard,
    TResult Function(GetArchievedCards value)? getArchievedCards,
    TResult Function(GetArchievedCardsEvent value)? getArchievedCardsEvent,
    TResult Function(RestoreArchieveCards value)? restoreArchieveCards,
    required TResult orElse(),
  }) {
    if (getArchievedCards != null) {
      return getArchievedCards(this);
    }
    return orElse();
  }
}

abstract class GetArchievedCards implements CardEvent {
  const factory GetArchievedCards({required final bool isLoad}) =
      _$GetArchievedCardsImpl;

  bool get isLoad;
  @JsonKey(ignore: true)
  _$$GetArchievedCardsImplCopyWith<_$GetArchievedCardsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetArchievedCardsEventImplCopyWith<$Res> {
  factory _$$GetArchievedCardsEventImplCopyWith(
          _$GetArchievedCardsEventImpl value,
          $Res Function(_$GetArchievedCardsEventImpl) then) =
      __$$GetArchievedCardsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetArchievedCardsEventImplCopyWithImpl<$Res>
    extends _$CardEventCopyWithImpl<$Res, _$GetArchievedCardsEventImpl>
    implements _$$GetArchievedCardsEventImplCopyWith<$Res> {
  __$$GetArchievedCardsEventImplCopyWithImpl(
      _$GetArchievedCardsEventImpl _value,
      $Res Function(_$GetArchievedCardsEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetArchievedCardsEventImpl implements GetArchievedCardsEvent {
  const _$GetArchievedCardsEventImpl();

  @override
  String toString() {
    return 'CardEvent.getArchievedCardsEvent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetArchievedCardsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool call) getCards,
    required TResult Function() getCardsnextPage,
    required TResult Function(int id) getCardyUserId,
    required TResult Function(int id) getCardyCardId,
    required TResult Function(int id) setDefault,
    required TResult Function(int id) deleteCard,
    required TResult Function(int id) archiveCard,
    required TResult Function(bool isLoad) getArchievedCards,
    required TResult Function() getArchievedCardsEvent,
    required TResult Function(int cardId) restoreArchieveCards,
  }) {
    return getArchievedCardsEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool call)? getCards,
    TResult? Function()? getCardsnextPage,
    TResult? Function(int id)? getCardyUserId,
    TResult? Function(int id)? getCardyCardId,
    TResult? Function(int id)? setDefault,
    TResult? Function(int id)? deleteCard,
    TResult? Function(int id)? archiveCard,
    TResult? Function(bool isLoad)? getArchievedCards,
    TResult? Function()? getArchievedCardsEvent,
    TResult? Function(int cardId)? restoreArchieveCards,
  }) {
    return getArchievedCardsEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool call)? getCards,
    TResult Function()? getCardsnextPage,
    TResult Function(int id)? getCardyUserId,
    TResult Function(int id)? getCardyCardId,
    TResult Function(int id)? setDefault,
    TResult Function(int id)? deleteCard,
    TResult Function(int id)? archiveCard,
    TResult Function(bool isLoad)? getArchievedCards,
    TResult Function()? getArchievedCardsEvent,
    TResult Function(int cardId)? restoreArchieveCards,
    required TResult orElse(),
  }) {
    if (getArchievedCardsEvent != null) {
      return getArchievedCardsEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCards value) getCards,
    required TResult Function(GetCardsnextPage value) getCardsnextPage,
    required TResult Function(GetCardyUserId value) getCardyUserId,
    required TResult Function(GetCardyCardId value) getCardyCardId,
    required TResult Function(SetDefault value) setDefault,
    required TResult Function(DeleteCard value) deleteCard,
    required TResult Function(ArchiveCard value) archiveCard,
    required TResult Function(GetArchievedCards value) getArchievedCards,
    required TResult Function(GetArchievedCardsEvent value)
        getArchievedCardsEvent,
    required TResult Function(RestoreArchieveCards value) restoreArchieveCards,
  }) {
    return getArchievedCardsEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCards value)? getCards,
    TResult? Function(GetCardsnextPage value)? getCardsnextPage,
    TResult? Function(GetCardyUserId value)? getCardyUserId,
    TResult? Function(GetCardyCardId value)? getCardyCardId,
    TResult? Function(SetDefault value)? setDefault,
    TResult? Function(DeleteCard value)? deleteCard,
    TResult? Function(ArchiveCard value)? archiveCard,
    TResult? Function(GetArchievedCards value)? getArchievedCards,
    TResult? Function(GetArchievedCardsEvent value)? getArchievedCardsEvent,
    TResult? Function(RestoreArchieveCards value)? restoreArchieveCards,
  }) {
    return getArchievedCardsEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCards value)? getCards,
    TResult Function(GetCardsnextPage value)? getCardsnextPage,
    TResult Function(GetCardyUserId value)? getCardyUserId,
    TResult Function(GetCardyCardId value)? getCardyCardId,
    TResult Function(SetDefault value)? setDefault,
    TResult Function(DeleteCard value)? deleteCard,
    TResult Function(ArchiveCard value)? archiveCard,
    TResult Function(GetArchievedCards value)? getArchievedCards,
    TResult Function(GetArchievedCardsEvent value)? getArchievedCardsEvent,
    TResult Function(RestoreArchieveCards value)? restoreArchieveCards,
    required TResult orElse(),
  }) {
    if (getArchievedCardsEvent != null) {
      return getArchievedCardsEvent(this);
    }
    return orElse();
  }
}

abstract class GetArchievedCardsEvent implements CardEvent {
  const factory GetArchievedCardsEvent() = _$GetArchievedCardsEventImpl;
}

/// @nodoc
abstract class _$$RestoreArchieveCardsImplCopyWith<$Res> {
  factory _$$RestoreArchieveCardsImplCopyWith(_$RestoreArchieveCardsImpl value,
          $Res Function(_$RestoreArchieveCardsImpl) then) =
      __$$RestoreArchieveCardsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int cardId});
}

/// @nodoc
class __$$RestoreArchieveCardsImplCopyWithImpl<$Res>
    extends _$CardEventCopyWithImpl<$Res, _$RestoreArchieveCardsImpl>
    implements _$$RestoreArchieveCardsImplCopyWith<$Res> {
  __$$RestoreArchieveCardsImplCopyWithImpl(_$RestoreArchieveCardsImpl _value,
      $Res Function(_$RestoreArchieveCardsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardId = null,
  }) {
    return _then(_$RestoreArchieveCardsImpl(
      cardId: null == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RestoreArchieveCardsImpl implements RestoreArchieveCards {
  const _$RestoreArchieveCardsImpl({required this.cardId});

  @override
  final int cardId;

  @override
  String toString() {
    return 'CardEvent.restoreArchieveCards(cardId: $cardId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestoreArchieveCardsImpl &&
            (identical(other.cardId, cardId) || other.cardId == cardId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cardId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestoreArchieveCardsImplCopyWith<_$RestoreArchieveCardsImpl>
      get copyWith =>
          __$$RestoreArchieveCardsImplCopyWithImpl<_$RestoreArchieveCardsImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool call) getCards,
    required TResult Function() getCardsnextPage,
    required TResult Function(int id) getCardyUserId,
    required TResult Function(int id) getCardyCardId,
    required TResult Function(int id) setDefault,
    required TResult Function(int id) deleteCard,
    required TResult Function(int id) archiveCard,
    required TResult Function(bool isLoad) getArchievedCards,
    required TResult Function() getArchievedCardsEvent,
    required TResult Function(int cardId) restoreArchieveCards,
  }) {
    return restoreArchieveCards(cardId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool call)? getCards,
    TResult? Function()? getCardsnextPage,
    TResult? Function(int id)? getCardyUserId,
    TResult? Function(int id)? getCardyCardId,
    TResult? Function(int id)? setDefault,
    TResult? Function(int id)? deleteCard,
    TResult? Function(int id)? archiveCard,
    TResult? Function(bool isLoad)? getArchievedCards,
    TResult? Function()? getArchievedCardsEvent,
    TResult? Function(int cardId)? restoreArchieveCards,
  }) {
    return restoreArchieveCards?.call(cardId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool call)? getCards,
    TResult Function()? getCardsnextPage,
    TResult Function(int id)? getCardyUserId,
    TResult Function(int id)? getCardyCardId,
    TResult Function(int id)? setDefault,
    TResult Function(int id)? deleteCard,
    TResult Function(int id)? archiveCard,
    TResult Function(bool isLoad)? getArchievedCards,
    TResult Function()? getArchievedCardsEvent,
    TResult Function(int cardId)? restoreArchieveCards,
    required TResult orElse(),
  }) {
    if (restoreArchieveCards != null) {
      return restoreArchieveCards(cardId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCards value) getCards,
    required TResult Function(GetCardsnextPage value) getCardsnextPage,
    required TResult Function(GetCardyUserId value) getCardyUserId,
    required TResult Function(GetCardyCardId value) getCardyCardId,
    required TResult Function(SetDefault value) setDefault,
    required TResult Function(DeleteCard value) deleteCard,
    required TResult Function(ArchiveCard value) archiveCard,
    required TResult Function(GetArchievedCards value) getArchievedCards,
    required TResult Function(GetArchievedCardsEvent value)
        getArchievedCardsEvent,
    required TResult Function(RestoreArchieveCards value) restoreArchieveCards,
  }) {
    return restoreArchieveCards(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCards value)? getCards,
    TResult? Function(GetCardsnextPage value)? getCardsnextPage,
    TResult? Function(GetCardyUserId value)? getCardyUserId,
    TResult? Function(GetCardyCardId value)? getCardyCardId,
    TResult? Function(SetDefault value)? setDefault,
    TResult? Function(DeleteCard value)? deleteCard,
    TResult? Function(ArchiveCard value)? archiveCard,
    TResult? Function(GetArchievedCards value)? getArchievedCards,
    TResult? Function(GetArchievedCardsEvent value)? getArchievedCardsEvent,
    TResult? Function(RestoreArchieveCards value)? restoreArchieveCards,
  }) {
    return restoreArchieveCards?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCards value)? getCards,
    TResult Function(GetCardsnextPage value)? getCardsnextPage,
    TResult Function(GetCardyUserId value)? getCardyUserId,
    TResult Function(GetCardyCardId value)? getCardyCardId,
    TResult Function(SetDefault value)? setDefault,
    TResult Function(DeleteCard value)? deleteCard,
    TResult Function(ArchiveCard value)? archiveCard,
    TResult Function(GetArchievedCards value)? getArchievedCards,
    TResult Function(GetArchievedCardsEvent value)? getArchievedCardsEvent,
    TResult Function(RestoreArchieveCards value)? restoreArchieveCards,
    required TResult orElse(),
  }) {
    if (restoreArchieveCards != null) {
      return restoreArchieveCards(this);
    }
    return orElse();
  }
}

abstract class RestoreArchieveCards implements CardEvent {
  const factory RestoreArchieveCards({required final int cardId}) =
      _$RestoreArchieveCardsImpl;

  int get cardId;
  @JsonKey(ignore: true)
  _$$RestoreArchieveCardsImplCopyWith<_$RestoreArchieveCardsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CardState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get pageLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  bool get businessUser => throw _privateConstructorUsedError;
  List<CardResponse> get cards => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<ArcheivedCard>? get archievedCards => throw _privateConstructorUsedError;
  CardResponse? get defaultCard => throw _privateConstructorUsedError;
  Card? get anotherCard => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CardStateCopyWith<CardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardStateCopyWith<$Res> {
  factory $CardStateCopyWith(CardState value, $Res Function(CardState) then) =
      _$CardStateCopyWithImpl<$Res, CardState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool pageLoading,
      bool hasError,
      bool businessUser,
      List<CardResponse> cards,
      String? message,
      List<ArcheivedCard>? archievedCards,
      CardResponse? defaultCard,
      Card? anotherCard});
}

/// @nodoc
class _$CardStateCopyWithImpl<$Res, $Val extends CardState>
    implements $CardStateCopyWith<$Res> {
  _$CardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? pageLoading = null,
    Object? hasError = null,
    Object? businessUser = null,
    Object? cards = null,
    Object? message = freezed,
    Object? archievedCards = freezed,
    Object? defaultCard = freezed,
    Object? anotherCard = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      pageLoading: null == pageLoading
          ? _value.pageLoading
          : pageLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      businessUser: null == businessUser
          ? _value.businessUser
          : businessUser // ignore: cast_nullable_to_non_nullable
              as bool,
      cards: null == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<CardResponse>,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      archievedCards: freezed == archievedCards
          ? _value.archievedCards
          : archievedCards // ignore: cast_nullable_to_non_nullable
              as List<ArcheivedCard>?,
      defaultCard: freezed == defaultCard
          ? _value.defaultCard
          : defaultCard // ignore: cast_nullable_to_non_nullable
              as CardResponse?,
      anotherCard: freezed == anotherCard
          ? _value.anotherCard
          : anotherCard // ignore: cast_nullable_to_non_nullable
              as Card?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $CardStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool pageLoading,
      bool hasError,
      bool businessUser,
      List<CardResponse> cards,
      String? message,
      List<ArcheivedCard>? archievedCards,
      CardResponse? defaultCard,
      Card? anotherCard});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CardStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? pageLoading = null,
    Object? hasError = null,
    Object? businessUser = null,
    Object? cards = null,
    Object? message = freezed,
    Object? archievedCards = freezed,
    Object? defaultCard = freezed,
    Object? anotherCard = freezed,
  }) {
    return _then(_$InitialImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      pageLoading: null == pageLoading
          ? _value.pageLoading
          : pageLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      businessUser: null == businessUser
          ? _value.businessUser
          : businessUser // ignore: cast_nullable_to_non_nullable
              as bool,
      cards: null == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<CardResponse>,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      archievedCards: freezed == archievedCards
          ? _value._archievedCards
          : archievedCards // ignore: cast_nullable_to_non_nullable
              as List<ArcheivedCard>?,
      defaultCard: freezed == defaultCard
          ? _value.defaultCard
          : defaultCard // ignore: cast_nullable_to_non_nullable
              as CardResponse?,
      anotherCard: freezed == anotherCard
          ? _value.anotherCard
          : anotherCard // ignore: cast_nullable_to_non_nullable
              as Card?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.isLoading,
      required this.pageLoading,
      required this.hasError,
      required this.businessUser,
      required final List<CardResponse> cards,
      this.message,
      final List<ArcheivedCard>? archievedCards,
      this.defaultCard,
      this.anotherCard})
      : _cards = cards,
        _archievedCards = archievedCards;

  @override
  final bool isLoading;
  @override
  final bool pageLoading;
  @override
  final bool hasError;
  @override
  final bool businessUser;
  final List<CardResponse> _cards;
  @override
  List<CardResponse> get cards {
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cards);
  }

  @override
  final String? message;
  final List<ArcheivedCard>? _archievedCards;
  @override
  List<ArcheivedCard>? get archievedCards {
    final value = _archievedCards;
    if (value == null) return null;
    if (_archievedCards is EqualUnmodifiableListView) return _archievedCards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final CardResponse? defaultCard;
  @override
  final Card? anotherCard;

  @override
  String toString() {
    return 'CardState(isLoading: $isLoading, pageLoading: $pageLoading, hasError: $hasError, businessUser: $businessUser, cards: $cards, message: $message, archievedCards: $archievedCards, defaultCard: $defaultCard, anotherCard: $anotherCard)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.pageLoading, pageLoading) ||
                other.pageLoading == pageLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.businessUser, businessUser) ||
                other.businessUser == businessUser) &&
            const DeepCollectionEquality().equals(other._cards, _cards) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._archievedCards, _archievedCards) &&
            (identical(other.defaultCard, defaultCard) ||
                other.defaultCard == defaultCard) &&
            (identical(other.anotherCard, anotherCard) ||
                other.anotherCard == anotherCard));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      pageLoading,
      hasError,
      businessUser,
      const DeepCollectionEquality().hash(_cards),
      message,
      const DeepCollectionEquality().hash(_archievedCards),
      defaultCard,
      anotherCard);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements CardState {
  const factory _Initial(
      {required final bool isLoading,
      required final bool pageLoading,
      required final bool hasError,
      required final bool businessUser,
      required final List<CardResponse> cards,
      final String? message,
      final List<ArcheivedCard>? archievedCards,
      final CardResponse? defaultCard,
      final Card? anotherCard}) = _$InitialImpl;

  @override
  bool get isLoading;
  @override
  bool get pageLoading;
  @override
  bool get hasError;
  @override
  bool get businessUser;
  @override
  List<CardResponse> get cards;
  @override
  String? get message;
  @override
  List<ArcheivedCard>? get archievedCards;
  @override
  CardResponse? get defaultCard;
  @override
  Card? get anotherCard;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
