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
    required TResult Function() getConnections,
    required TResult Function(String query) searchContact,
    required TResult Function() getConnectionsFromLocalStorage,
    required TResult Function(List<Contact> contactList) checkContactsInBizkit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getContactsList,
    TResult? Function()? getConnections,
    TResult? Function(String query)? searchContact,
    TResult? Function()? getConnectionsFromLocalStorage,
    TResult? Function(List<Contact> contactList)? checkContactsInBizkit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getContactsList,
    TResult Function()? getConnections,
    TResult Function(String query)? searchContact,
    TResult Function()? getConnectionsFromLocalStorage,
    TResult Function(List<Contact> contactList)? checkContactsInBizkit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetContactsList value) getContactsList,
    required TResult Function(GetConnections value) getConnections,
    required TResult Function(SearchContact value) searchContact,
    required TResult Function(GetConnectionsFromLocalStorage value)
        getConnectionsFromLocalStorage,
    required TResult Function(CheckContactsInBizkit value)
        checkContactsInBizkit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetContactsList value)? getContactsList,
    TResult? Function(GetConnections value)? getConnections,
    TResult? Function(SearchContact value)? searchContact,
    TResult? Function(GetConnectionsFromLocalStorage value)?
        getConnectionsFromLocalStorage,
    TResult? Function(CheckContactsInBizkit value)? checkContactsInBizkit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetContactsList value)? getContactsList,
    TResult Function(GetConnections value)? getConnections,
    TResult Function(SearchContact value)? searchContact,
    TResult Function(GetConnectionsFromLocalStorage value)?
        getConnectionsFromLocalStorage,
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
    required TResult Function() getConnections,
    required TResult Function(String query) searchContact,
    required TResult Function() getConnectionsFromLocalStorage,
    required TResult Function(List<Contact> contactList) checkContactsInBizkit,
  }) {
    return getContactsList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getContactsList,
    TResult? Function()? getConnections,
    TResult? Function(String query)? searchContact,
    TResult? Function()? getConnectionsFromLocalStorage,
    TResult? Function(List<Contact> contactList)? checkContactsInBizkit,
  }) {
    return getContactsList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getContactsList,
    TResult Function()? getConnections,
    TResult Function(String query)? searchContact,
    TResult Function()? getConnectionsFromLocalStorage,
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
    required TResult Function(GetConnections value) getConnections,
    required TResult Function(SearchContact value) searchContact,
    required TResult Function(GetConnectionsFromLocalStorage value)
        getConnectionsFromLocalStorage,
    required TResult Function(CheckContactsInBizkit value)
        checkContactsInBizkit,
  }) {
    return getContactsList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetContactsList value)? getContactsList,
    TResult? Function(GetConnections value)? getConnections,
    TResult? Function(SearchContact value)? searchContact,
    TResult? Function(GetConnectionsFromLocalStorage value)?
        getConnectionsFromLocalStorage,
    TResult? Function(CheckContactsInBizkit value)? checkContactsInBizkit,
  }) {
    return getContactsList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetContactsList value)? getContactsList,
    TResult Function(GetConnections value)? getConnections,
    TResult Function(SearchContact value)? searchContact,
    TResult Function(GetConnectionsFromLocalStorage value)?
        getConnectionsFromLocalStorage,
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
abstract class _$$GetConnectionsImplCopyWith<$Res> {
  factory _$$GetConnectionsImplCopyWith(_$GetConnectionsImpl value,
          $Res Function(_$GetConnectionsImpl) then) =
      __$$GetConnectionsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetConnectionsImplCopyWithImpl<$Res>
    extends _$ContactsEventCopyWithImpl<$Res, _$GetConnectionsImpl>
    implements _$$GetConnectionsImplCopyWith<$Res> {
  __$$GetConnectionsImplCopyWithImpl(
      _$GetConnectionsImpl _value, $Res Function(_$GetConnectionsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetConnectionsImpl implements GetConnections {
  const _$GetConnectionsImpl();

  @override
  String toString() {
    return 'ContactsEvent.getConnections()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetConnectionsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getContactsList,
    required TResult Function() getConnections,
    required TResult Function(String query) searchContact,
    required TResult Function() getConnectionsFromLocalStorage,
    required TResult Function(List<Contact> contactList) checkContactsInBizkit,
  }) {
    return getConnections();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getContactsList,
    TResult? Function()? getConnections,
    TResult? Function(String query)? searchContact,
    TResult? Function()? getConnectionsFromLocalStorage,
    TResult? Function(List<Contact> contactList)? checkContactsInBizkit,
  }) {
    return getConnections?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getContactsList,
    TResult Function()? getConnections,
    TResult Function(String query)? searchContact,
    TResult Function()? getConnectionsFromLocalStorage,
    TResult Function(List<Contact> contactList)? checkContactsInBizkit,
    required TResult orElse(),
  }) {
    if (getConnections != null) {
      return getConnections();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetContactsList value) getContactsList,
    required TResult Function(GetConnections value) getConnections,
    required TResult Function(SearchContact value) searchContact,
    required TResult Function(GetConnectionsFromLocalStorage value)
        getConnectionsFromLocalStorage,
    required TResult Function(CheckContactsInBizkit value)
        checkContactsInBizkit,
  }) {
    return getConnections(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetContactsList value)? getContactsList,
    TResult? Function(GetConnections value)? getConnections,
    TResult? Function(SearchContact value)? searchContact,
    TResult? Function(GetConnectionsFromLocalStorage value)?
        getConnectionsFromLocalStorage,
    TResult? Function(CheckContactsInBizkit value)? checkContactsInBizkit,
  }) {
    return getConnections?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetContactsList value)? getContactsList,
    TResult Function(GetConnections value)? getConnections,
    TResult Function(SearchContact value)? searchContact,
    TResult Function(GetConnectionsFromLocalStorage value)?
        getConnectionsFromLocalStorage,
    TResult Function(CheckContactsInBizkit value)? checkContactsInBizkit,
    required TResult orElse(),
  }) {
    if (getConnections != null) {
      return getConnections(this);
    }
    return orElse();
  }
}

