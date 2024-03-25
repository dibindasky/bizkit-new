// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connection_request_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ConnectionRequestEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) getBizkitConnections,
    required TResult Function(String query) getBizkitConnectionsNextPage,
    required TResult Function(
            BlockBizkitConnection blockBizkitConnection, int connectionId)
        blockBizkitConnections,
    required TResult Function(
            CreateConnectionWithCardIdModel createConnectionWithCardIdModel)
        addConnection,
    required TResult Function(
            AddConnectionTagModel addConnectionTagModel, int connectionId)
        addTagToBizkitconnection,
    required TResult Function(SearchQuery searchQuery) searchBizkitUsers,
    required TResult Function(
            AddConnectionRequestModel addConnectionRequestModel, int index)
        addConnectionRequests,
    required TResult Function() getRequestLists,
    required TResult Function(int id) deleteRequest,
    required TResult Function() getBlockeConnections,
    required TResult Function() getBlockeConnectionsEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? getBizkitConnections,
    TResult? Function(String query)? getBizkitConnectionsNextPage,
    TResult? Function(
            BlockBizkitConnection blockBizkitConnection, int connectionId)?
        blockBizkitConnections,
    TResult? Function(
            CreateConnectionWithCardIdModel createConnectionWithCardIdModel)?
        addConnection,
    TResult? Function(
            AddConnectionTagModel addConnectionTagModel, int connectionId)?
        addTagToBizkitconnection,
    TResult? Function(SearchQuery searchQuery)? searchBizkitUsers,
    TResult? Function(
            AddConnectionRequestModel addConnectionRequestModel, int index)?
        addConnectionRequests,
    TResult? Function()? getRequestLists,
    TResult? Function(int id)? deleteRequest,
    TResult? Function()? getBlockeConnections,
    TResult? Function()? getBlockeConnectionsEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? getBizkitConnections,
    TResult Function(String query)? getBizkitConnectionsNextPage,
    TResult Function(
            BlockBizkitConnection blockBizkitConnection, int connectionId)?
        blockBizkitConnections,
    TResult Function(
            CreateConnectionWithCardIdModel createConnectionWithCardIdModel)?
        addConnection,
    TResult Function(
            AddConnectionTagModel addConnectionTagModel, int connectionId)?
        addTagToBizkitconnection,
    TResult Function(SearchQuery searchQuery)? searchBizkitUsers,
    TResult Function(
            AddConnectionRequestModel addConnectionRequestModel, int index)?
        addConnectionRequests,
    TResult Function()? getRequestLists,
    TResult Function(int id)? deleteRequest,
    TResult Function()? getBlockeConnections,
    TResult Function()? getBlockeConnectionsEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetBizkitConnections value) getBizkitConnections,
    required TResult Function(GetBizkitConnectionsNextPage value)
        getBizkitConnectionsNextPage,
    required TResult Function(BlockBizkitConnections value)
        blockBizkitConnections,
    required TResult Function(AddConnection value) addConnection,
    required TResult Function(AddTagToBizkitconnection value)
        addTagToBizkitconnection,
    required TResult Function(SearchBizkitUsers value) searchBizkitUsers,
    required TResult Function(AddConnectionRequests value)
        addConnectionRequests,
    required TResult Function(GetRequestLists value) getRequestLists,
    required TResult Function(DeleteRequest value) deleteRequest,
    required TResult Function(GetBlockeConnections value) getBlockeConnections,
    required TResult Function(GgetBlockeConnectionsEvent value)
        getBlockeConnectionsEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetBizkitConnections value)? getBizkitConnections,
    TResult? Function(GetBizkitConnectionsNextPage value)?
        getBizkitConnectionsNextPage,
    TResult? Function(BlockBizkitConnections value)? blockBizkitConnections,
    TResult? Function(AddConnection value)? addConnection,
    TResult? Function(AddTagToBizkitconnection value)? addTagToBizkitconnection,
    TResult? Function(SearchBizkitUsers value)? searchBizkitUsers,
    TResult? Function(AddConnectionRequests value)? addConnectionRequests,
    TResult? Function(GetRequestLists value)? getRequestLists,
    TResult? Function(DeleteRequest value)? deleteRequest,
    TResult? Function(GetBlockeConnections value)? getBlockeConnections,
    TResult? Function(GgetBlockeConnectionsEvent value)?
        getBlockeConnectionsEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetBizkitConnections value)? getBizkitConnections,
    TResult Function(GetBizkitConnectionsNextPage value)?
        getBizkitConnectionsNextPage,
    TResult Function(BlockBizkitConnections value)? blockBizkitConnections,
    TResult Function(AddConnection value)? addConnection,
    TResult Function(AddTagToBizkitconnection value)? addTagToBizkitconnection,
    TResult Function(SearchBizkitUsers value)? searchBizkitUsers,
    TResult Function(AddConnectionRequests value)? addConnectionRequests,
    TResult Function(GetRequestLists value)? getRequestLists,
    TResult Function(DeleteRequest value)? deleteRequest,
    TResult Function(GetBlockeConnections value)? getBlockeConnections,
    TResult Function(GgetBlockeConnectionsEvent value)?
        getBlockeConnectionsEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectionRequestEventCopyWith<$Res> {
  factory $ConnectionRequestEventCopyWith(ConnectionRequestEvent value,
          $Res Function(ConnectionRequestEvent) then) =
      _$ConnectionRequestEventCopyWithImpl<$Res, ConnectionRequestEvent>;
}

/// @nodoc
class _$ConnectionRequestEventCopyWithImpl<$Res,
        $Val extends ConnectionRequestEvent>
    implements $ConnectionRequestEventCopyWith<$Res> {
  _$ConnectionRequestEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetBizkitConnectionsImplCopyWith<$Res> {
  factory _$$GetBizkitConnectionsImplCopyWith(_$GetBizkitConnectionsImpl value,
          $Res Function(_$GetBizkitConnectionsImpl) then) =
      __$$GetBizkitConnectionsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$GetBizkitConnectionsImplCopyWithImpl<$Res>
    extends _$ConnectionRequestEventCopyWithImpl<$Res,
        _$GetBizkitConnectionsImpl>
    implements _$$GetBizkitConnectionsImplCopyWith<$Res> {
  __$$GetBizkitConnectionsImplCopyWithImpl(_$GetBizkitConnectionsImpl _value,
      $Res Function(_$GetBizkitConnectionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$GetBizkitConnectionsImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetBizkitConnectionsImpl implements GetBizkitConnections {
  const _$GetBizkitConnectionsImpl({required this.query});

  @override
  final String query;

  @override
  String toString() {
    return 'ConnectionRequestEvent.getBizkitConnections(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetBizkitConnectionsImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetBizkitConnectionsImplCopyWith<_$GetBizkitConnectionsImpl>
      get copyWith =>
          __$$GetBizkitConnectionsImplCopyWithImpl<_$GetBizkitConnectionsImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) getBizkitConnections,
    required TResult Function(String query) getBizkitConnectionsNextPage,
    required TResult Function(
            BlockBizkitConnection blockBizkitConnection, int connectionId)
        blockBizkitConnections,
    required TResult Function(
            CreateConnectionWithCardIdModel createConnectionWithCardIdModel)
        addConnection,
    required TResult Function(
            AddConnectionTagModel addConnectionTagModel, int connectionId)
        addTagToBizkitconnection,
    required TResult Function(SearchQuery searchQuery) searchBizkitUsers,
    required TResult Function(
            AddConnectionRequestModel addConnectionRequestModel, int index)
        addConnectionRequests,
    required TResult Function() getRequestLists,
    required TResult Function(int id) deleteRequest,
    required TResult Function() getBlockeConnections,
    required TResult Function() getBlockeConnectionsEvent,
  }) {
    return getBizkitConnections(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? getBizkitConnections,
    TResult? Function(String query)? getBizkitConnectionsNextPage,
    TResult? Function(
            BlockBizkitConnection blockBizkitConnection, int connectionId)?
        blockBizkitConnections,
    TResult? Function(
            CreateConnectionWithCardIdModel createConnectionWithCardIdModel)?
        addConnection,
    TResult? Function(
            AddConnectionTagModel addConnectionTagModel, int connectionId)?
        addTagToBizkitconnection,
    TResult? Function(SearchQuery searchQuery)? searchBizkitUsers,
    TResult? Function(
            AddConnectionRequestModel addConnectionRequestModel, int index)?
        addConnectionRequests,
    TResult? Function()? getRequestLists,
    TResult? Function(int id)? deleteRequest,
    TResult? Function()? getBlockeConnections,
    TResult? Function()? getBlockeConnectionsEvent,
  }) {
    return getBizkitConnections?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? getBizkitConnections,
    TResult Function(String query)? getBizkitConnectionsNextPage,
    TResult Function(
            BlockBizkitConnection blockBizkitConnection, int connectionId)?
        blockBizkitConnections,
    TResult Function(
            CreateConnectionWithCardIdModel createConnectionWithCardIdModel)?
        addConnection,
    TResult Function(
            AddConnectionTagModel addConnectionTagModel, int connectionId)?
        addTagToBizkitconnection,
    TResult Function(SearchQuery searchQuery)? searchBizkitUsers,
    TResult Function(
            AddConnectionRequestModel addConnectionRequestModel, int index)?
        addConnectionRequests,
    TResult Function()? getRequestLists,
    TResult Function(int id)? deleteRequest,
    TResult Function()? getBlockeConnections,
    TResult Function()? getBlockeConnectionsEvent,
    required TResult orElse(),
  }) {
    if (getBizkitConnections != null) {
      return getBizkitConnections(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetBizkitConnections value) getBizkitConnections,
    required TResult Function(GetBizkitConnectionsNextPage value)
        getBizkitConnectionsNextPage,
    required TResult Function(BlockBizkitConnections value)
        blockBizkitConnections,
    required TResult Function(AddConnection value) addConnection,
    required TResult Function(AddTagToBizkitconnection value)
        addTagToBizkitconnection,
    required TResult Function(SearchBizkitUsers value) searchBizkitUsers,
    required TResult Function(AddConnectionRequests value)
        addConnectionRequests,
    required TResult Function(GetRequestLists value) getRequestLists,
    required TResult Function(DeleteRequest value) deleteRequest,
    required TResult Function(GetBlockeConnections value) getBlockeConnections,
    required TResult Function(GgetBlockeConnectionsEvent value)
        getBlockeConnectionsEvent,
  }) {
    return getBizkitConnections(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetBizkitConnections value)? getBizkitConnections,
    TResult? Function(GetBizkitConnectionsNextPage value)?
        getBizkitConnectionsNextPage,
    TResult? Function(BlockBizkitConnections value)? blockBizkitConnections,
    TResult? Function(AddConnection value)? addConnection,
    TResult? Function(AddTagToBizkitconnection value)? addTagToBizkitconnection,
    TResult? Function(SearchBizkitUsers value)? searchBizkitUsers,
    TResult? Function(AddConnectionRequests value)? addConnectionRequests,
    TResult? Function(GetRequestLists value)? getRequestLists,
    TResult? Function(DeleteRequest value)? deleteRequest,
    TResult? Function(GetBlockeConnections value)? getBlockeConnections,
    TResult? Function(GgetBlockeConnectionsEvent value)?
        getBlockeConnectionsEvent,
  }) {
    return getBizkitConnections?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetBizkitConnections value)? getBizkitConnections,
    TResult Function(GetBizkitConnectionsNextPage value)?
        getBizkitConnectionsNextPage,
    TResult Function(BlockBizkitConnections value)? blockBizkitConnections,
    TResult Function(AddConnection value)? addConnection,
    TResult Function(AddTagToBizkitconnection value)? addTagToBizkitconnection,
    TResult Function(SearchBizkitUsers value)? searchBizkitUsers,
    TResult Function(AddConnectionRequests value)? addConnectionRequests,
    TResult Function(GetRequestLists value)? getRequestLists,
    TResult Function(DeleteRequest value)? deleteRequest,
    TResult Function(GetBlockeConnections value)? getBlockeConnections,
    TResult Function(GgetBlockeConnectionsEvent value)?
        getBlockeConnectionsEvent,
    required TResult orElse(),
  }) {
    if (getBizkitConnections != null) {
      return getBizkitConnections(this);
    }
    return orElse();
  }
}

