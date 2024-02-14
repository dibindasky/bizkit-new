import 'package:json_annotation/json_annotation.dart';

import 'contact.dart';

part 'get_contacts_response_model.g.dart';

@JsonSerializable()
class GetContactsResponseModel {
  int? count;
  dynamic next;
  dynamic previous;
  List<ContactModel>? results;

  GetContactsResponseModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory GetContactsResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetContactsResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetContactsResponseModelToJson(this);
}
