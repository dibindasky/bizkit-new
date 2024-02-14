// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contacts_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ContactsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getContactsList,
    required TResult Function(List<Contact> contactList) checkContactsInBizkit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getContactsList,
    TResult? Function(List<Contact> contactList)? checkContactsInBizkit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getContactsList,
    TResult Function(List<Contact> contactList)? checkContactsInBizkit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetContactsList value) getContactsList,
    required TResult Function(CheckContactsInBizkit value)
        checkContactsInBizkit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetContactsList value)? getContactsList,
    TResult? Function(CheckContactsInBizkit value)? checkContactsInBizkit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetContactsList value)? getContactsList,
    TResult Function(CheckContactsInBizkit value)? checkContactsInBizkit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactsEventCopyWith<$Res> {
  factory $ContactsEventCopyWith(
          ContactsEvent value, $Res Function(ContactsEvent) then) =
      _$ContactsEventCopyWithImpl<$Res, ContactsEvent>;
}

/// @nodoc
class _$ContactsEventCopyWithImpl<$Res, $Val extends ContactsEvent>
    implements $ContactsEventCopyWith<$Res> {
  _$ContactsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetContactsListImplCopyWith<$Res> {
  factory _$$GetContactsListImplCopyWith(_$GetContactsListImpl value,
          $Res Function(_$GetContactsListImpl) then) =
      __$$GetContactsListImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetContactsListImplCopyWithImpl<$Res>
    extends _$ContactsEventCopyWithImpl<$Res, _$GetContactsListImpl>
    implements _$$GetContactsListImplCopyWith<$Res> {
  __$$GetContactsListImplCopyWithImpl(
      _$GetContactsListImpl _value, $Res Function(_$GetContactsListImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetContactsListImpl implements GetContactsList {
  const _$GetContactsListImpl();

  @override
  String toString() {
    return 'ContactsEvent.getContactsList()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetContactsListImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getContactsList,
    required TResult Function(List<Contact> contactList) checkContactsInBizkit,
  }) {
    return getContactsList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getContactsList,
    TResult? Function(List<Contact> contactList)? checkContactsInBizkit,
  }) {
    return getContactsList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getContactsList,
    TResult Function(List<Contact> contactList)? checkContactsInBizkit,
    required TResult orElse(),
  }) {
    if (getContactsList != null) {
      return getContactsList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetContactsList value) getContactsList,
    required TResult Function(CheckContactsInBizkit value)
        checkContactsInBizkit,
  }) {
    return getContactsList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetContactsList value)? getContactsList,
    TResult? Function(CheckContactsInBizkit value)? checkContactsInBizkit,
  }) {
    return getContactsList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetContactsList value)? getContactsList,
    TResult Function(CheckContactsInBizkit value)? checkContactsInBizkit,
    required TResult orElse(),
  }) {
    if (getContactsList != null) {
      return getContactsList(this);
    }
    return orElse();
  }
}

abstract class GetContactsList implements ContactsEvent {
  const factory GetContactsList() = _$GetContactsListImpl;
}

/// @nodoc
abstract class _$$CheckContactsInBizkitImplCopyWith<$Res> {
  factory _$$CheckContactsInBizkitImplCopyWith(
          _$CheckContactsInBizkitImpl value,
          $Res Function(_$CheckContactsInBizkitImpl) then) =
      __$$CheckContactsInBizkitImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Contact> contactList});
}

/// @nodoc
class __$$CheckContactsInBizkitImplCopyWithImpl<$Res>
    extends _$ContactsEventCopyWithImpl<$Res, _$CheckContactsInBizkitImpl>
    implements _$$CheckContactsInBizkitImplCopyWith<$Res> {
  __$$CheckContactsInBizkitImplCopyWithImpl(_$CheckContactsInBizkitImpl _value,
      $Res Function(_$CheckContactsInBizkitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contactList = null,
  }) {
    return _then(_$CheckContactsInBizkitImpl(
      contactList: null == contactList
          ? _value._contactList
          : contactList // ignore: cast_nullable_to_non_nullable
              as List<Contact>,
    ));
  }
}

/// @nodoc

class _$CheckContactsInBizkitImpl implements CheckContactsInBizkit {
  const _$CheckContactsInBizkitImpl({required final List<Contact> contactList})
      : _contactList = contactList;

