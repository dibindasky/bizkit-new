import 'package:json_annotation/json_annotation.dart';

part 'page_query.g.dart';

@JsonSerializable()
class PageQuery {
  int? page;

  PageQuery({this.page});

  factory PageQuery.fromJson(Map<String, dynamic> json) {
    return _$PageQueryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PageQueryToJson(this);
}
