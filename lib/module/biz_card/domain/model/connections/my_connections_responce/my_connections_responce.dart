import 'package:json_annotation/json_annotation.dart';

import 'connection.dart';

part 'my_connections_responce.g.dart';

@JsonSerializable()
class MyConnectionsResponce {
  @JsonKey(name: 'data')
  List<MyConnection>? data;
  @JsonKey(name: 'has_more')
  bool? hasMore;
  @JsonKey(name: 'current_page')
  int? currentPage;
  @JsonKey(name: 'page_size')
  int? pageSize;

  MyConnectionsResponce(
      {this.data, this.currentPage, this.hasMore, this.pageSize});

  factory MyConnectionsResponce.fromJson(Map<String, dynamic> json) {
    return _$MyConnectionsResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MyConnectionsResponceToJson(this);
}