  final List<Contact> _contactList;
  @override
  List<Contact> get contactList {
    if (_contactList is EqualUnmodifiableListView) return _contactList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contactList);
  }

  @override
  String toString() {
    return 'ContactsEvent.checkContactsInBizkit(contactList: $contactList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckContactsInBizkitImpl &&
            const DeepCollectionEquality()
                .equals(other._contactList, _contactList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_contactList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckContactsInBizkitImplCopyWith<_$CheckContactsInBizkitImpl>
      get copyWith => __$$CheckContactsInBizkitImplCopyWithImpl<
          _$CheckContactsInBizkitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getContactsList,
    required TResult Function(List<Contact> contactList) checkContactsInBizkit,
  }) {
    return checkContactsInBizkit(contactList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getContactsList,
    TResult? Function(List<Contact> contactList)? checkContactsInBizkit,
  }) {
    return checkContactsInBizkit?.call(contactList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getContactsList,
    TResult Function(List<Contact> contactList)? checkContactsInBizkit,
    required TResult orElse(),
  }) {
    if (checkContactsInBizkit != null) {
      return checkContactsInBizkit(contactList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetContactsList value) getContactsList,
    required TResult Function(CheckContactsInBizkit value)
        checkContactsInBizkit,
  }) {
    return checkContactsInBizkit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetContactsList value)? getContactsList,
    TResult? Function(CheckContactsInBizkit value)? checkContactsInBizkit,
  }) {
    return checkContactsInBizkit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetContactsList value)? getContactsList,
    TResult Function(CheckContactsInBizkit value)? checkContactsInBizkit,
    required TResult orElse(),
  }) {
    if (checkContactsInBizkit != null) {
      return checkContactsInBizkit(this);
    }
    return orElse();
  }
}

abstract class CheckContactsInBizkit implements ContactsEvent {
  const factory CheckContactsInBizkit(
      {required final List<Contact> contactList}) = _$CheckContactsInBizkitImpl;

  List<Contact> get contactList;
  @JsonKey(ignore: true)
  _$$CheckContactsInBizkitImplCopyWith<_$CheckContactsInBizkitImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ContactsState {
  bool get loading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<ContactModel>? get contactList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContactsStateCopyWith<ContactsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactsStateCopyWith<$Res> {
  factory $ContactsStateCopyWith(
          ContactsState value, $Res Function(ContactsState) then) =
      _$ContactsStateCopyWithImpl<$Res, ContactsState>;
  @useResult
  $Res call(
      {bool loading,
      bool hasError,
      String? message,
      List<ContactModel>? contactList});
}

/// @nodoc
class _$ContactsStateCopyWithImpl<$Res, $Val extends ContactsState>
    implements $ContactsStateCopyWith<$Res> {
  _$ContactsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? hasError = null,
    Object? message = freezed,
    Object? contactList = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      contactList: freezed == contactList
          ? _value.contactList
          : contactList // ignore: cast_nullable_to_non_nullable
              as List<ContactModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $ContactsStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      bool hasError,
      String? message,
      List<ContactModel>? contactList});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ContactsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? hasError = null,
    Object? message = freezed,
    Object? contactList = freezed,
  }) {
    return _then(_$InitialImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      contactList: freezed == contactList
          ? _value._contactList
          : contactList // ignore: cast_nullable_to_non_nullable
              as List<ContactModel>?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.loading,
      required this.hasError,
      this.message,
      final List<ContactModel>? contactList})
      : _contactList = contactList;

  @override
  final bool loading;
  @override
  final bool hasError;
  @override
  final String? message;
  final List<ContactModel>? _contactList;
  @override
  List<ContactModel>? get contactList {
    final value = _contactList;
    if (value == null) return null;
    if (_contactList is EqualUnmodifiableListView) return _contactList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ContactsState(loading: $loading, hasError: $hasError, message: $message, contactList: $contactList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._contactList, _contactList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, hasError, message,
      const DeepCollectionEquality().hash(_contactList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements ContactsState {
  const factory _Initial(
      {required final bool loading,
      required final bool hasError,
      final String? message,
      final List<ContactModel>? contactList}) = _$InitialImpl;

  @override
  bool get loading;
  @override
  bool get hasError;
  @override
  String? get message;
  @override
  List<ContactModel>? get contactList;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
