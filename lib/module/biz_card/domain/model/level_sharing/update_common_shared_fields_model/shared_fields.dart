import 'package:bizkit/module/biz_card/domain/model/level_sharing/business_shared_fields/business_shared_fields.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/personal_shared_fields/personal_shared_fields.dart';

import 'package:json_annotation/json_annotation.dart';

part 'shared_fields.g.dart';

@JsonSerializable()
class SharedFields {
  BusinessSharedFields? business;
  PersonalSharedFields? personal;

  SharedFields({this.business, this.personal});

  factory SharedFields.fromJson(Map<String, dynamic> json) {
    return _$SharedFieldsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SharedFieldsToJson(this);
}
