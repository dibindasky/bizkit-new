import 'package:json_annotation/json_annotation.dart';

part 'search_query.g.dart';

@JsonSerializable()
class SearchQuery {
  
  @JsonKey(name: 'search_term')
  String? search;

  @JsonKey(name: 'page')
  int?page;

  @JsonKey(name: 'page_size')
  int?pageSize;

  SearchQuery({this.search,this.page,this.pageSize});

  factory SearchQuery.fromJson(Map<String, dynamic> json) {
    return _$SearchQueryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchQueryToJson(this);
}
