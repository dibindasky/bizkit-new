import 'package:json_annotation/json_annotation.dart';

part 'page_query.g.dart';

@JsonSerializable()
class PageQuery {
  int? page;
  String? search;

  PageQuery({this.page, this.search});

  factory PageQuery.fromJson(Map<String, dynamic> json) {
    return _$PageQueryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PageQueryToJson(this);
}
