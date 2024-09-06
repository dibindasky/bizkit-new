import 'package:json_annotation/json_annotation.dart';

part 'bizcard_id_parameter_model.g.dart';

@JsonSerializable()
class BizcardIdParameterModel {
  @JsonKey(name: 'bizcard_id')
  String? bizcardId;

  BizcardIdParameterModel({this.bizcardId});

  factory BizcardIdParameterModel.fromJson(Map<String, dynamic> json) {
    return _$BizcardIdParameterModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BizcardIdParameterModelToJson(this);
}