abstract class GetBizkitConnections implements ConnectionRequestEvent {
  const factory GetBizkitConnections({required final String query}) =
      _$GetBizkitConnectionsImpl;

  String get query;
  @JsonKey(ignore: true)
  _$$GetBizkitConnectionsImplCopyWith<_$GetBizkitConnectionsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetBizkitConnectionsNextPageImplCopyWith<$Res> {
  factory _$$GetBizkitConnectionsNextPageImplCopyWith(
          _$GetBizkitConnectionsNextPageImpl value,
          $Res Function(_$GetBizkitConnectionsNextPageImpl) then) =
      __$$GetBizkitConnectionsNextPageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$GetBizkitConnectionsNextPageImplCopyWithImpl<$Res>
    extends _$ConnectionRequestEventCopyWithImpl<$Res,
        _$GetBizkitConnectionsNextPageImpl>
    implements _$$GetBizkitConnectionsNextPageImplCopyWith<$Res> {
  __$$GetBizkitConnectionsNextPageImplCopyWithImpl(
      _$GetBizkitConnectionsNextPageImpl _value,
      $Res Function(_$GetBizkitConnectionsNextPageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$GetBizkitConnectionsNextPageImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetBizkitConnectionsNextPageImpl
    implements GetBizkitConnectionsNextPage {
  const _$GetBizkitConnectionsNextPageImpl({required this.query});

  @override
  final String query;

  @override
  String toString() {
    return 'ConnectionRequestEvent.getBizkitConnectionsNextPage(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetBizkitConnectionsNextPageImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetBizkitConnectionsNextPageImplCopyWith<
          _$GetBizkitConnectionsNextPageImpl>
      get copyWith => __$$GetBizkitConnectionsNextPageImplCopyWithImpl<
          _$GetBizkitConnectionsNextPageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) getBizkitConnections,
    required TResult Function(String query) getBizkitConnectionsNextPage,
    required TResult Function(
            BlockBizkitConnection blockBizkitConnection, int connectionId)
        blockBizkitConnections,
    required TResult Function(
            CreateConnectionWithCardIdModel createConnectionWithCardIdModel)
        addConnection,
    required TResult Function(
            AddConnectionTagModel addConnectionTagModel, int connectionId)
        addTagToBizkitconnection,
    required TResult Function(SearchQuery searchQuery) searchBizkitUsers,
    required TResult Function(
            AddConnectionRequestModel addConnectionRequestModel, int index)
        addConnectionRequests,
    required TResult Function() getRequestLists,
    required TResult Function(int id) deleteRequest,
    required TResult Function() getBlockeConnections,
    required TResult Function() getBlockeConnectionsEvent,
  }) {
    return getBizkitConnectionsNextPage(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? getBizkitConnections,
    TResult? Function(String query)? getBizkitConnectionsNextPage,
    TResult? Function(
            BlockBizkitConnection blockBizkitConnection, int connectionId)?
        blockBizkitConnections,
    TResult? Function(
            CreateConnectionWithCardIdModel createConnectionWithCardIdModel)?
        addConnection,
    TResult? Function(
            AddConnectionTagModel addConnectionTagModel, int connectionId)?
        addTagToBizkitconnection,
    TResult? Function(SearchQuery searchQuery)? searchBizkitUsers,
    TResult? Function(
            AddConnectionRequestModel addConnectionRequestModel, int index)?
        addConnectionRequests,
    TResult? Function()? getRequestLists,
    TResult? Function(int id)? deleteRequest,
    TResult? Function()? getBlockeConnections,
    TResult? Function()? getBlockeConnectionsEvent,
  }) {
    return getBizkitConnectionsNextPage?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? getBizkitConnections,
    TResult Function(String query)? getBizkitConnectionsNextPage,
    TResult Function(
            BlockBizkitConnection blockBizkitConnection, int connectionId)?
        blockBizkitConnections,
    TResult Function(
            CreateConnectionWithCardIdModel createConnectionWithCardIdModel)?
        addConnection,
    TResult Function(
            AddConnectionTagModel addConnectionTagModel, int connectionId)?
        addTagToBizkitconnection,
    TResult Function(SearchQuery searchQuery)? searchBizkitUsers,
    TResult Function(
            AddConnectionRequestModel addConnectionRequestModel, int index)?
        addConnectionRequests,
    TResult Function()? getRequestLists,
    TResult Function(int id)? deleteRequest,
    TResult Function()? getBlockeConnections,
    TResult Function()? getBlockeConnectionsEvent,
    required TResult orElse(),
  }) {
    if (getBizkitConnectionsNextPage != null) {
      return getBizkitConnectionsNextPage(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetBizkitConnections value) getBizkitConnections,
    required TResult Function(GetBizkitConnectionsNextPage value)
        getBizkitConnectionsNextPage,
    required TResult Function(BlockBizkitConnections value)
        blockBizkitConnections,
    required TResult Function(AddConnection value) addConnection,
    required TResult Function(AddTagToBizkitconnection value)
        addTagToBizkitconnection,
    required TResult Function(SearchBizkitUsers value) searchBizkitUsers,
    required TResult Function(AddConnectionRequests value)
        addConnectionRequests,
    required TResult Function(GetRequestLists value) getRequestLists,
    required TResult Function(DeleteRequest value) deleteRequest,
    required TResult Function(GetBlockeConnections value) getBlockeConnections,
    required TResult Function(GgetBlockeConnectionsEvent value)
        getBlockeConnectionsEvent,
  }) {
    return getBizkitConnectionsNextPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetBizkitConnections value)? getBizkitConnections,
    TResult? Function(GetBizkitConnectionsNextPage value)?
        getBizkitConnectionsNextPage,
    TResult? Function(BlockBizkitConnections value)? blockBizkitConnections,
    TResult? Function(AddConnection value)? addConnection,
    TResult? Function(AddTagToBizkitconnection value)? addTagToBizkitconnection,
    TResult? Function(SearchBizkitUsers value)? searchBizkitUsers,
    TResult? Function(AddConnectionRequests value)? addConnectionRequests,
    TResult? Function(GetRequestLists value)? getRequestLists,
    TResult? Function(DeleteRequest value)? deleteRequest,
    TResult? Function(GetBlockeConnections value)? getBlockeConnections,
    TResult? Function(GgetBlockeConnectionsEvent value)?
        getBlockeConnectionsEvent,
  }) {
    return getBizkitConnectionsNextPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetBizkitConnections value)? getBizkitConnections,
    TResult Function(GetBizkitConnectionsNextPage value)?
        getBizkitConnectionsNextPage,
    TResult Function(BlockBizkitConnections value)? blockBizkitConnections,
    TResult Function(AddConnection value)? addConnection,
    TResult Function(AddTagToBizkitconnection value)? addTagToBizkitconnection,
    TResult Function(SearchBizkitUsers value)? searchBizkitUsers,
    TResult Function(AddConnectionRequests value)? addConnectionRequests,
    TResult Function(GetRequestLists value)? getRequestLists,
    TResult Function(DeleteRequest value)? deleteRequest,
    TResult Function(GetBlockeConnections value)? getBlockeConnections,
    TResult Function(GgetBlockeConnectionsEvent value)?
        getBlockeConnectionsEvent,
    required TResult orElse(),
  }) {
    if (getBizkitConnectionsNextPage != null) {
      return getBizkitConnectionsNextPage(this);
    }
    return orElse();
  }
}

abstract class GetBizkitConnectionsNextPage implements ConnectionRequestEvent {
  const factory GetBizkitConnectionsNextPage({required final String query}) =
      _$GetBizkitConnectionsNextPageImpl;

  String get query;
  @JsonKey(ignore: true)
  _$$GetBizkitConnectionsNextPageImplCopyWith<
          _$GetBizkitConnectionsNextPageImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BlockBizkitConnectionsImplCopyWith<$Res> {
  factory _$$BlockBizkitConnectionsImplCopyWith(
          _$BlockBizkitConnectionsImpl value,
          $Res Function(_$BlockBizkitConnectionsImpl) then) =
      __$$BlockBizkitConnectionsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BlockBizkitConnection blockBizkitConnection, int connectionId});
}

