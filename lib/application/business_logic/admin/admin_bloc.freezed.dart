// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AdminEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoad) getCompanyUsers,
    required TResult Function(String id) removeIndiVidualusersPartOfBusiness,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoad)? getCompanyUsers,
    TResult? Function(String id)? removeIndiVidualusersPartOfBusiness,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoad)? getCompanyUsers,
    TResult Function(String id)? removeIndiVidualusersPartOfBusiness,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCompanyUsers value) getCompanyUsers,
    required TResult Function(RemoveIndiVidualusersPartOfBusiness value)
        removeIndiVidualusersPartOfBusiness,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCompanyUsers value)? getCompanyUsers,
    TResult? Function(RemoveIndiVidualusersPartOfBusiness value)?
        removeIndiVidualusersPartOfBusiness,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCompanyUsers value)? getCompanyUsers,
    TResult Function(RemoveIndiVidualusersPartOfBusiness value)?
        removeIndiVidualusersPartOfBusiness,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminEventCopyWith<$Res> {
  factory $AdminEventCopyWith(
          AdminEvent value, $Res Function(AdminEvent) then) =
      _$AdminEventCopyWithImpl<$Res, AdminEvent>;
}

/// @nodoc
class _$AdminEventCopyWithImpl<$Res, $Val extends AdminEvent>
    implements $AdminEventCopyWith<$Res> {
  _$AdminEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetCompanyUsersImplCopyWith<$Res> {
  factory _$$GetCompanyUsersImplCopyWith(_$GetCompanyUsersImpl value,
          $Res Function(_$GetCompanyUsersImpl) then) =
      __$$GetCompanyUsersImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isLoad});
}

/// @nodoc
class __$$GetCompanyUsersImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$GetCompanyUsersImpl>
    implements _$$GetCompanyUsersImplCopyWith<$Res> {
  __$$GetCompanyUsersImplCopyWithImpl(
      _$GetCompanyUsersImpl _value, $Res Function(_$GetCompanyUsersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoad = null,
  }) {
    return _then(_$GetCompanyUsersImpl(
      isLoad: null == isLoad
          ? _value.isLoad
          : isLoad // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GetCompanyUsersImpl implements GetCompanyUsers {
  const _$GetCompanyUsersImpl({required this.isLoad});

  @override
  final bool isLoad;

  @override
  String toString() {
    return 'AdminEvent.getCompanyUsers(isLoad: $isLoad)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCompanyUsersImpl &&
            (identical(other.isLoad, isLoad) || other.isLoad == isLoad));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoad);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCompanyUsersImplCopyWith<_$GetCompanyUsersImpl> get copyWith =>
      __$$GetCompanyUsersImplCopyWithImpl<_$GetCompanyUsersImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoad) getCompanyUsers,
    required TResult Function(String id) removeIndiVidualusersPartOfBusiness,
  }) {
    return getCompanyUsers(isLoad);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoad)? getCompanyUsers,
    TResult? Function(String id)? removeIndiVidualusersPartOfBusiness,
  }) {
    return getCompanyUsers?.call(isLoad);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoad)? getCompanyUsers,
    TResult Function(String id)? removeIndiVidualusersPartOfBusiness,
    required TResult orElse(),
  }) {
    if (getCompanyUsers != null) {
      return getCompanyUsers(isLoad);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCompanyUsers value) getCompanyUsers,
    required TResult Function(RemoveIndiVidualusersPartOfBusiness value)
        removeIndiVidualusersPartOfBusiness,
  }) {
    return getCompanyUsers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCompanyUsers value)? getCompanyUsers,
    TResult? Function(RemoveIndiVidualusersPartOfBusiness value)?
        removeIndiVidualusersPartOfBusiness,
  }) {
    return getCompanyUsers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCompanyUsers value)? getCompanyUsers,
    TResult Function(RemoveIndiVidualusersPartOfBusiness value)?
        removeIndiVidualusersPartOfBusiness,
    required TResult orElse(),
  }) {
    if (getCompanyUsers != null) {
      return getCompanyUsers(this);
    }
    return orElse();
  }
}

abstract class GetCompanyUsers implements AdminEvent {
  const factory GetCompanyUsers({required final bool isLoad}) =
      _$GetCompanyUsersImpl;

