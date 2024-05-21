import 'package:json_annotation/json_annotation.dart';

part 'add_connection_tag_model.g.dart';

@JsonSerializable()
class AddConnectionTagModel {
  String? tag;

  AddConnectionTagModel({this.tag});

  factory AddConnectionTagModel.fromJson(Map<String, dynamic> json) {
    return _$AddConnectionTagModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddConnectionTagModelToJson(this);
}
