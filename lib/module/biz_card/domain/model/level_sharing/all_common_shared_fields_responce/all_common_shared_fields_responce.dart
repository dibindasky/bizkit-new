import 'package:bizkit/module/biz_card/domain/model/level_sharing/shared_fields/shared_fields.dart';
import 'package:json_annotation/json_annotation.dart';

part 'all_common_shared_fields_responce.g.dart';

@JsonSerializable()
class AllCommonSharedFieldsResponce {
  @JsonKey(name: 'shared_fields')
  SharedFields? sharedFields;
  @JsonKey(name: 'applicable_to_individual')
  bool? applicableToIndividual;

  AllCommonSharedFieldsResponce(
      {this.sharedFields, this.applicableToIndividual});

  factory AllCommonSharedFieldsResponce.fromJson(Map<String, dynamic> json) {
    return _$AllCommonSharedFieldsResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AllCommonSharedFieldsResponceToJson(this);
  AllCommonSharedFieldsResponce copyWith({
    SharedFields? sharedFields,
    bool? applicableToIndividual,
  }) {
    return AllCommonSharedFieldsResponce(
      sharedFields: sharedFields ?? this.sharedFields,
      applicableToIndividual:
          applicableToIndividual ?? this.applicableToIndividual,
    );
  }
}
