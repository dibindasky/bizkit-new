import 'package:bizkit/module/biz_card/domain/model/level_sharing/business_shared_fields/business_shared_fields.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/personal_shared_fields/personal_shared_fields.dart';

import 'package:json_annotation/json_annotation.dart';

part 'shared_fields.g.dart';

@JsonSerializable()
class IndividualSharedFields {
  PersonalSharedFields? personal;
  BusinessSharedFields? business;

  IndividualSharedFields({this.personal, this.business});

  factory IndividualSharedFields.fromJson(Map<String, dynamic> json) {
    return _$IndividualSharedFieldsFromJson(json);
  }

  Map<String, dynamic> toJson([bool sendPersonalOnly = false]) {
    Map<String, dynamic> map = {};
    map['personal'] = personal?.toJson();
    if (sendPersonalOnly) {
      return map;
    }
    map['business'] = business?.toJson();
    return map;
  }
}