/// @nodoc
class __$$BlockBizkitConnectionsImplCopyWithImpl<$Res>
    extends _$ConnectionRequestEventCopyWithImpl<$Res,
        _$BlockBizkitConnectionsImpl>
    implements _$$BlockBizkitConnectionsImplCopyWith<$Res> {
  __$$BlockBizkitConnectionsImplCopyWithImpl(
      _$BlockBizkitConnectionsImpl _value,
      $Res Function(_$BlockBizkitConnectionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockBizkitConnection = null,
    Object? connectionId = null,
  }) {
    return _then(_$BlockBizkitConnectionsImpl(
      blockBizkitConnection: null == blockBizkitConnection
          ? _value.blockBizkitConnection
          : blockBizkitConnection // ignore: cast_nullable_to_non_nullable
              as BlockBizkitConnection,
      connectionId: null == connectionId
          ? _value.connectionId
          : connectionId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$BlockBizkitConnectionsImpl implements BlockBizkitConnections {
  const _$BlockBizkitConnectionsImpl(
      {required this.blockBizkitConnection, required this.connectionId});

  @override
  final BlockBizkitConnection blockBizkitConnection;
  @override
  final int connectionId;

  @override
  String toString() {
    return 'ConnectionRequestEvent.blockBizkitConnections(blockBizkitConnection: $blockBizkitConnection, connectionId: $connectionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlockBizkitConnectionsImpl &&
            (identical(other.blockBizkitConnection, blockBizkitConnection) ||
                other.blockBizkitConnection == blockBizkitConnection) &&
            (identical(other.connectionId, connectionId) ||
                other.connectionId == connectionId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, blockBizkitConnection, connectionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlockBizkitConnectionsImplCopyWith<_$BlockBizkitConnectionsImpl>
      get copyWith => __$$BlockBizkitConnectionsImplCopyWithImpl<
          _$BlockBizkitConnectionsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) getBizkitConnections,
    required TResult Function(String query) getBizkitConnectionsNextPage,
    required TResult Function(
            BlockBizkitConnection blockBizkitConnection, int connectionId)
        blockBizkitConnections,
    required TResult Function(
            CreateConnectionWithCardIdModel createConnectionWithCardIdModel)
        addConnection,
    required TResult Function(
            AddConnectionTagModel addConnectionTagModel, int connectionId)
        addTagToBizkitconnection,
    required TResult Function(SearchQuery searchQuery) searchBizkitUsers,
    required TResult Function(
            AddConnectionRequestModel addConnectionRequestModel, int index)
        addConnectionRequests,
    required TResult Function() getRequestLists,
    required TResult Function(int id) deleteRequest,
    required TResult Function() getBlockeConnections,
    required TResult Function() getBlockeConnectionsEvent,
  }) {
    return blockBizkitConnections(blockBizkitConnection, connectionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? getBizkitConnections,
    TResult? Function(String query)? getBizkitConnectionsNextPage,
    TResult? Function(
            BlockBizkitConnection blockBizkitConnection, int connectionId)?
        blockBizkitConnections,
    TResult? Function(
            CreateConnectionWithCardIdModel createConnectionWithCardIdModel)?
        addConnection,
    TResult? Function(
            AddConnectionTagModel addConnectionTagModel, int connectionId)?
        addTagToBizkitconnection,
    TResult? Function(SearchQuery searchQuery)? searchBizkitUsers,
    TResult? Function(
            AddConnectionRequestModel addConnectionRequestModel, int index)?
        addConnectionRequests,
    TResult? Function()? getRequestLists,
    TResult? Function(int id)? deleteRequest,
    TResult? Function()? getBlockeConnections,
    TResult? Function()? getBlockeConnectionsEvent,
  }) {
    return blockBizkitConnections?.call(blockBizkitConnection, connectionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? getBizkitConnections,
    TResult Function(String query)? getBizkitConnectionsNextPage,
    TResult Function(
            BlockBizkitConnection blockBizkitConnection, int connectionId)?
        blockBizkitConnections,
    TResult Function(
            CreateConnectionWithCardIdModel createConnectionWithCardIdModel)?
        addConnection,
    TResult Function(
            AddConnectionTagModel addConnectionTagModel, int connectionId)?
        addTagToBizkitconnection,
    TResult Function(SearchQuery searchQuery)? searchBizkitUsers,
    TResult Function(
            AddConnectionRequestModel addConnectionRequestModel, int index)?
        addConnectionRequests,
    TResult Function()? getRequestLists,
    TResult Function(int id)? deleteRequest,
    TResult Function()? getBlockeConnections,
    TResult Function()? getBlockeConnectionsEvent,
    required TResult orElse(),
  }) {
    if (blockBizkitConnections != null) {
      return blockBizkitConnections(blockBizkitConnection, connectionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetBizkitConnections value) getBizkitConnections,
    required TResult Function(GetBizkitConnectionsNextPage value)
        getBizkitConnectionsNextPage,
    required TResult Function(BlockBizkitConnections value)
        blockBizkitConnections,
    required TResult Function(AddConnection value) addConnection,
    required TResult Function(AddTagToBizkitconnection value)
        addTagToBizkitconnection,
    required TResult Function(SearchBizkitUsers value) searchBizkitUsers,
    required TResult Function(AddConnectionRequests value)
        addConnectionRequests,
    required TResult Function(GetRequestLists value) getRequestLists,
    required TResult Function(DeleteRequest value) deleteRequest,
    required TResult Function(GetBlockeConnections value) getBlockeConnections,
    required TResult Function(GgetBlockeConnectionsEvent value)
        getBlockeConnectionsEvent,
  }) {
    return blockBizkitConnections(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetBizkitConnections value)? getBizkitConnections,
    TResult? Function(GetBizkitConnectionsNextPage value)?
        getBizkitConnectionsNextPage,
    TResult? Function(BlockBizkitConnections value)? blockBizkitConnections,
    TResult? Function(AddConnection value)? addConnection,
    TResult? Function(AddTagToBizkitconnection value)? addTagToBizkitconnection,
    TResult? Function(SearchBizkitUsers value)? searchBizkitUsers,
    TResult? Function(AddConnectionRequests value)? addConnectionRequests,
    TResult? Function(GetRequestLists value)? getRequestLists,
    TResult? Function(DeleteRequest value)? deleteRequest,
    TResult? Function(GetBlockeConnections value)? getBlockeConnections,
    TResult? Function(GgetBlockeConnectionsEvent value)?
        getBlockeConnectionsEvent,
  }) {
    return blockBizkitConnections?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetBizkitConnections value)? getBizkitConnections,
    TResult Function(GetBizkitConnectionsNextPage value)?
        getBizkitConnectionsNextPage,
    TResult Function(BlockBizkitConnections value)? blockBizkitConnections,
    TResult Function(AddConnection value)? addConnection,
    TResult Function(AddTagToBizkitconnection value)? addTagToBizkitconnection,
    TResult Function(SearchBizkitUsers value)? searchBizkitUsers,
    TResult Function(AddConnectionRequests value)? addConnectionRequests,
    TResult Function(GetRequestLists value)? getRequestLists,
    TResult Function(DeleteRequest value)? deleteRequest,
    TResult Function(GetBlockeConnections value)? getBlockeConnections,
    TResult Function(GgetBlockeConnectionsEvent value)?
        getBlockeConnectionsEvent,
    required TResult orElse(),
  }) {
    if (blockBizkitConnections != null) {
      return blockBizkitConnections(this);
    }
    return orElse();
  }
}

abstract class BlockBizkitConnections implements ConnectionRequestEvent {
  const factory BlockBizkitConnections(
      {required final BlockBizkitConnection blockBizkitConnection,
      required final int connectionId}) = _$BlockBizkitConnectionsImpl;

  BlockBizkitConnection get blockBizkitConnection;
  int get connectionId;
  @JsonKey(ignore: true)
  _$$BlockBizkitConnectionsImplCopyWith<_$BlockBizkitConnectionsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddConnectionImplCopyWith<$Res> {
  factory _$$AddConnectionImplCopyWith(
          _$AddConnectionImpl value, $Res Function(_$AddConnectionImpl) then) =
      __$$AddConnectionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CreateConnectionWithCardIdModel createConnectionWithCardIdModel});
}

/// @nodoc
class __$$AddConnectionImplCopyWithImpl<$Res>
    extends _$ConnectionRequestEventCopyWithImpl<$Res, _$AddConnectionImpl>
    implements _$$AddConnectionImplCopyWith<$Res> {
  __$$AddConnectionImplCopyWithImpl(
      _$AddConnectionImpl _value, $Res Function(_$AddConnectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createConnectionWithCardIdModel = null,
  }) {
    return _then(_$AddConnectionImpl(
      createConnectionWithCardIdModel: null == createConnectionWithCardIdModel
          ? _value.createConnectionWithCardIdModel
          : createConnectionWithCardIdModel // ignore: cast_nullable_to_non_nullable
              as CreateConnectionWithCardIdModel,
    ));
  }
}

/// @nodoc

class _$AddConnectionImpl implements AddConnection {
  const _$AddConnectionImpl({required this.createConnectionWithCardIdModel});

  @override
  final CreateConnectionWithCardIdModel createConnectionWithCardIdModel;

  @override
  String toString() {
    return 'ConnectionRequestEvent.addConnection(createConnectionWithCardIdModel: $createConnectionWithCardIdModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddConnectionImpl &&
            (identical(other.createConnectionWithCardIdModel,
                    createConnectionWithCardIdModel) ||
                other.createConnectionWithCardIdModel ==
                    createConnectionWithCardIdModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, createConnectionWithCardIdModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddConnectionImplCopyWith<_$AddConnectionImpl> get copyWith =>
      __$$AddConnectionImplCopyWithImpl<_$AddConnectionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) getBizkitConnections,
    required TResult Function(String query) getBizkitConnectionsNextPage,
    required TResult Function(
            BlockBizkitConnection blockBizkitConnection, int connectionId)
        blockBizkitConnections,
    required TResult Function(
            CreateConnectionWithCardIdModel createConnectionWithCardIdModel)
        addConnection,
    required TResult Function(
            AddConnectionTagModel addConnectionTagModel, int connectionId)
        addTagToBizkitconnection,
    required TResult Function(SearchQuery searchQuery) searchBizkitUsers,
    required TResult Function(
            AddConnectionRequestModel addConnectionRequestModel, int index)
        addConnectionRequests,
    required TResult Function() getRequestLists,
    required TResult Function(int id) deleteRequest,
    required TResult Function() getBlockeConnections,
    required TResult Function() getBlockeConnectionsEvent,
  }) {
    return addConnection(createConnectionWithCardIdModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? getBizkitConnections,
    TResult? Function(String query)? getBizkitConnectionsNextPage,
    TResult? Function(
            BlockBizkitConnection blockBizkitConnection, int connectionId)?
        blockBizkitConnections,
    TResult? Function(
            CreateConnectionWithCardIdModel createConnectionWithCardIdModel)?
        addConnection,
    TResult? Function(
            AddConnectionTagModel addConnectionTagModel, int connectionId)?
        addTagToBizkitconnection,
    TResult? Function(SearchQuery searchQuery)? searchBizkitUsers,
    TResult? Function(
            AddConnectionRequestModel addConnectionRequestModel, int index)?
        addConnectionRequests,
    TResult? Function()? getRequestLists,
    TResult? Function(int id)? deleteRequest,
    TResult? Function()? getBlockeConnections,
    TResult? Function()? getBlockeConnectionsEvent,
  }) {
    return addConnection?.call(createConnectionWithCardIdModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? getBizkitConnections,
    TResult Function(String query)? getBizkitConnectionsNextPage,
    TResult Function(
            BlockBizkitConnection blockBizkitConnection, int connectionId)?
        blockBizkitConnections,
    TResult Function(
            CreateConnectionWithCardIdModel createConnectionWithCardIdModel)?
        addConnection,
    TResult Function(
            AddConnectionTagModel addConnectionTagModel, int connectionId)?
        addTagToBizkitconnection,
    TResult Function(SearchQuery searchQuery)? searchBizkitUsers,
    TResult Function(
            AddConnectionRequestModel addConnectionRequestModel, int index)?
        addConnectionRequests,
    TResult Function()? getRequestLists,
    TResult Function(int id)? deleteRequest,
    TResult Function()? getBlockeConnections,
    TResult Function()? getBlockeConnectionsEvent,
    required TResult orElse(),
  }) {
    if (addConnection != null) {
      return addConnection(createConnectionWithCardIdModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetBizkitConnections value) getBizkitConnections,
    required TResult Function(GetBizkitConnectionsNextPage value)
        getBizkitConnectionsNextPage,
    required TResult Function(BlockBizkitConnections value)
        blockBizkitConnections,
    required TResult Function(AddConnection value) addConnection,
    required TResult Function(AddTagToBizkitconnection value)
        addTagToBizkitconnection,
    required TResult Function(SearchBizkitUsers value) searchBizkitUsers,
    required TResult Function(AddConnectionRequests value)
        addConnectionRequests,
    required TResult Function(GetRequestLists value) getRequestLists,
    required TResult Function(DeleteRequest value) deleteRequest,
    required TResult Function(GetBlockeConnections value) getBlockeConnections,
    required TResult Function(GgetBlockeConnectionsEvent value)
        getBlockeConnectionsEvent,
  }) {
    return addConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetBizkitConnections value)? getBizkitConnections,
    TResult? Function(GetBizkitConnectionsNextPage value)?
        getBizkitConnectionsNextPage,
    TResult? Function(BlockBizkitConnections value)? blockBizkitConnections,
    TResult? Function(AddConnection value)? addConnection,
    TResult? Function(AddTagToBizkitconnection value)? addTagToBizkitconnection,
    TResult? Function(SearchBizkitUsers value)? searchBizkitUsers,
    TResult? Function(AddConnectionRequests value)? addConnectionRequests,
    TResult? Function(GetRequestLists value)? getRequestLists,
    TResult? Function(DeleteRequest value)? deleteRequest,
    TResult? Function(GetBlockeConnections value)? getBlockeConnections,
    TResult? Function(GgetBlockeConnectionsEvent value)?
        getBlockeConnectionsEvent,
  }) {
    return addConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetBizkitConnections value)? getBizkitConnections,
    TResult Function(GetBizkitConnectionsNextPage value)?
        getBizkitConnectionsNextPage,
    TResult Function(BlockBizkitConnections value)? blockBizkitConnections,
    TResult Function(AddConnection value)? addConnection,
    TResult Function(AddTagToBizkitconnection value)? addTagToBizkitconnection,
    TResult Function(SearchBizkitUsers value)? searchBizkitUsers,
    TResult Function(AddConnectionRequests value)? addConnectionRequests,
    TResult Function(GetRequestLists value)? getRequestLists,
    TResult Function(DeleteRequest value)? deleteRequest,
    TResult Function(GetBlockeConnections value)? getBlockeConnections,
    TResult Function(GgetBlockeConnectionsEvent value)?
        getBlockeConnectionsEvent,
    required TResult orElse(),
  }) {
    if (addConnection != null) {
      return addConnection(this);
    }
    return orElse();
  }
}

