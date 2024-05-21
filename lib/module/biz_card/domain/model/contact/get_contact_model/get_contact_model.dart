import 'package:json_annotation/json_annotation.dart';

part 'get_contact_model.g.dart';

@JsonSerializable()
class GetContactModel {
  @JsonKey(name: 'phone_numbers')
  List<String>? phoneNumbers;

  GetContactModel({this.phoneNumbers});

  factory GetContactModel.fromJson(Map<String, dynamic> json) {
    return _$GetContactModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetContactModelToJson(this);
}