abstract class GetConnections implements ContactsEvent {
  const factory GetConnections() = _$GetConnectionsImpl;
}

/// @nodoc
abstract class _$$SearchContactImplCopyWith<$Res> {
  factory _$$SearchContactImplCopyWith(
          _$SearchContactImpl value, $Res Function(_$SearchContactImpl) then) =
      __$$SearchContactImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchContactImplCopyWithImpl<$Res>
    extends _$ContactsEventCopyWithImpl<$Res, _$SearchContactImpl>
    implements _$$SearchContactImplCopyWith<$Res> {
  __$$SearchContactImplCopyWithImpl(
      _$SearchContactImpl _value, $Res Function(_$SearchContactImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$SearchContactImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchContactImpl implements SearchContact {
  const _$SearchContactImpl({required this.query});

  @override
  final String query;

  @override
  String toString() {
    return 'ContactsEvent.searchContact(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchContactImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchContactImplCopyWith<_$SearchContactImpl> get copyWith =>
      __$$SearchContactImplCopyWithImpl<_$SearchContactImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getContactsList,
    required TResult Function() getConnections,
    required TResult Function(String query) searchContact,
    required TResult Function() getConnectionsFromLocalStorage,
    required TResult Function(List<Contact> contactList) checkContactsInBizkit,
  }) {
    return searchContact(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getContactsList,
    TResult? Function()? getConnections,
    TResult? Function(String query)? searchContact,
    TResult? Function()? getConnectionsFromLocalStorage,
    TResult? Function(List<Contact> contactList)? checkContactsInBizkit,
  }) {
    return searchContact?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getContactsList,
    TResult Function()? getConnections,
    TResult Function(String query)? searchContact,
    TResult Function()? getConnectionsFromLocalStorage,
    TResult Function(List<Contact> contactList)? checkContactsInBizkit,
    required TResult orElse(),
  }) {
    if (searchContact != null) {
      return searchContact(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetContactsList value) getContactsList,
    required TResult Function(GetConnections value) getConnections,
    required TResult Function(SearchContact value) searchContact,
    required TResult Function(GetConnectionsFromLocalStorage value)
        getConnectionsFromLocalStorage,
    required TResult Function(CheckContactsInBizkit value)
        checkContactsInBizkit,
  }) {
    return searchContact(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetContactsList value)? getContactsList,
    TResult? Function(GetConnections value)? getConnections,
    TResult? Function(SearchContact value)? searchContact,
    TResult? Function(GetConnectionsFromLocalStorage value)?
        getConnectionsFromLocalStorage,
    TResult? Function(CheckContactsInBizkit value)? checkContactsInBizkit,
  }) {
    return searchContact?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetContactsList value)? getContactsList,
    TResult Function(GetConnections value)? getConnections,
    TResult Function(SearchContact value)? searchContact,
    TResult Function(GetConnectionsFromLocalStorage value)?
        getConnectionsFromLocalStorage,
    TResult Function(CheckContactsInBizkit value)? checkContactsInBizkit,
    required TResult orElse(),
  }) {
    if (searchContact != null) {
      return searchContact(this);
    }
    return orElse();
  }
}