abstract class AddConnection implements ConnectionRequestEvent {
  const factory AddConnection(
      {required final CreateConnectionWithCardIdModel
          createConnectionWithCardIdModel}) = _$AddConnectionImpl;

  CreateConnectionWithCardIdModel get createConnectionWithCardIdModel;
  @JsonKey(ignore: true)
  _$$AddConnectionImplCopyWith<_$AddConnectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddTagToBizkitconnectionImplCopyWith<$Res> {
  factory _$$AddTagToBizkitconnectionImplCopyWith(
          _$AddTagToBizkitconnectionImpl value,
          $Res Function(_$AddTagToBizkitconnectionImpl) then) =
      __$$AddTagToBizkitconnectionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AddConnectionTagModel addConnectionTagModel, int connectionId});
}

/// @nodoc
class __$$AddTagToBizkitconnectionImplCopyWithImpl<$Res>
    extends _$ConnectionRequestEventCopyWithImpl<$Res,
        _$AddTagToBizkitconnectionImpl>
    implements _$$AddTagToBizkitconnectionImplCopyWith<$Res> {
  __$$AddTagToBizkitconnectionImplCopyWithImpl(
      _$AddTagToBizkitconnectionImpl _value,
      $Res Function(_$AddTagToBizkitconnectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addConnectionTagModel = null,
    Object? connectionId = null,
  }) {
    return _then(_$AddTagToBizkitconnectionImpl(
      addConnectionTagModel: null == addConnectionTagModel
          ? _value.addConnectionTagModel
          : addConnectionTagModel // ignore: cast_nullable_to_non_nullable
              as AddConnectionTagModel,
      connectionId: null == connectionId
          ? _value.connectionId
          : connectionId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AddTagToBizkitconnectionImpl implements AddTagToBizkitconnection {
  const _$AddTagToBizkitconnectionImpl(
      {required this.addConnectionTagModel, required this.connectionId});

  @override
  final AddConnectionTagModel addConnectionTagModel;
  @override
  final int connectionId;

  @override
  String toString() {
    return 'ConnectionRequestEvent.addTagToBizkitconnection(addConnectionTagModel: $addConnectionTagModel, connectionId: $connectionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddTagToBizkitconnectionImpl &&
            (identical(other.addConnectionTagModel, addConnectionTagModel) ||
                other.addConnectionTagModel == addConnectionTagModel) &&
            (identical(other.connectionId, connectionId) ||
                other.connectionId == connectionId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, addConnectionTagModel, connectionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddTagToBizkitconnectionImplCopyWith<_$AddTagToBizkitconnectionImpl>
      get copyWith => __$$AddTagToBizkitconnectionImplCopyWithImpl<
          _$AddTagToBizkitconnectionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) getBizkitConnections,
    required TResult Function(String query) getBizkitConnectionsNextPage,
    required TResult Function(
            BlockBizkitConnection blockBizkitConnection, int connectionId)
        blockBizkitConnections,
    required TResult Function(
            CreateConnectionWithCardIdModel createConnectionWithCardIdModel)
        addConnection,
    required TResult Function(
            AddConnectionTagModel addConnectionTagModel, int connectionId)
        addTagToBizkitconnection,
    required TResult Function(SearchQuery searchQuery) searchBizkitUsers,
    required TResult Function(
            AddConnectionRequestModel addConnectionRequestModel, int index)
        addConnectionRequests,
    required TResult Function() getRequestLists,
    required TResult Function(int id) deleteRequest,
    required TResult Function() getBlockeConnections,
    required TResult Function() getBlockeConnectionsEvent,
  }) {
    return addTagToBizkitconnection(addConnectionTagModel, connectionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? getBizkitConnections,
    TResult? Function(String query)? getBizkitConnectionsNextPage,
    TResult? Function(
            BlockBizkitConnection blockBizkitConnection, int connectionId)?
        blockBizkitConnections,
    TResult? Function(
            CreateConnectionWithCardIdModel createConnectionWithCardIdModel)?
        addConnection,
    TResult? Function(
            AddConnectionTagModel addConnectionTagModel, int connectionId)?
        addTagToBizkitconnection,
    TResult? Function(SearchQuery searchQuery)? searchBizkitUsers,
    TResult? Function(
            AddConnectionRequestModel addConnectionRequestModel, int index)?
        addConnectionRequests,
    TResult? Function()? getRequestLists,
    TResult? Function(int id)? deleteRequest,
    TResult? Function()? getBlockeConnections,
    TResult? Function()? getBlockeConnectionsEvent,
  }) {
    return addTagToBizkitconnection?.call(addConnectionTagModel, connectionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? getBizkitConnections,
    TResult Function(String query)? getBizkitConnectionsNextPage,
    TResult Function(
            BlockBizkitConnection blockBizkitConnection, int connectionId)?
        blockBizkitConnections,
    TResult Function(
            CreateConnectionWithCardIdModel createConnectionWithCardIdModel)?
        addConnection,
    TResult Function(
            AddConnectionTagModel addConnectionTagModel, int connectionId)?
        addTagToBizkitconnection,
    TResult Function(SearchQuery searchQuery)? searchBizkitUsers,
    TResult Function(
            AddConnectionRequestModel addConnectionRequestModel, int index)?
        addConnectionRequests,
    TResult Function()? getRequestLists,
    TResult Function(int id)? deleteRequest,
    TResult Function()? getBlockeConnections,
    TResult Function()? getBlockeConnectionsEvent,
    required TResult orElse(),
  }) {
    if (addTagToBizkitconnection != null) {
      return addTagToBizkitconnection(addConnectionTagModel, connectionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetBizkitConnections value) getBizkitConnections,
    required TResult Function(GetBizkitConnectionsNextPage value)
        getBizkitConnectionsNextPage,
    required TResult Function(BlockBizkitConnections value)
        blockBizkitConnections,
    required TResult Function(AddConnection value) addConnection,
    required TResult Function(AddTagToBizkitconnection value)
        addTagToBizkitconnection,
    required TResult Function(SearchBizkitUsers value) searchBizkitUsers,
    required TResult Function(AddConnectionRequests value)
        addConnectionRequests,
    required TResult Function(GetRequestLists value) getRequestLists,
    required TResult Function(DeleteRequest value) deleteRequest,
    required TResult Function(GetBlockeConnections value) getBlockeConnections,
    required TResult Function(GgetBlockeConnectionsEvent value)
        getBlockeConnectionsEvent,
  }) {
    return addTagToBizkitconnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetBizkitConnections value)? getBizkitConnections,
    TResult? Function(GetBizkitConnectionsNextPage value)?
        getBizkitConnectionsNextPage,
    TResult? Function(BlockBizkitConnections value)? blockBizkitConnections,
    TResult? Function(AddConnection value)? addConnection,
    TResult? Function(AddTagToBizkitconnection value)? addTagToBizkitconnection,
    TResult? Function(SearchBizkitUsers value)? searchBizkitUsers,
    TResult? Function(AddConnectionRequests value)? addConnectionRequests,
    TResult? Function(GetRequestLists value)? getRequestLists,
    TResult? Function(DeleteRequest value)? deleteRequest,
    TResult? Function(GetBlockeConnections value)? getBlockeConnections,
    TResult? Function(GgetBlockeConnectionsEvent value)?
        getBlockeConnectionsEvent,
  }) {
    return addTagToBizkitconnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetBizkitConnections value)? getBizkitConnections,
    TResult Function(GetBizkitConnectionsNextPage value)?
        getBizkitConnectionsNextPage,
    TResult Function(BlockBizkitConnections value)? blockBizkitConnections,
    TResult Function(AddConnection value)? addConnection,
    TResult Function(AddTagToBizkitconnection value)? addTagToBizkitconnection,
    TResult Function(SearchBizkitUsers value)? searchBizkitUsers,
    TResult Function(AddConnectionRequests value)? addConnectionRequests,
    TResult Function(GetRequestLists value)? getRequestLists,
    TResult Function(DeleteRequest value)? deleteRequest,
    TResult Function(GetBlockeConnections value)? getBlockeConnections,
    TResult Function(GgetBlockeConnectionsEvent value)?
        getBlockeConnectionsEvent,
    required TResult orElse(),
  }) {
    if (addTagToBizkitconnection != null) {
      return addTagToBizkitconnection(this);
    }
    return orElse();
  }
}

abstract class AddTagToBizkitconnection implements ConnectionRequestEvent {
  const factory AddTagToBizkitconnection(
      {required final AddConnectionTagModel addConnectionTagModel,
      required final int connectionId}) = _$AddTagToBizkitconnectionImpl;

  AddConnectionTagModel get addConnectionTagModel;
  int get connectionId;
  @JsonKey(ignore: true)
  _$$AddTagToBizkitconnectionImplCopyWith<_$AddTagToBizkitconnectionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchBizkitUsersImplCopyWith<$Res> {
  factory _$$SearchBizkitUsersImplCopyWith(_$SearchBizkitUsersImpl value,
          $Res Function(_$SearchBizkitUsersImpl) then) =
      __$$SearchBizkitUsersImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SearchQuery searchQuery});
}

/// @nodoc
class __$$SearchBizkitUsersImplCopyWithImpl<$Res>
    extends _$ConnectionRequestEventCopyWithImpl<$Res, _$SearchBizkitUsersImpl>
    implements _$$SearchBizkitUsersImplCopyWith<$Res> {
  __$$SearchBizkitUsersImplCopyWithImpl(_$SearchBizkitUsersImpl _value,
      $Res Function(_$SearchBizkitUsersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = null,
  }) {
    return _then(_$SearchBizkitUsersImpl(
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as SearchQuery,
    ));
  }
}

/// @nodoc

class _$SearchBizkitUsersImpl implements SearchBizkitUsers {
  const _$SearchBizkitUsersImpl({required this.searchQuery});

  @override
  final SearchQuery searchQuery;

