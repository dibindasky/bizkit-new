import 'package:json_annotation/json_annotation.dart';

import 'bizkit_user.dart';

part 'get_serch_connection_response_model.g.dart';

@JsonSerializable()
class GetSerchConnectionResponseModel {
  int? count;
  dynamic next;
  dynamic previous;
  List<BizkitUser>? results;

  GetSerchConnectionResponseModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory GetSerchConnectionResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetSerchConnectionResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetSerchConnectionResponseModelToJson(this);
  }
}
