import 'package:json_annotation/json_annotation.dart';

part 'request.g.dart';

@JsonSerializable()
class RequestModel {
  int? id;
  String? image;
  String? name;
  String? company;
  String? designation;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'card_user_id')
  int? cardUserId;

  RequestModel({
    this.id,
    this.image,
    this.name,
    this.company,
    this.designation,
    this.userId,
    this.cardUserId,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return _$RequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RequestModelToJson(this);
}