  @override
  String toString() {
    return 'ConnectionRequestEvent.searchBizkitUsers(searchQuery: $searchQuery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchBizkitUsersImpl &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchQuery);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchBizkitUsersImplCopyWith<_$SearchBizkitUsersImpl> get copyWith =>
      __$$SearchBizkitUsersImplCopyWithImpl<_$SearchBizkitUsersImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) getBizkitConnections,
    required TResult Function(String query) getBizkitConnectionsNextPage,
    required TResult Function(
            BlockBizkitConnection blockBizkitConnection, int connectionId)
        blockBizkitConnections,
    required TResult Function(
            CreateConnectionWithCardIdModel createConnectionWithCardIdModel)
        addConnection,
    required TResult Function(
            AddConnectionTagModel addConnectionTagModel, int connectionId)
        addTagToBizkitconnection,
    required TResult Function(SearchQuery searchQuery) searchBizkitUsers,
    required TResult Function(
            AddConnectionRequestModel addConnectionRequestModel, int index)
        addConnectionRequests,
    required TResult Function() getRequestLists,
    required TResult Function(int id) deleteRequest,
    required TResult Function() getBlockeConnections,
    required TResult Function() getBlockeConnectionsEvent,
  }) {
    return searchBizkitUsers(searchQuery);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? getBizkitConnections,
    TResult? Function(String query)? getBizkitConnectionsNextPage,
    TResult? Function(
            BlockBizkitConnection blockBizkitConnection, int connectionId)?
        blockBizkitConnections,
    TResult? Function(
            CreateConnectionWithCardIdModel createConnectionWithCardIdModel)?
        addConnection,
    TResult? Function(
            AddConnectionTagModel addConnectionTagModel, int connectionId)?
        addTagToBizkitconnection,
    TResult? Function(SearchQuery searchQuery)? searchBizkitUsers,
    TResult? Function(
            AddConnectionRequestModel addConnectionRequestModel, int index)?
        addConnectionRequests,
    TResult? Function()? getRequestLists,
    TResult? Function(int id)? deleteRequest,
    TResult? Function()? getBlockeConnections,
    TResult? Function()? getBlockeConnectionsEvent,
  }) {
    return searchBizkitUsers?.call(searchQuery);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? getBizkitConnections,
    TResult Function(String query)? getBizkitConnectionsNextPage,
    TResult Function(
            BlockBizkitConnection blockBizkitConnection, int connectionId)?
        blockBizkitConnections,
    TResult Function(
            CreateConnectionWithCardIdModel createConnectionWithCardIdModel)?
        addConnection,
    TResult Function(
            AddConnectionTagModel addConnectionTagModel, int connectionId)?
        addTagToBizkitconnection,
    TResult Function(SearchQuery searchQuery)? searchBizkitUsers,
    TResult Function(
            AddConnectionRequestModel addConnectionRequestModel, int index)?
        addConnectionRequests,
    TResult Function()? getRequestLists,
    TResult Function(int id)? deleteRequest,
    TResult Function()? getBlockeConnections,
    TResult Function()? getBlockeConnectionsEvent,
    required TResult orElse(),
  }) {
    if (searchBizkitUsers != null) {
      return searchBizkitUsers(searchQuery);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetBizkitConnections value) getBizkitConnections,
    required TResult Function(GetBizkitConnectionsNextPage value)
        getBizkitConnectionsNextPage,
    required TResult Function(BlockBizkitConnections value)
        blockBizkitConnections,
    required TResult Function(AddConnection value) addConnection,
    required TResult Function(AddTagToBizkitconnection value)
        addTagToBizkitconnection,
    required TResult Function(SearchBizkitUsers value) searchBizkitUsers,
    required TResult Function(AddConnectionRequests value)
        addConnectionRequests,
    required TResult Function(GetRequestLists value) getRequestLists,
    required TResult Function(DeleteRequest value) deleteRequest,
    required TResult Function(GetBlockeConnections value) getBlockeConnections,
    required TResult Function(GgetBlockeConnectionsEvent value)
        getBlockeConnectionsEvent,
  }) {
    return searchBizkitUsers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetBizkitConnections value)? getBizkitConnections,
    TResult? Function(GetBizkitConnectionsNextPage value)?
        getBizkitConnectionsNextPage,
    TResult? Function(BlockBizkitConnections value)? blockBizkitConnections,
    TResult? Function(AddConnection value)? addConnection,
    TResult? Function(AddTagToBizkitconnection value)? addTagToBizkitconnection,
    TResult? Function(SearchBizkitUsers value)? searchBizkitUsers,
    TResult? Function(AddConnectionRequests value)? addConnectionRequests,
    TResult? Function(GetRequestLists value)? getRequestLists,
    TResult? Function(DeleteRequest value)? deleteRequest,
    TResult? Function(GetBlockeConnections value)? getBlockeConnections,
    TResult? Function(GgetBlockeConnectionsEvent value)?
        getBlockeConnectionsEvent,
  }) {
    return searchBizkitUsers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetBizkitConnections value)? getBizkitConnections,
    TResult Function(GetBizkitConnectionsNextPage value)?
        getBizkitConnectionsNextPage,
    TResult Function(BlockBizkitConnections value)? blockBizkitConnections,
    TResult Function(AddConnection value)? addConnection,
    TResult Function(AddTagToBizkitconnection value)? addTagToBizkitconnection,
    TResult Function(SearchBizkitUsers value)? searchBizkitUsers,
    TResult Function(AddConnectionRequests value)? addConnectionRequests,
    TResult Function(GetRequestLists value)? getRequestLists,
    TResult Function(DeleteRequest value)? deleteRequest,
    TResult Function(GetBlockeConnections value)? getBlockeConnections,
    TResult Function(GgetBlockeConnectionsEvent value)?
        getBlockeConnectionsEvent,
    required TResult orElse(),
  }) {
    if (searchBizkitUsers != null) {
      return searchBizkitUsers(this);
    }
    return orElse();
  }
}

abstract class SearchBizkitUsers implements ConnectionRequestEvent {
  const factory SearchBizkitUsers({required final SearchQuery searchQuery}) =
      _$SearchBizkitUsersImpl;

  SearchQuery get searchQuery;
  @JsonKey(ignore: true)
  _$$SearchBizkitUsersImplCopyWith<_$SearchBizkitUsersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddConnectionRequestsImplCopyWith<$Res> {
  factory _$$AddConnectionRequestsImplCopyWith(
          _$AddConnectionRequestsImpl value,
          $Res Function(_$AddConnectionRequestsImpl) then) =
      __$$AddConnectionRequestsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AddConnectionRequestModel addConnectionRequestModel, int index});
}

/// @nodoc
class __$$AddConnectionRequestsImplCopyWithImpl<$Res>
    extends _$ConnectionRequestEventCopyWithImpl<$Res,
        _$AddConnectionRequestsImpl>
    implements _$$AddConnectionRequestsImplCopyWith<$Res> {
  __$$AddConnectionRequestsImplCopyWithImpl(_$AddConnectionRequestsImpl _value,
      $Res Function(_$AddConnectionRequestsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addConnectionRequestModel = null,
    Object? index = null,
  }) {
    return _then(_$AddConnectionRequestsImpl(
      addConnectionRequestModel: null == addConnectionRequestModel
          ? _value.addConnectionRequestModel
          : addConnectionRequestModel // ignore: cast_nullable_to_non_nullable
              as AddConnectionRequestModel,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AddConnectionRequestsImpl implements AddConnectionRequests {
  const _$AddConnectionRequestsImpl(
      {required this.addConnectionRequestModel, required this.index});

  @override
  final AddConnectionRequestModel addConnectionRequestModel;
  @override
  final int index;

  @override
  String toString() {
    return 'ConnectionRequestEvent.addConnectionRequests(addConnectionRequestModel: $addConnectionRequestModel, index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddConnectionRequestsImpl &&
            (identical(other.addConnectionRequestModel,
                    addConnectionRequestModel) ||
                other.addConnectionRequestModel == addConnectionRequestModel) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, addConnectionRequestModel, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddConnectionRequestsImplCopyWith<_$AddConnectionRequestsImpl>
      get copyWith => __$$AddConnectionRequestsImplCopyWithImpl<
          _$AddConnectionRequestsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) getBizkitConnections,
    required TResult Function(String query) getBizkitConnectionsNextPage,
    required TResult Function(
            BlockBizkitConnection blockBizkitConnection, int connectionId)
        blockBizkitConnections,
    required TResult Function(
            CreateConnectionWithCardIdModel createConnectionWithCardIdModel)
        addConnection,
    required TResult Function(
            AddConnectionTagModel addConnectionTagModel, int connectionId)
        addTagToBizkitconnection,
    required TResult Function(SearchQuery searchQuery) searchBizkitUsers,
    required TResult Function(
            AddConnectionRequestModel addConnectionRequestModel, int index)
        addConnectionRequests,
    required TResult Function() getRequestLists,
    required TResult Function(int id) deleteRequest,
    required TResult Function() getBlockeConnections,
    required TResult Function() getBlockeConnectionsEvent,
  }) {
    return addConnectionRequests(addConnectionRequestModel, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? getBizkitConnections,
    TResult? Function(String query)? getBizkitConnectionsNextPage,
    TResult? Function(
            BlockBizkitConnection blockBizkitConnection, int connectionId)?
        blockBizkitConnections,
    TResult? Function(
            CreateConnectionWithCardIdModel createConnectionWithCardIdModel)?
        addConnection,
    TResult? Function(
            AddConnectionTagModel addConnectionTagModel, int connectionId)?
        addTagToBizkitconnection,
    TResult? Function(SearchQuery searchQuery)? searchBizkitUsers,
    TResult? Function(
            AddConnectionRequestModel addConnectionRequestModel, int index)?
        addConnectionRequests,
    TResult? Function()? getRequestLists,
    TResult? Function(int id)? deleteRequest,
    TResult? Function()? getBlockeConnections,
    TResult? Function()? getBlockeConnectionsEvent,
  }) {
    return addConnectionRequests?.call(addConnectionRequestModel, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? getBizkitConnections,
    TResult Function(String query)? getBizkitConnectionsNextPage,
    TResult Function(
            BlockBizkitConnection blockBizkitConnection, int connectionId)?
        blockBizkitConnections,
    TResult Function(
            CreateConnectionWithCardIdModel createConnectionWithCardIdModel)?
        addConnection,
    TResult Function(
            AddConnectionTagModel addConnectionTagModel, int connectionId)?
        addTagToBizkitconnection,
    TResult Function(SearchQuery searchQuery)? searchBizkitUsers,
    TResult Function(
            AddConnectionRequestModel addConnectionRequestModel, int index)?
        addConnectionRequests,
    TResult Function()? getRequestLists,
    TResult Function(int id)? deleteRequest,
    TResult Function()? getBlockeConnections,
    TResult Function()? getBlockeConnectionsEvent,
    required TResult orElse(),
  }) {
    if (addConnectionRequests != null) {
      return addConnectionRequests(addConnectionRequestModel, index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetBizkitConnections value) getBizkitConnections,
    required TResult Function(GetBizkitConnectionsNextPage value)
        getBizkitConnectionsNextPage,
    required TResult Function(BlockBizkitConnections value)
        blockBizkitConnections,
    required TResult Function(AddConnection value) addConnection,
    required TResult Function(AddTagToBizkitconnection value)
        addTagToBizkitconnection,
    required TResult Function(SearchBizkitUsers value) searchBizkitUsers,
    required TResult Function(AddConnectionRequests value)
        addConnectionRequests,
    required TResult Function(GetRequestLists value) getRequestLists,
    required TResult Function(DeleteRequest value) deleteRequest,
    required TResult Function(GetBlockeConnections value) getBlockeConnections,
    required TResult Function(GgetBlockeConnectionsEvent value)
        getBlockeConnectionsEvent,
  }) {
    return addConnectionRequests(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetBizkitConnections value)? getBizkitConnections,
    TResult? Function(GetBizkitConnectionsNextPage value)?
        getBizkitConnectionsNextPage,
    TResult? Function(BlockBizkitConnections value)? blockBizkitConnections,
    TResult? Function(AddConnection value)? addConnection,
    TResult? Function(AddTagToBizkitconnection value)? addTagToBizkitconnection,
    TResult? Function(SearchBizkitUsers value)? searchBizkitUsers,
    TResult? Function(AddConnectionRequests value)? addConnectionRequests,
    TResult? Function(GetRequestLists value)? getRequestLists,
    TResult? Function(DeleteRequest value)? deleteRequest,
    TResult? Function(GetBlockeConnections value)? getBlockeConnections,
    TResult? Function(GgetBlockeConnectionsEvent value)?
        getBlockeConnectionsEvent,
  }) {
    return addConnectionRequests?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetBizkitConnections value)? getBizkitConnections,
    TResult Function(GetBizkitConnectionsNextPage value)?
        getBizkitConnectionsNextPage,
    TResult Function(BlockBizkitConnections value)? blockBizkitConnections,
    TResult Function(AddConnection value)? addConnection,
    TResult Function(AddTagToBizkitconnection value)? addTagToBizkitconnection,
    TResult Function(SearchBizkitUsers value)? searchBizkitUsers,
    TResult Function(AddConnectionRequests value)? addConnectionRequests,
    TResult Function(GetRequestLists value)? getRequestLists,
    TResult Function(DeleteRequest value)? deleteRequest,
    TResult Function(GetBlockeConnections value)? getBlockeConnections,
    TResult Function(GgetBlockeConnectionsEvent value)?
        getBlockeConnectionsEvent,
    required TResult orElse(),
  }) {
    if (addConnectionRequests != null) {
      return addConnectionRequests(this);
    }
    return orElse();
  }
}

abstract class AddConnectionRequests implements ConnectionRequestEvent {
  const factory AddConnectionRequests(
      {required final AddConnectionRequestModel addConnectionRequestModel,
      required final int index}) = _$AddConnectionRequestsImpl;

