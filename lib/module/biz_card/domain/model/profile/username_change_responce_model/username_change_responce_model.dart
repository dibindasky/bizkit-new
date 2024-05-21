import 'package:json_annotation/json_annotation.dart';

part 'username_change_responce_model.g.dart';

@JsonSerializable()
class UsernameChangeResponceModel {
  int? id;
  String? name;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;

  UsernameChangeResponceModel({this.id, this.name, this.phoneNumber});

  factory UsernameChangeResponceModel.fromJson(Map<String, dynamic> json) {
    return _$UsernameChangeResponceModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UsernameChangeResponceModelToJson(this);
}
