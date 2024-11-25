import 'package:json_annotation/json_annotation.dart';

part 'share_card_contact.g.dart';

@JsonSerializable()
class ShareCardContact {
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  @JsonKey(name: 'email')
  String? email;

  ShareCardContact({this.phoneNumber, this.email});

  factory ShareCardContact.fromJson(Map<String, dynamic> json) =>
      _$ShareCardContactFromJson(json);
  Map<String, dynamic> toJson() => _$ShareCardContactToJson(this);
}
