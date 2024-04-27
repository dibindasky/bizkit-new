import 'package:json_annotation/json_annotation.dart';

part 'add_new_contact.g.dart';

@JsonSerializable()
class AddNewContact {
  String? name;
  String? phoneNumber;
  String? email;
  String? companyName;

  AddNewContact({this.name, this.phoneNumber, this.email, this.companyName});

  factory AddNewContact.fromJson(Map<String, dynamic> json) {
    return _$AddNewContactFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddNewContactToJson(this);
}
