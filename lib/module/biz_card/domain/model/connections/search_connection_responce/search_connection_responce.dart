import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'search_connection_responce.g.dart';

@JsonSerializable()
class SearchConnectionResponce {
  List<SearchConnection>? results;

  SearchConnectionResponce({this.results});

  factory SearchConnectionResponce.fromJson(Map<String, dynamic> json) {
    return _$SearchConnectionResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchConnectionResponceToJson(this);
}