  AddConnectionRequestModel get addConnectionRequestModel;
  int get index;
  @JsonKey(ignore: true)
  _$$AddConnectionRequestsImplCopyWith<_$AddConnectionRequestsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetRequestListsImplCopyWith<$Res> {
  factory _$$GetRequestListsImplCopyWith(_$GetRequestListsImpl value,
          $Res Function(_$GetRequestListsImpl) then) =
      __$$GetRequestListsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetRequestListsImplCopyWithImpl<$Res>
    extends _$ConnectionRequestEventCopyWithImpl<$Res, _$GetRequestListsImpl>
    implements _$$GetRequestListsImplCopyWith<$Res> {
  __$$GetRequestListsImplCopyWithImpl(
      _$GetRequestListsImpl _value, $Res Function(_$GetRequestListsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetRequestListsImpl implements GetRequestLists {
  const _$GetRequestListsImpl();

  @override
  String toString() {
    return 'ConnectionRequestEvent.getRequestLists()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetRequestListsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) getBizkitConnections,
    required TResult Function(String query) getBizkitConnectionsNextPage,
    required TResult Function(
            BlockBizkitConnection blockBizkitConnection, int connectionId)
        blockBizkitConnections,
    required TResult Function(
            CreateConnectionWithCardIdModel createConnectionWithCardIdModel)
        addConnection,
    required TResult Function(
            AddConnectionTagModel addConnectionTagModel, int connectionId)
        addTagToBizkitconnection,
    required TResult Function(SearchQuery searchQuery) searchBizkitUsers,
    required TResult Function(
            AddConnectionRequestModel addConnectionRequestModel, int index)
        addConnectionRequests,
    required TResult Function() getRequestLists,
    required TResult Function(int id) deleteRequest,
    required TResult Function() getBlockeConnections,
    required TResult Function() getBlockeConnectionsEvent,
  }) {
    return getRequestLists();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? getBizkitConnections,
    TResult? Function(String query)? getBizkitConnectionsNextPage,
    TResult? Function(
            BlockBizkitConnection blockBizkitConnection, int connectionId)?
        blockBizkitConnections,
    TResult? Function(
            CreateConnectionWithCardIdModel createConnectionWithCardIdModel)?
        addConnection,
    TResult? Function(
            AddConnectionTagModel addConnectionTagModel, int connectionId)?
        addTagToBizkitconnection,
    TResult? Function(SearchQuery searchQuery)? searchBizkitUsers,
    TResult? Function(
            AddConnectionRequestModel addConnectionRequestModel, int index)?
        addConnectionRequests,
    TResult? Function()? getRequestLists,
    TResult? Function(int id)? deleteRequest,
    TResult? Function()? getBlockeConnections,
    TResult? Function()? getBlockeConnectionsEvent,
  }) {
    return getRequestLists?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? getBizkitConnections,
    TResult Function(String query)? getBizkitConnectionsNextPage,
    TResult Function(
            BlockBizkitConnection blockBizkitConnection, int connectionId)?
        blockBizkitConnections,
    TResult Function(
            CreateConnectionWithCardIdModel createConnectionWithCardIdModel)?
        addConnection,
    TResult Function(
            AddConnectionTagModel addConnectionTagModel, int connectionId)?
        addTagToBizkitconnection,
    TResult Function(SearchQuery searchQuery)? searchBizkitUsers,
    TResult Function(
            AddConnectionRequestModel addConnectionRequestModel, int index)?
        addConnectionRequests,
    TResult Function()? getRequestLists,
    TResult Function(int id)? deleteRequest,
    TResult Function()? getBlockeConnections,
    TResult Function()? getBlockeConnectionsEvent,
    required TResult orElse(),
  }) {
    if (getRequestLists != null) {
      return getRequestLists();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetBizkitConnections value) getBizkitConnections,
    required TResult Function(GetBizkitConnectionsNextPage value)
        getBizkitConnectionsNextPage,
    required TResult Function(BlockBizkitConnections value)
        blockBizkitConnections,
    required TResult Function(AddConnection value) addConnection,
    required TResult Function(AddTagToBizkitconnection value)
        addTagToBizkitconnection,
    required TResult Function(SearchBizkitUsers value) searchBizkitUsers,
    required TResult Function(AddConnectionRequests value)
        addConnectionRequests,
    required TResult Function(GetRequestLists value) getRequestLists,
    required TResult Function(DeleteRequest value) deleteRequest,
    required TResult Function(GetBlockeConnections value) getBlockeConnections,
    required TResult Function(GgetBlockeConnectionsEvent value)
        getBlockeConnectionsEvent,
  }) {
    return getRequestLists(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetBizkitConnections value)? getBizkitConnections,
    TResult? Function(GetBizkitConnectionsNextPage value)?
        getBizkitConnectionsNextPage,
    TResult? Function(BlockBizkitConnections value)? blockBizkitConnections,
    TResult? Function(AddConnection value)? addConnection,
    TResult? Function(AddTagToBizkitconnection value)? addTagToBizkitconnection,
    TResult? Function(SearchBizkitUsers value)? searchBizkitUsers,
    TResult? Function(AddConnectionRequests value)? addConnectionRequests,
    TResult? Function(GetRequestLists value)? getRequestLists,
    TResult? Function(DeleteRequest value)? deleteRequest,
    TResult? Function(GetBlockeConnections value)? getBlockeConnections,
    TResult? Function(GgetBlockeConnectionsEvent value)?
        getBlockeConnectionsEvent,
  }) {
    return getRequestLists?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetBizkitConnections value)? getBizkitConnections,
    TResult Function(GetBizkitConnectionsNextPage value)?
        getBizkitConnectionsNextPage,
    TResult Function(BlockBizkitConnections value)? blockBizkitConnections,
    TResult Function(AddConnection value)? addConnection,
    TResult Function(AddTagToBizkitconnection value)? addTagToBizkitconnection,
    TResult Function(SearchBizkitUsers value)? searchBizkitUsers,
    TResult Function(AddConnectionRequests value)? addConnectionRequests,
    TResult Function(GetRequestLists value)? getRequestLists,
    TResult Function(DeleteRequest value)? deleteRequest,
    TResult Function(GetBlockeConnections value)? getBlockeConnections,
    TResult Function(GgetBlockeConnectionsEvent value)?
        getBlockeConnectionsEvent,
    required TResult orElse(),
  }) {
    if (getRequestLists != null) {
      return getRequestLists(this);
    }
    return orElse();
  }
}

abstract class GetRequestLists implements ConnectionRequestEvent {
  const factory GetRequestLists() = _$GetRequestListsImpl;
}

/// @nodoc
abstract class _$$DeleteRequestImplCopyWith<$Res> {
  factory _$$DeleteRequestImplCopyWith(
          _$DeleteRequestImpl value, $Res Function(_$DeleteRequestImpl) then) =
      __$$DeleteRequestImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$DeleteRequestImplCopyWithImpl<$Res>
    extends _$ConnectionRequestEventCopyWithImpl<$Res, _$DeleteRequestImpl>
    implements _$$DeleteRequestImplCopyWith<$Res> {
  __$$DeleteRequestImplCopyWithImpl(
      _$DeleteRequestImpl _value, $Res Function(_$DeleteRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeleteRequestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteRequestImpl implements DeleteRequest {
  const _$DeleteRequestImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'ConnectionRequestEvent.deleteRequest(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteRequestImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteRequestImplCopyWith<_$DeleteRequestImpl> get copyWith =>
      __$$DeleteRequestImplCopyWithImpl<_$DeleteRequestImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) getBizkitConnections,
    required TResult Function(String query) getBizkitConnectionsNextPage,
    required TResult Function(
            BlockBizkitConnection blockBizkitConnection, int connectionId)
        blockBizkitConnections,
    required TResult Function(
            CreateConnectionWithCardIdModel createConnectionWithCardIdModel)
        addConnection,
    required TResult Function(
            AddConnectionTagModel addConnectionTagModel, int connectionId)
        addTagToBizkitconnection,
    required TResult Function(SearchQuery searchQuery) searchBizkitUsers,
    required TResult Function(
            AddConnectionRequestModel addConnectionRequestModel, int index)
        addConnectionRequests,
    required TResult Function() getRequestLists,
    required TResult Function(int id) deleteRequest,
    required TResult Function() getBlockeConnections,
    required TResult Function() getBlockeConnectionsEvent,
  }) {
    return deleteRequest(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? getBizkitConnections,
    TResult? Function(String query)? getBizkitConnectionsNextPage,
    TResult? Function(
            BlockBizkitConnection blockBizkitConnection, int connectionId)?
        blockBizkitConnections,
    TResult? Function(
            CreateConnectionWithCardIdModel createConnectionWithCardIdModel)?
        addConnection,
    TResult? Function(
            AddConnectionTagModel addConnectionTagModel, int connectionId)?
        addTagToBizkitconnection,
    TResult? Function(SearchQuery searchQuery)? searchBizkitUsers,
    TResult? Function(
            AddConnectionRequestModel addConnectionRequestModel, int index)?
        addConnectionRequests,
    TResult? Function()? getRequestLists,
    TResult? Function(int id)? deleteRequest,
    TResult? Function()? getBlockeConnections,
    TResult? Function()? getBlockeConnectionsEvent,
  }) {
    return deleteRequest?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? getBizkitConnections,
    TResult Function(String query)? getBizkitConnectionsNextPage,
    TResult Function(
            BlockBizkitConnection blockBizkitConnection, int connectionId)?
        blockBizkitConnections,
    TResult Function(
            CreateConnectionWithCardIdModel createConnectionWithCardIdModel)?
        addConnection,
    TResult Function(
            AddConnectionTagModel addConnectionTagModel, int connectionId)?
        addTagToBizkitconnection,
    TResult Function(SearchQuery searchQuery)? searchBizkitUsers,
    TResult Function(
            AddConnectionRequestModel addConnectionRequestModel, int index)?
        addConnectionRequests,
    TResult Function()? getRequestLists,
    TResult Function(int id)? deleteRequest,
    TResult Function()? getBlockeConnections,
    TResult Function()? getBlockeConnectionsEvent,
    required TResult orElse(),
  }) {
    if (deleteRequest != null) {
      return deleteRequest(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetBizkitConnections value) getBizkitConnections,
    required TResult Function(GetBizkitConnectionsNextPage value)
        getBizkitConnectionsNextPage,
    required TResult Function(BlockBizkitConnections value)
        blockBizkitConnections,
    required TResult Function(AddConnection value) addConnection,
    required TResult Function(AddTagToBizkitconnection value)
        addTagToBizkitconnection,
    required TResult Function(SearchBizkitUsers value) searchBizkitUsers,
    required TResult Function(AddConnectionRequests value)
        addConnectionRequests,
    required TResult Function(GetRequestLists value) getRequestLists,
    required TResult Function(DeleteRequest value) deleteRequest,
    required TResult Function(GetBlockeConnections value) getBlockeConnections,
    required TResult Function(GgetBlockeConnectionsEvent value)
        getBlockeConnectionsEvent,
  }) {
    return deleteRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetBizkitConnections value)? getBizkitConnections,
    TResult? Function(GetBizkitConnectionsNextPage value)?
        getBizkitConnectionsNextPage,
    TResult? Function(BlockBizkitConnections value)? blockBizkitConnections,
    TResult? Function(AddConnection value)? addConnection,
    TResult? Function(AddTagToBizkitconnection value)? addTagToBizkitconnection,
    TResult? Function(SearchBizkitUsers value)? searchBizkitUsers,
    TResult? Function(AddConnectionRequests value)? addConnectionRequests,
    TResult? Function(GetRequestLists value)? getRequestLists,
    TResult? Function(DeleteRequest value)? deleteRequest,
    TResult? Function(GetBlockeConnections value)? getBlockeConnections,
    TResult? Function(GgetBlockeConnectionsEvent value)?
        getBlockeConnectionsEvent,
  }) {
    return deleteRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetBizkitConnections value)? getBizkitConnections,
    TResult Function(GetBizkitConnectionsNextPage value)?
        getBizkitConnectionsNextPage,
    TResult Function(BlockBizkitConnections value)? blockBizkitConnections,
    TResult Function(AddConnection value)? addConnection,
    TResult Function(AddTagToBizkitconnection value)? addTagToBizkitconnection,
    TResult Function(SearchBizkitUsers value)? searchBizkitUsers,
    TResult Function(AddConnectionRequests value)? addConnectionRequests,
    TResult Function(GetRequestLists value)? getRequestLists,
    TResult Function(DeleteRequest value)? deleteRequest,
    TResult Function(GetBlockeConnections value)? getBlockeConnections,
    TResult Function(GgetBlockeConnectionsEvent value)?
        getBlockeConnectionsEvent,
    required TResult orElse(),
  }) {
    if (deleteRequest != null) {
      return deleteRequest(this);
    }
    return orElse();
  }
}

