import 'package:json_annotation/json_annotation.dart';

part 'individual_shared_fields_query_params_model.g.dart';

@JsonSerializable()
class IndividualSharedFieldsQueryParamsModel {
  @JsonKey(name: 'bizcard_id')
  String? bizcardId;

  IndividualSharedFieldsQueryParamsModel({this.bizcardId});

  factory IndividualSharedFieldsQueryParamsModel.fromJson(
      Map<String, dynamic> json) {
    return _$IndividualSharedFieldsQueryParamsModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$IndividualSharedFieldsQueryParamsModelToJson(this);
  }
}
