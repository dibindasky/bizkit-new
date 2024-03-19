import 'package:json_annotation/json_annotation.dart';

import 'blocked_connection.dart';

part 'blocked_connection_model.g.dart';

@JsonSerializable()
class BlockedConnectionModel {
  int? count;
  dynamic next;
  dynamic previous;
  List<BlockedConnection>? results;

  BlockedConnectionModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory BlockedConnectionModel.fromJson(Map<String, dynamic> json) {
    return _$BlockedConnectionModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BlockedConnectionModelToJson(this);
}