  bool get isLoad;
  @JsonKey(ignore: true)
  _$$GetCompanyUsersImplCopyWith<_$GetCompanyUsersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveIndiVidualusersPartOfBusinessImplCopyWith<$Res> {
  factory _$$RemoveIndiVidualusersPartOfBusinessImplCopyWith(
          _$RemoveIndiVidualusersPartOfBusinessImpl value,
          $Res Function(_$RemoveIndiVidualusersPartOfBusinessImpl) then) =
      __$$RemoveIndiVidualusersPartOfBusinessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$RemoveIndiVidualusersPartOfBusinessImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res,
        _$RemoveIndiVidualusersPartOfBusinessImpl>
    implements _$$RemoveIndiVidualusersPartOfBusinessImplCopyWith<$Res> {
  __$$RemoveIndiVidualusersPartOfBusinessImplCopyWithImpl(
      _$RemoveIndiVidualusersPartOfBusinessImpl _value,
      $Res Function(_$RemoveIndiVidualusersPartOfBusinessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$RemoveIndiVidualusersPartOfBusinessImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemoveIndiVidualusersPartOfBusinessImpl
    implements RemoveIndiVidualusersPartOfBusiness {
  const _$RemoveIndiVidualusersPartOfBusinessImpl({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'AdminEvent.removeIndiVidualusersPartOfBusiness(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveIndiVidualusersPartOfBusinessImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveIndiVidualusersPartOfBusinessImplCopyWith<
          _$RemoveIndiVidualusersPartOfBusinessImpl>
      get copyWith => __$$RemoveIndiVidualusersPartOfBusinessImplCopyWithImpl<
          _$RemoveIndiVidualusersPartOfBusinessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoad) getCompanyUsers,
    required TResult Function(String id) removeIndiVidualusersPartOfBusiness,
  }) {
    return removeIndiVidualusersPartOfBusiness(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoad)? getCompanyUsers,
    TResult? Function(String id)? removeIndiVidualusersPartOfBusiness,
  }) {
    return removeIndiVidualusersPartOfBusiness?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoad)? getCompanyUsers,
    TResult Function(String id)? removeIndiVidualusersPartOfBusiness,
    required TResult orElse(),
  }) {
    if (removeIndiVidualusersPartOfBusiness != null) {
      return removeIndiVidualusersPartOfBusiness(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCompanyUsers value) getCompanyUsers,
    required TResult Function(RemoveIndiVidualusersPartOfBusiness value)
        removeIndiVidualusersPartOfBusiness,
  }) {
    return removeIndiVidualusersPartOfBusiness(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCompanyUsers value)? getCompanyUsers,
    TResult? Function(RemoveIndiVidualusersPartOfBusiness value)?
        removeIndiVidualusersPartOfBusiness,
  }) {
    return removeIndiVidualusersPartOfBusiness?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCompanyUsers value)? getCompanyUsers,
    TResult Function(RemoveIndiVidualusersPartOfBusiness value)?
        removeIndiVidualusersPartOfBusiness,
    required TResult orElse(),
  }) {
    if (removeIndiVidualusersPartOfBusiness != null) {
      return removeIndiVidualusersPartOfBusiness(this);
    }
    return orElse();
  }
}

abstract class RemoveIndiVidualusersPartOfBusiness implements AdminEvent {
  const factory RemoveIndiVidualusersPartOfBusiness(
      {required final String id}) = _$RemoveIndiVidualusersPartOfBusinessImpl;

  String get id;
  @JsonKey(ignore: true)
  _$$RemoveIndiVidualusersPartOfBusinessImplCopyWith<
          _$RemoveIndiVidualusersPartOfBusinessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AdminState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  bool get userBlocked => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<CompanySelectedUsersListModel>? get companySelectedUsersListModel =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AdminStateCopyWith<AdminState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminStateCopyWith<$Res> {
  factory $AdminStateCopyWith(
          AdminState value, $Res Function(AdminState) then) =
      _$AdminStateCopyWithImpl<$Res, AdminState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      bool userBlocked,
      String? message,
      List<CompanySelectedUsersListModel>? companySelectedUsersListModel});
}

/// @nodoc
class _$AdminStateCopyWithImpl<$Res, $Val extends AdminState>
    implements $AdminStateCopyWith<$Res> {
  _$AdminStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? userBlocked = null,
    Object? message = freezed,
    Object? companySelectedUsersListModel = freezed,
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
      userBlocked: null == userBlocked
          ? _value.userBlocked
          : userBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      companySelectedUsersListModel: freezed == companySelectedUsersListModel
          ? _value.companySelectedUsersListModel
          : companySelectedUsersListModel // ignore: cast_nullable_to_non_nullable
              as List<CompanySelectedUsersListModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $AdminStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      bool userBlocked,
      String? message,
      List<CompanySelectedUsersListModel>? companySelectedUsersListModel});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AdminStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? userBlocked = null,
    Object? message = freezed,
    Object? companySelectedUsersListModel = freezed,
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
      userBlocked: null == userBlocked
          ? _value.userBlocked
          : userBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      companySelectedUsersListModel: freezed == companySelectedUsersListModel
          ? _value._companySelectedUsersListModel
          : companySelectedUsersListModel // ignore: cast_nullable_to_non_nullable
              as List<CompanySelectedUsersListModel>?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.isLoading,
      required this.hasError,
      required this.userBlocked,
      this.message,
      final List<CompanySelectedUsersListModel>? companySelectedUsersListModel})
      : _companySelectedUsersListModel = companySelectedUsersListModel;

  @override
  final bool isLoading;
  @override
  final bool hasError;
  @override
  final bool userBlocked;
  @override
  final String? message;
  final List<CompanySelectedUsersListModel>? _companySelectedUsersListModel;
  @override
  List<CompanySelectedUsersListModel>? get companySelectedUsersListModel {
    final value = _companySelectedUsersListModel;
    if (value == null) return null;
    if (_companySelectedUsersListModel is EqualUnmodifiableListView)
      return _companySelectedUsersListModel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AdminState(isLoading: $isLoading, hasError: $hasError, userBlocked: $userBlocked, message: $message, companySelectedUsersListModel: $companySelectedUsersListModel)';
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
            (identical(other.userBlocked, userBlocked) ||
                other.userBlocked == userBlocked) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(
                other._companySelectedUsersListModel,
                _companySelectedUsersListModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      hasError,
      userBlocked,
      message,
      const DeepCollectionEquality().hash(_companySelectedUsersListModel));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements AdminState {
  const factory _Initial(
      {required final bool isLoading,
      required final bool hasError,
      required final bool userBlocked,
      final String? message,
      final List<CompanySelectedUsersListModel>?
          companySelectedUsersListModel}) = _$InitialImpl;

  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  bool get userBlocked;
  @override
  String? get message;
  @override
  List<CompanySelectedUsersListModel>? get companySelectedUsersListModel;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
