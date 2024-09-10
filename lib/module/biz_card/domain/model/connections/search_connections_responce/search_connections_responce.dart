import 'package:bizkit/module/biz_card/domain/model/connections/my_connections_responce/connection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'search_connections_responce.g.dart';

@JsonSerializable()
class SearchConnectionsResponce {
  List<MyConnection>? results;

  SearchConnectionsResponce({this.results});

  factory SearchConnectionsResponce.fromJson(Map<String, dynamic> json) {
    return _$SearchConnectionsResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchConnectionsResponceToJson(this);
}
