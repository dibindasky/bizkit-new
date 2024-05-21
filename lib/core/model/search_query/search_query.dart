import 'package:json_annotation/json_annotation.dart';

part 'search_query.g.dart';

@JsonSerializable()
class SearchQuery {
  String? search;

  SearchQuery({this.search});

  factory SearchQuery.fromJson(Map<String, dynamic> json) {
    return _$SearchQueryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchQueryToJson(this);
}
