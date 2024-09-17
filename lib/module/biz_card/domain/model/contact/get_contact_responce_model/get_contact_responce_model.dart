import 'package:bizkit/module/biz_card/domain/model/contact/get_contact_responce_model/contact.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_contact_responce_model.g.dart';

@JsonSerializable()
class GetContactResponceModel {
  List<ContactModel>? results;

  GetContactResponceModel({this.results});

  factory GetContactResponceModel.fromJson(Map<String, dynamic> json) {
    return _$GetContactResponceModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetContactResponceModelToJson(this);
}
