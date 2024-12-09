import 'package:json_annotation/json_annotation.dart';

part 'view.g.dart';

@JsonSerializable()
class Views {
  String? name;
  String? email;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  dynamic photo;
  @JsonKey(name: 'viewed_time')
  String? viewdTime;
  @JsonKey(name: 'user_id')
  String? userId;

  Views(
      {this.name,
      this.email,
      this.phoneNumber,
      this.photo,
      this.viewdTime,
      this.userId});

  factory Views.fromJson(Map<String, dynamic> json) => _$ViewsFromJson(json);

  Map<String, dynamic> toJson() => _$ViewsToJson(this);
}