abstract class SearchContact implements ContactsEvent {
  const factory SearchContact({required final String query}) =
      _$SearchContactImpl;

  String get query;
  @JsonKey(ignore: true)
  _$$SearchContactImplCopyWith<_$SearchContactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetConnectionsFromLocalStorageImplCopyWith<$Res> {
  factory _$$GetConnectionsFromLocalStorageImplCopyWith(
          _$GetConnectionsFromLocalStorageImpl value,
          $Res Function(_$GetConnectionsFromLocalStorageImpl) then) =
      __$$GetConnectionsFromLocalStorageImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetConnectionsFromLocalStorageImplCopyWithImpl<$Res>
    extends _$ContactsEventCopyWithImpl<$Res,
        _$GetConnectionsFromLocalStorageImpl>
    implements _$$GetConnectionsFromLocalStorageImplCopyWith<$Res> {
  __$$GetConnectionsFromLocalStorageImplCopyWithImpl(
      _$GetConnectionsFromLocalStorageImpl _value,
      $Res Function(_$GetConnectionsFromLocalStorageImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetConnectionsFromLocalStorageImpl
    implements GetConnectionsFromLocalStorage {
  const _$GetConnectionsFromLocalStorageImpl();

  @override
  String toString() {
    return 'ContactsEvent.getConnectionsFromLocalStorage()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetConnectionsFromLocalStorageImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getContactsList,
    required TResult Function() getConnections,
    required TResult Function(String query) searchContact,
    required TResult Function() getConnectionsFromLocalStorage,
    required TResult Function(List<Contact> contactList) checkContactsInBizkit,
  }) {
    return getConnectionsFromLocalStorage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getContactsList,
    TResult? Function()? getConnections,
    TResult? Function(String query)? searchContact,
    TResult? Function()? getConnectionsFromLocalStorage,
    TResult? Function(List<Contact> contactList)? checkContactsInBizkit,
  }) {
    return getConnectionsFromLocalStorage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getContactsList,
    TResult Function()? getConnections,
    TResult Function(String query)? searchContact,
    TResult Function()? getConnectionsFromLocalStorage,
    TResult Function(List<Contact> contactList)? checkContactsInBizkit,
    required TResult orElse(),
  }) {
    if (getConnectionsFromLocalStorage != null) {
      return getConnectionsFromLocalStorage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetContactsList value) getContactsList,
    required TResult Function(GetConnections value) getConnections,
    required TResult Function(SearchContact value) searchContact,
    required TResult Function(GetConnectionsFromLocalStorage value)
        getConnectionsFromLocalStorage,
    required TResult Function(CheckContactsInBizkit value)
        checkContactsInBizkit,
  }) {
    return getConnectionsFromLocalStorage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetContactsList value)? getContactsList,
    TResult? Function(GetConnections value)? getConnections,
    TResult? Function(SearchContact value)? searchContact,
    TResult? Function(GetConnectionsFromLocalStorage value)?
        getConnectionsFromLocalStorage,
    TResult? Function(CheckContactsInBizkit value)? checkContactsInBizkit,
  }) {
    return getConnectionsFromLocalStorage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetContactsList value)? getContactsList,
    TResult Function(GetConnections value)? getConnections,
    TResult Function(SearchContact value)? searchContact,
    TResult Function(GetConnectionsFromLocalStorage value)?
        getConnectionsFromLocalStorage,
    TResult Function(CheckContactsInBizkit value)? checkContactsInBizkit,
    required TResult orElse(),
  }) {
    if (getConnectionsFromLocalStorage != null) {
      return getConnectionsFromLocalStorage(this);
    }
    return orElse();
  }
}

