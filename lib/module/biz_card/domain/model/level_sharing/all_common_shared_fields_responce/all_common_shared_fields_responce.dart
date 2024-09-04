import 'package:json_annotation/json_annotation.dart';

import 'shared_fields.dart';

part 'all_common_shared_fields_responce.g.dart';

@JsonSerializable()
class AllCommonSharedFieldsResponce {
  @JsonKey(name: 'shared_fields')
  SharedFields? sharedFields;

  AllCommonSharedFieldsResponce({this.sharedFields});

  factory AllCommonSharedFieldsResponce.fromJson(Map<String, dynamic> json) {
    return _$AllCommonSharedFieldsResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AllCommonSharedFieldsResponceToJson(this);
}
