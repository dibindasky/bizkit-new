import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'search_connections_responce.g.dart';

@JsonSerializable()
class SearchConnectionsResponce {
  List<ConnectionsList>? results;

  SearchConnectionsResponce({this.results});

  factory SearchConnectionsResponce.fromJson(Map<String, dynamic> json) {
    return _$SearchConnectionsResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchConnectionsResponceToJson(this);
}