abstract class GetConnectionsFromLocalStorage implements ContactsEvent {
  const factory GetConnectionsFromLocalStorage() =
      _$GetConnectionsFromLocalStorageImpl;
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
    required TResult Function() getConnections,
    required TResult Function(String query) searchContact,
    required TResult Function() getConnectionsFromLocalStorage,
    required TResult Function(List<Contact> contactList) checkContactsInBizkit,
  }) {
    return checkContactsInBizkit(contactList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getContactsList,
    TResult? Function()? getConnections,
    TResult? Function(String query)? searchContact,
    TResult? Function()? getConnectionsFromLocalStorage,
    TResult? Function(List<Contact> contactList)? checkContactsInBizkit,
  }) {
    return checkContactsInBizkit?.call(contactList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getContactsList,
    TResult Function()? getConnections,
    TResult Function(String query)? searchContact,
    TResult Function()? getConnectionsFromLocalStorage,
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
    required TResult Function(GetConnections value) getConnections,
    required TResult Function(SearchContact value) searchContact,
    required TResult Function(GetConnectionsFromLocalStorage value)
        getConnectionsFromLocalStorage,
    required TResult Function(CheckContactsInBizkit value)
        checkContactsInBizkit,
  }) {
    return checkContactsInBizkit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetContactsList value)? getContactsList,
    TResult? Function(GetConnections value)? getConnections,
    TResult? Function(SearchContact value)? searchContact,
    TResult? Function(GetConnectionsFromLocalStorage value)?
        getConnectionsFromLocalStorage,
    TResult? Function(CheckContactsInBizkit value)? checkContactsInBizkit,
  }) {
    return checkContactsInBizkit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetContactsList value)? getContactsList,
    TResult Function(GetConnections value)? getConnections,
    TResult Function(SearchContact value)? searchContact,
    TResult Function(GetConnectionsFromLocalStorage value)?
        getConnectionsFromLocalStorage,
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
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  bool get fetchingLoading => throw _privateConstructorUsedError;
  bool get searchLoading => throw _privateConstructorUsedError;
  bool get firstLoading => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<ContactModel>? get contactList => throw _privateConstructorUsedError;
  List<ContactModel>? get contactFilterdList =>
      throw _privateConstructorUsedError;

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
      {bool isLoading,
      bool hasError,
      bool fetchingLoading,
      bool searchLoading,
      bool firstLoading,
      String? message,
      List<ContactModel>? contactList,
      List<ContactModel>? contactFilterdList});
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
    Object? isLoading = null,
    Object? hasError = null,
    Object? fetchingLoading = null,
    Object? searchLoading = null,
    Object? firstLoading = null,
    Object? message = freezed,
    Object? contactList = freezed,
    Object? contactFilterdList = freezed,
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
      fetchingLoading: null == fetchingLoading
          ? _value.fetchingLoading
          : fetchingLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      searchLoading: null == searchLoading
          ? _value.searchLoading
          : searchLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      firstLoading: null == firstLoading
          ? _value.firstLoading
          : firstLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      contactList: freezed == contactList
          ? _value.contactList
          : contactList // ignore: cast_nullable_to_non_nullable
              as List<ContactModel>?,
      contactFilterdList: freezed == contactFilterdList
          ? _value.contactFilterdList
          : contactFilterdList // ignore: cast_nullable_to_non_nullable
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
      {bool isLoading,
      bool hasError,
      bool fetchingLoading,
      bool searchLoading,
      bool firstLoading,
      String? message,
      List<ContactModel>? contactList,
      List<ContactModel>? contactFilterdList});
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
    Object? isLoading = null,
    Object? hasError = null,
    Object? fetchingLoading = null,
    Object? searchLoading = null,
    Object? firstLoading = null,
    Object? message = freezed,
    Object? contactList = freezed,
    Object? contactFilterdList = freezed,
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
      fetchingLoading: null == fetchingLoading
          ? _value.fetchingLoading
          : fetchingLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      searchLoading: null == searchLoading
          ? _value.searchLoading
          : searchLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      firstLoading: null == firstLoading
          ? _value.firstLoading
          : firstLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      contactList: freezed == contactList
          ? _value._contactList
          : contactList // ignore: cast_nullable_to_non_nullable
              as List<ContactModel>?,
      contactFilterdList: freezed == contactFilterdList
          ? _value._contactFilterdList
          : contactFilterdList // ignore: cast_nullable_to_non_nullable
              as List<ContactModel>?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.isLoading,
      required this.hasError,
      required this.fetchingLoading,
      required this.searchLoading,
      required this.firstLoading,
      this.message,
      final List<ContactModel>? contactList,
      final List<ContactModel>? contactFilterdList})
      : _contactList = contactList,
        _contactFilterdList = contactFilterdList;

  @override
  final bool isLoading;
  @override
  final bool hasError;
  @override
  final bool fetchingLoading;
  @override
  final bool searchLoading;
  @override
  final bool firstLoading;
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

  final List<ContactModel>? _contactFilterdList;
  @override
  List<ContactModel>? get contactFilterdList {
    final value = _contactFilterdList;
    if (value == null) return null;
    if (_contactFilterdList is EqualUnmodifiableListView)
      return _contactFilterdList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ContactsState(isLoading: $isLoading, hasError: $hasError, fetchingLoading: $fetchingLoading, searchLoading: $searchLoading, firstLoading: $firstLoading, message: $message, contactList: $contactList, contactFilterdList: $contactFilterdList)';
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
            (identical(other.fetchingLoading, fetchingLoading) ||
                other.fetchingLoading == fetchingLoading) &&
            (identical(other.searchLoading, searchLoading) ||
                other.searchLoading == searchLoading) &&
            (identical(other.firstLoading, firstLoading) ||
                other.firstLoading == firstLoading) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._contactList, _contactList) &&
            const DeepCollectionEquality()
                .equals(other._contactFilterdList, _contactFilterdList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      hasError,
      fetchingLoading,
      searchLoading,
      firstLoading,
      message,
      const DeepCollectionEquality().hash(_contactList),
      const DeepCollectionEquality().hash(_contactFilterdList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements ContactsState {
  const factory _Initial(
      {required final bool isLoading,
      required final bool hasError,
      required final bool fetchingLoading,
      required final bool searchLoading,
      required final bool firstLoading,
      final String? message,
      final List<ContactModel>? contactList,
      final List<ContactModel>? contactFilterdList}) = _$InitialImpl;

  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  bool get fetchingLoading;
  @override
  bool get searchLoading;
  @override
  bool get firstLoading;
  @override
  String? get message;
  @override
  List<ContactModel>? get contactList;
  @override
  List<ContactModel>? get contactFilterdList;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