abstract class DeleteRequest implements ConnectionRequestEvent {
  const factory DeleteRequest({required final int id}) = _$DeleteRequestImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$DeleteRequestImplCopyWith<_$DeleteRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetBlockeConnectionsImplCopyWith<$Res> {
  factory _$$GetBlockeConnectionsImplCopyWith(_$GetBlockeConnectionsImpl value,
          $Res Function(_$GetBlockeConnectionsImpl) then) =
      __$$GetBlockeConnectionsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetBlockeConnectionsImplCopyWithImpl<$Res>
    extends _$ConnectionRequestEventCopyWithImpl<$Res,
        _$GetBlockeConnectionsImpl>
    implements _$$GetBlockeConnectionsImplCopyWith<$Res> {
  __$$GetBlockeConnectionsImplCopyWithImpl(_$GetBlockeConnectionsImpl _value,
      $Res Function(_$GetBlockeConnectionsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetBlockeConnectionsImpl implements GetBlockeConnections {
  const _$GetBlockeConnectionsImpl();

  @override
  String toString() {
    return 'ConnectionRequestEvent.getBlockeConnections()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetBlockeConnectionsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) getBizkitConnections,
    required TResult Function(String query) getBizkitConnectionsNextPage,
    required TResult Function(
            BlockBizkitConnection blockBizkitConnection, int connectionId)
        blockBizkitConnections,
    required TResult Function(
            CreateConnectionWithCardIdModel createConnectionWithCardIdModel)
        addConnection,
    required TResult Function(
            AddConnectionTagModel addConnectionTagModel, int connectionId)
        addTagToBizkitconnection,
    required TResult Function(SearchQuery searchQuery) searchBizkitUsers,
    required TResult Function(
            AddConnectionRequestModel addConnectionRequestModel, int index)
        addConnectionRequests,
    required TResult Function() getRequestLists,
    required TResult Function(int id) deleteRequest,
    required TResult Function() getBlockeConnections,
    required TResult Function() getBlockeConnectionsEvent,
  }) {
    return getBlockeConnections();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? getBizkitConnections,
    TResult? Function(String query)? getBizkitConnectionsNextPage,
    TResult? Function(
            BlockBizkitConnection blockBizkitConnection, int connectionId)?
        blockBizkitConnections,
    TResult? Function(
            CreateConnectionWithCardIdModel createConnectionWithCardIdModel)?
        addConnection,
    TResult? Function(
            AddConnectionTagModel addConnectionTagModel, int connectionId)?
        addTagToBizkitconnection,
    TResult? Function(SearchQuery searchQuery)? searchBizkitUsers,
    TResult? Function(
            AddConnectionRequestModel addConnectionRequestModel, int index)?
        addConnectionRequests,
    TResult? Function()? getRequestLists,
    TResult? Function(int id)? deleteRequest,
    TResult? Function()? getBlockeConnections,
    TResult? Function()? getBlockeConnectionsEvent,
  }) {
    return getBlockeConnections?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? getBizkitConnections,
    TResult Function(String query)? getBizkitConnectionsNextPage,
    TResult Function(
            BlockBizkitConnection blockBizkitConnection, int connectionId)?
        blockBizkitConnections,
    TResult Function(
            CreateConnectionWithCardIdModel createConnectionWithCardIdModel)?
        addConnection,
    TResult Function(
            AddConnectionTagModel addConnectionTagModel, int connectionId)?
        addTagToBizkitconnection,
    TResult Function(SearchQuery searchQuery)? searchBizkitUsers,
    TResult Function(
            AddConnectionRequestModel addConnectionRequestModel, int index)?
        addConnectionRequests,
    TResult Function()? getRequestLists,
    TResult Function(int id)? deleteRequest,
    TResult Function()? getBlockeConnections,
    TResult Function()? getBlockeConnectionsEvent,
    required TResult orElse(),
  }) {
    if (getBlockeConnections != null) {
      return getBlockeConnections();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetBizkitConnections value) getBizkitConnections,
    required TResult Function(GetBizkitConnectionsNextPage value)
        getBizkitConnectionsNextPage,
    required TResult Function(BlockBizkitConnections value)
        blockBizkitConnections,
    required TResult Function(AddConnection value) addConnection,
    required TResult Function(AddTagToBizkitconnection value)
        addTagToBizkitconnection,
    required TResult Function(SearchBizkitUsers value) searchBizkitUsers,
    required TResult Function(AddConnectionRequests value)
        addConnectionRequests,
    required TResult Function(GetRequestLists value) getRequestLists,
    required TResult Function(DeleteRequest value) deleteRequest,
    required TResult Function(GetBlockeConnections value) getBlockeConnections,
    required TResult Function(GgetBlockeConnectionsEvent value)
        getBlockeConnectionsEvent,
  }) {
    return getBlockeConnections(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetBizkitConnections value)? getBizkitConnections,
    TResult? Function(GetBizkitConnectionsNextPage value)?
        getBizkitConnectionsNextPage,
    TResult? Function(BlockBizkitConnections value)? blockBizkitConnections,
    TResult? Function(AddConnection value)? addConnection,
    TResult? Function(AddTagToBizkitconnection value)? addTagToBizkitconnection,
    TResult? Function(SearchBizkitUsers value)? searchBizkitUsers,
    TResult? Function(AddConnectionRequests value)? addConnectionRequests,
    TResult? Function(GetRequestLists value)? getRequestLists,
    TResult? Function(DeleteRequest value)? deleteRequest,
    TResult? Function(GetBlockeConnections value)? getBlockeConnections,
    TResult? Function(GgetBlockeConnectionsEvent value)?
        getBlockeConnectionsEvent,
  }) {
    return getBlockeConnections?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetBizkitConnections value)? getBizkitConnections,
    TResult Function(GetBizkitConnectionsNextPage value)?
        getBizkitConnectionsNextPage,
    TResult Function(BlockBizkitConnections value)? blockBizkitConnections,
    TResult Function(AddConnection value)? addConnection,
    TResult Function(AddTagToBizkitconnection value)? addTagToBizkitconnection,
    TResult Function(SearchBizkitUsers value)? searchBizkitUsers,
    TResult Function(AddConnectionRequests value)? addConnectionRequests,
    TResult Function(GetRequestLists value)? getRequestLists,
    TResult Function(DeleteRequest value)? deleteRequest,
    TResult Function(GetBlockeConnections value)? getBlockeConnections,
    TResult Function(GgetBlockeConnectionsEvent value)?
        getBlockeConnectionsEvent,
    required TResult orElse(),
  }) {
    if (getBlockeConnections != null) {
      return getBlockeConnections(this);
    }
    return orElse();
  }
}

abstract class GetBlockeConnections implements ConnectionRequestEvent {
  const factory GetBlockeConnections() = _$GetBlockeConnectionsImpl;
}

/// @nodoc
abstract class _$$GgetBlockeConnectionsEventImplCopyWith<$Res> {
  factory _$$GgetBlockeConnectionsEventImplCopyWith(
          _$GgetBlockeConnectionsEventImpl value,
          $Res Function(_$GgetBlockeConnectionsEventImpl) then) =
      __$$GgetBlockeConnectionsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GgetBlockeConnectionsEventImplCopyWithImpl<$Res>
    extends _$ConnectionRequestEventCopyWithImpl<$Res,
        _$GgetBlockeConnectionsEventImpl>
    implements _$$GgetBlockeConnectionsEventImplCopyWith<$Res> {
  __$$GgetBlockeConnectionsEventImplCopyWithImpl(
      _$GgetBlockeConnectionsEventImpl _value,
      $Res Function(_$GgetBlockeConnectionsEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GgetBlockeConnectionsEventImpl implements GgetBlockeConnectionsEvent {
  const _$GgetBlockeConnectionsEventImpl();

  @override
  String toString() {
    return 'ConnectionRequestEvent.getBlockeConnectionsEvent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GgetBlockeConnectionsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) getBizkitConnections,
    required TResult Function(String query) getBizkitConnectionsNextPage,
    required TResult Function(
            BlockBizkitConnection blockBizkitConnection, int connectionId)
        blockBizkitConnections,
    required TResult Function(
            CreateConnectionWithCardIdModel createConnectionWithCardIdModel)
        addConnection,
    required TResult Function(
            AddConnectionTagModel addConnectionTagModel, int connectionId)
        addTagToBizkitconnection,
    required TResult Function(SearchQuery searchQuery) searchBizkitUsers,
    required TResult Function(
            AddConnectionRequestModel addConnectionRequestModel, int index)
        addConnectionRequests,
    required TResult Function() getRequestLists,
    required TResult Function(int id) deleteRequest,
    required TResult Function() getBlockeConnections,
    required TResult Function() getBlockeConnectionsEvent,
  }) {
    return getBlockeConnectionsEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? getBizkitConnections,
    TResult? Function(String query)? getBizkitConnectionsNextPage,
    TResult? Function(
            BlockBizkitConnection blockBizkitConnection, int connectionId)?
        blockBizkitConnections,
    TResult? Function(
            CreateConnectionWithCardIdModel createConnectionWithCardIdModel)?
        addConnection,
    TResult? Function(
            AddConnectionTagModel addConnectionTagModel, int connectionId)?
        addTagToBizkitconnection,
    TResult? Function(SearchQuery searchQuery)? searchBizkitUsers,
    TResult? Function(
            AddConnectionRequestModel addConnectionRequestModel, int index)?
        addConnectionRequests,
    TResult? Function()? getRequestLists,
    TResult? Function(int id)? deleteRequest,
    TResult? Function()? getBlockeConnections,
    TResult? Function()? getBlockeConnectionsEvent,
  }) {
    return getBlockeConnectionsEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? getBizkitConnections,
    TResult Function(String query)? getBizkitConnectionsNextPage,
    TResult Function(
            BlockBizkitConnection blockBizkitConnection, int connectionId)?
        blockBizkitConnections,
    TResult Function(
            CreateConnectionWithCardIdModel createConnectionWithCardIdModel)?
        addConnection,
    TResult Function(
            AddConnectionTagModel addConnectionTagModel, int connectionId)?
        addTagToBizkitconnection,
    TResult Function(SearchQuery searchQuery)? searchBizkitUsers,
    TResult Function(
            AddConnectionRequestModel addConnectionRequestModel, int index)?
        addConnectionRequests,
    TResult Function()? getRequestLists,
    TResult Function(int id)? deleteRequest,
    TResult Function()? getBlockeConnections,
    TResult Function()? getBlockeConnectionsEvent,
    required TResult orElse(),
  }) {
    if (getBlockeConnectionsEvent != null) {
      return getBlockeConnectionsEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetBizkitConnections value) getBizkitConnections,
    required TResult Function(GetBizkitConnectionsNextPage value)
        getBizkitConnectionsNextPage,
    required TResult Function(BlockBizkitConnections value)
        blockBizkitConnections,
    required TResult Function(AddConnection value) addConnection,
    required TResult Function(AddTagToBizkitconnection value)
        addTagToBizkitconnection,
    required TResult Function(SearchBizkitUsers value) searchBizkitUsers,
    required TResult Function(AddConnectionRequests value)
        addConnectionRequests,
    required TResult Function(GetRequestLists value) getRequestLists,
    required TResult Function(DeleteRequest value) deleteRequest,
    required TResult Function(GetBlockeConnections value) getBlockeConnections,
    required TResult Function(GgetBlockeConnectionsEvent value)
        getBlockeConnectionsEvent,
  }) {
    return getBlockeConnectionsEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetBizkitConnections value)? getBizkitConnections,
    TResult? Function(GetBizkitConnectionsNextPage value)?
        getBizkitConnectionsNextPage,
    TResult? Function(BlockBizkitConnections value)? blockBizkitConnections,
    TResult? Function(AddConnection value)? addConnection,
    TResult? Function(AddTagToBizkitconnection value)? addTagToBizkitconnection,
    TResult? Function(SearchBizkitUsers value)? searchBizkitUsers,
    TResult? Function(AddConnectionRequests value)? addConnectionRequests,
    TResult? Function(GetRequestLists value)? getRequestLists,
    TResult? Function(DeleteRequest value)? deleteRequest,
    TResult? Function(GetBlockeConnections value)? getBlockeConnections,
    TResult? Function(GgetBlockeConnectionsEvent value)?
        getBlockeConnectionsEvent,
  }) {
    return getBlockeConnectionsEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetBizkitConnections value)? getBizkitConnections,
    TResult Function(GetBizkitConnectionsNextPage value)?
        getBizkitConnectionsNextPage,
    TResult Function(BlockBizkitConnections value)? blockBizkitConnections,
    TResult Function(AddConnection value)? addConnection,
    TResult Function(AddTagToBizkitconnection value)? addTagToBizkitconnection,
    TResult Function(SearchBizkitUsers value)? searchBizkitUsers,
    TResult Function(AddConnectionRequests value)? addConnectionRequests,
    TResult Function(GetRequestLists value)? getRequestLists,
    TResult Function(DeleteRequest value)? deleteRequest,
    TResult Function(GetBlockeConnections value)? getBlockeConnections,
    TResult Function(GgetBlockeConnectionsEvent value)?
        getBlockeConnectionsEvent,
    required TResult orElse(),
  }) {
    if (getBlockeConnectionsEvent != null) {
      return getBlockeConnectionsEvent(this);
    }
    return orElse();
  }
}

