// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSearchModel _$UserSearchModelFromJson(Map<String, dynamic> json) =>
    UserSearchModel(
      searchTerm: json['search_term'] as String?,
      page: json['page'] as int?,
      pageSize: json['page_size'] as int?,
      filterType: json['filter_type'] as String?,
    );

Map<String, dynamic> _$UserSearchModelToJson(UserSearchModel instance) =>
    <String, dynamic>{
      'search_term': instance.searchTerm,
      'page': instance.page,
      'page_size': instance.pageSize,
      'filter_type': instance.filterType
    };
