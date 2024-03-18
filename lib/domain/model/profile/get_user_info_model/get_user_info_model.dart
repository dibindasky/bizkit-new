import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'get_user_info_model.g.dart';

@JsonSerializable()
class GetUserInfoModel {
  Result? results;

  GetUserInfoModel({this.results});

  factory GetUserInfoModel.fromJson(Map<String, dynamic> json) {
    return _$GetUserInfoModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetUserInfoModelToJson(this);
}