abstract class GgetBlockeConnectionsEvent implements ConnectionRequestEvent {
  const factory GgetBlockeConnectionsEvent() = _$GgetBlockeConnectionsEventImpl;
}

/// @nodoc
mixin _$ConnectionRequestState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isPageLoading => throw _privateConstructorUsedError;
  bool get connected => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  bool get blockedLoading => throw _privateConstructorUsedError;
  int get requestLoadingIndex => throw _privateConstructorUsedError;
  int? get connectedId => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<BizkitConnection>? get bizkitConnections =>
      throw _privateConstructorUsedError;
  List<BizkitUser>? get bizkitUsers => throw _privateConstructorUsedError;
  List<RequestModel>? get requestList => throw _privateConstructorUsedError;
  List<BlockedConnection>? get blockedConnections =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConnectionRequestStateCopyWith<ConnectionRequestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectionRequestStateCopyWith<$Res> {
  factory $ConnectionRequestStateCopyWith(ConnectionRequestState value,
          $Res Function(ConnectionRequestState) then) =
      _$ConnectionRequestStateCopyWithImpl<$Res, ConnectionRequestState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isPageLoading,
      bool connected,
      bool hasError,
      bool blockedLoading,
      int requestLoadingIndex,
      int? connectedId,
      String? message,
      List<BizkitConnection>? bizkitConnections,
      List<BizkitUser>? bizkitUsers,
      List<RequestModel>? requestList,
      List<BlockedConnection>? blockedConnections});
}

/// @nodoc
class _$ConnectionRequestStateCopyWithImpl<$Res,
        $Val extends ConnectionRequestState>
    implements $ConnectionRequestStateCopyWith<$Res> {
  _$ConnectionRequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isPageLoading = null,
    Object? connected = null,
    Object? hasError = null,
    Object? blockedLoading = null,
    Object? requestLoadingIndex = null,
    Object? connectedId = freezed,
    Object? message = freezed,
    Object? bizkitConnections = freezed,
    Object? bizkitUsers = freezed,
    Object? requestList = freezed,
    Object? blockedConnections = freezed,
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
      connected: null == connected
          ? _value.connected
          : connected // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      blockedLoading: null == blockedLoading
          ? _value.blockedLoading
          : blockedLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      requestLoadingIndex: null == requestLoadingIndex
          ? _value.requestLoadingIndex
          : requestLoadingIndex // ignore: cast_nullable_to_non_nullable
              as int,
      connectedId: freezed == connectedId
          ? _value.connectedId
          : connectedId // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      bizkitConnections: freezed == bizkitConnections
          ? _value.bizkitConnections
          : bizkitConnections // ignore: cast_nullable_to_non_nullable
              as List<BizkitConnection>?,
      bizkitUsers: freezed == bizkitUsers
          ? _value.bizkitUsers
          : bizkitUsers // ignore: cast_nullable_to_non_nullable
              as List<BizkitUser>?,
      requestList: freezed == requestList
          ? _value.requestList
          : requestList // ignore: cast_nullable_to_non_nullable
              as List<RequestModel>?,
      blockedConnections: freezed == blockedConnections
          ? _value.blockedConnections
          : blockedConnections // ignore: cast_nullable_to_non_nullable
              as List<BlockedConnection>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $ConnectionRequestStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isPageLoading,
      bool connected,
      bool hasError,
      bool blockedLoading,
      int requestLoadingIndex,
      int? connectedId,
      String? message,
      List<BizkitConnection>? bizkitConnections,
      List<BizkitUser>? bizkitUsers,
      List<RequestModel>? requestList,
      List<BlockedConnection>? blockedConnections});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ConnectionRequestStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isPageLoading = null,
    Object? connected = null,
    Object? hasError = null,
    Object? blockedLoading = null,
    Object? requestLoadingIndex = null,
    Object? connectedId = freezed,
    Object? message = freezed,
    Object? bizkitConnections = freezed,
    Object? bizkitUsers = freezed,
    Object? requestList = freezed,
    Object? blockedConnections = freezed,
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
      connected: null == connected
          ? _value.connected
          : connected // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      blockedLoading: null == blockedLoading
          ? _value.blockedLoading
          : blockedLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      requestLoadingIndex: null == requestLoadingIndex
          ? _value.requestLoadingIndex
          : requestLoadingIndex // ignore: cast_nullable_to_non_nullable
              as int,
      connectedId: freezed == connectedId
          ? _value.connectedId
          : connectedId // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      bizkitConnections: freezed == bizkitConnections
          ? _value._bizkitConnections
          : bizkitConnections // ignore: cast_nullable_to_non_nullable
              as List<BizkitConnection>?,
      bizkitUsers: freezed == bizkitUsers
          ? _value._bizkitUsers
          : bizkitUsers // ignore: cast_nullable_to_non_nullable
              as List<BizkitUser>?,
      requestList: freezed == requestList
          ? _value._requestList
          : requestList // ignore: cast_nullable_to_non_nullable
              as List<RequestModel>?,
      blockedConnections: freezed == blockedConnections
          ? _value._blockedConnections
          : blockedConnections // ignore: cast_nullable_to_non_nullable
              as List<BlockedConnection>?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.isLoading,
      required this.isPageLoading,
      required this.connected,
      required this.hasError,
      required this.blockedLoading,
      required this.requestLoadingIndex,
      this.connectedId,
      this.message,
      final List<BizkitConnection>? bizkitConnections,
      final List<BizkitUser>? bizkitUsers,
      final List<RequestModel>? requestList,
      final List<BlockedConnection>? blockedConnections})
      : _bizkitConnections = bizkitConnections,
        _bizkitUsers = bizkitUsers,
        _requestList = requestList,
        _blockedConnections = blockedConnections;

  @override
  final bool isLoading;
  @override
  final bool isPageLoading;
  @override
  final bool connected;
  @override
  final bool hasError;
  @override
  final bool blockedLoading;
  @override
  final int requestLoadingIndex;
  @override
  final int? connectedId;
  @override
  final String? message;
  final List<BizkitConnection>? _bizkitConnections;
  @override
  List<BizkitConnection>? get bizkitConnections {
    final value = _bizkitConnections;
    if (value == null) return null;
    if (_bizkitConnections is EqualUnmodifiableListView)
      return _bizkitConnections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<BizkitUser>? _bizkitUsers;
  @override
  List<BizkitUser>? get bizkitUsers {
    final value = _bizkitUsers;
    if (value == null) return null;
    if (_bizkitUsers is EqualUnmodifiableListView) return _bizkitUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<RequestModel>? _requestList;
  @override
  List<RequestModel>? get requestList {
    final value = _requestList;
    if (value == null) return null;
    if (_requestList is EqualUnmodifiableListView) return _requestList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<BlockedConnection>? _blockedConnections;
  @override
  List<BlockedConnection>? get blockedConnections {
    final value = _blockedConnections;
    if (value == null) return null;
    if (_blockedConnections is EqualUnmodifiableListView)
      return _blockedConnections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ConnectionRequestState(isLoading: $isLoading, isPageLoading: $isPageLoading, connected: $connected, hasError: $hasError, blockedLoading: $blockedLoading, requestLoadingIndex: $requestLoadingIndex, connectedId: $connectedId, message: $message, bizkitConnections: $bizkitConnections, bizkitUsers: $bizkitUsers, requestList: $requestList, blockedConnections: $blockedConnections)';
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
            (identical(other.connected, connected) ||
                other.connected == connected) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.blockedLoading, blockedLoading) ||
                other.blockedLoading == blockedLoading) &&
            (identical(other.requestLoadingIndex, requestLoadingIndex) ||
                other.requestLoadingIndex == requestLoadingIndex) &&
            (identical(other.connectedId, connectedId) ||
                other.connectedId == connectedId) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._bizkitConnections, _bizkitConnections) &&
            const DeepCollectionEquality()
                .equals(other._bizkitUsers, _bizkitUsers) &&
            const DeepCollectionEquality()
                .equals(other._requestList, _requestList) &&
            const DeepCollectionEquality()
                .equals(other._blockedConnections, _blockedConnections));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isPageLoading,
      connected,
      hasError,
      blockedLoading,
      requestLoadingIndex,
      connectedId,
      message,
      const DeepCollectionEquality().hash(_bizkitConnections),
      const DeepCollectionEquality().hash(_bizkitUsers),
      const DeepCollectionEquality().hash(_requestList),
      const DeepCollectionEquality().hash(_blockedConnections));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements ConnectionRequestState {
  const factory _Initial(
      {required final bool isLoading,
      required final bool isPageLoading,
      required final bool connected,
      required final bool hasError,
      required final bool blockedLoading,
      required final int requestLoadingIndex,
      final int? connectedId,
      final String? message,
      final List<BizkitConnection>? bizkitConnections,
      final List<BizkitUser>? bizkitUsers,
      final List<RequestModel>? requestList,
      final List<BlockedConnection>? blockedConnections}) = _$InitialImpl;

  @override
  bool get isLoading;
  @override
  bool get isPageLoading;
  @override
  bool get connected;
  @override
  bool get hasError;
  @override
  bool get blockedLoading;
  @override
  int get requestLoadingIndex;
  @override
  int? get connectedId;
  @override
  String? get message;
  @override
  List<BizkitConnection>? get bizkitConnections;
  @override
  List<BizkitUser>? get bizkitUsers;
  @override
  List<RequestModel>? get requestList;
  @override
  List<BlockedConnection>? get blockedConnections;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
