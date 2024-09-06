import 'package:json_annotation/json_annotation.dart';

import 'shared_fields.dart';

part 'individual_shared_fields_responce.g.dart';

@JsonSerializable()
class IndividualSharedFieldsResponce {
  @JsonKey(name: 'bizcard_id')
  String? bizcardId;
  @JsonKey(name: 'shared_fields')
  IndividualSharedFields? sharedFields;

  IndividualSharedFieldsResponce({this.bizcardId, this.sharedFields});

  factory IndividualSharedFieldsResponce.fromJson(Map<String, dynamic> json) {
    return _$IndividualSharedFieldsResponceFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$IndividualSharedFieldsResponceToJson(this);
  }
}
