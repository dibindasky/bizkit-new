import 'package:json_annotation/json_annotation.dart';

part 'bizkit_user.g.dart';

@JsonSerializable()
class BizkitUser {
  int? id;
  String? name;
  String? company;
  String? image;
  String? designation;
  @JsonKey(name: 'connection_request_id')
  int? connectionId;

  BizkitUser({this.id,this.connectionId, this.name, this.company, this.image, this.designation});

  factory BizkitUser.fromJson(Map<String, dynamic> json) {
    return _$BizkitUserFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BizkitUserToJson(this);
}
