import 'package:json_annotation/json_annotation.dart';

import 'connection.dart';

part 'my_connections_responce.g.dart';

@JsonSerializable()
class MyConnectionsResponce {
  List<MyConnection>? connections;

  MyConnectionsResponce({this.connections});

  factory MyConnectionsResponce.fromJson(Map<String, dynamic> json) {
    return _$MyConnectionsResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MyConnectionsResponceToJson(this);
}
