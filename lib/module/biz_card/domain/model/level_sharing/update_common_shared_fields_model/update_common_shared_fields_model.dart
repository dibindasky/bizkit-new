import 'package:json_annotation/json_annotation.dart';

import 'shared_fields.dart';

part 'update_common_shared_fields_model.g.dart';

@JsonSerializable()
class UpdateCommonSharedFieldsModel {
  @JsonKey(name: 'shared_fields')
  SharedFields? sharedFields;
  @JsonKey(name: 'applicable_to_individual')
  bool? applicableToIndividual;

  UpdateCommonSharedFieldsModel({
    this.sharedFields,
    this.applicableToIndividual,
  });

  factory UpdateCommonSharedFieldsModel.fromJson(Map<String, dynamic> json) {
    return _$UpdateCommonSharedFieldsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UpdateCommonSharedFieldsModelToJson(this);
}
