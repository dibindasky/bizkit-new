import 'package:json_annotation/json_annotation.dart';

part 'pagination_query.g.dart';

@JsonSerializable()
class PaginationQuery {
  int? page;
  @JsonKey(name: 'page_size')
  int? pageSize;

  PaginationQuery({this.page, this.pageSize});

  factory PaginationQuery.fromJson(Map<String, dynamic> json) {
    return _$PaginationQueryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PaginationQueryToJson(this);
}
