import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'search_connection_responce.g.dart';

@JsonSerializable()
class SearchConnectionResponce {
  List<SearchConnection>? data;
  @JsonKey(name: 'has_more')
  bool? hasMore;
  @JsonKey(name: 'current_page')
  int? currentPage;
  @JsonKey(name: 'page_size')
  int? pageSize;

  SearchConnectionResponce({this.data,this.currentPage,this.hasMore,this.pageSize});

  factory SearchConnectionResponce.fromJson(Map<String, dynamic> json) {
    return _$SearchConnectionResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchConnectionResponceToJson(this);
}
