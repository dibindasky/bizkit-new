import 'package:json_annotation/json_annotation.dart';

import 'bizkit_connection.dart';

part 'get_bizkit_connections_response_model.g.dart';

@JsonSerializable()
class GetBizkitConnectionsResponseModel {
  int? count;
  dynamic next;
  dynamic previous;
  List<BizkitConnection>? results;

  GetBizkitConnectionsResponseModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory GetBizkitConnectionsResponseModel.fromJson(
      Map<String, dynamic> json) {
    return _$GetBizkitConnectionsResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetBizkitConnectionsResponseModelToJson(this);
  }
}
