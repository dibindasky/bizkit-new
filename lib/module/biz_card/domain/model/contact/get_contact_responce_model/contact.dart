import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable()
class ContactModel {
  @JsonKey(name: 'user_id')
  String? userId;
  //int? id;
  String? name;
  String? email;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  @JsonKey(name: 'profile_picture')
  String? profilePicture;
  @JsonKey(name: 'connection_exist')
  bool? connectionExist;
  @JsonKey(name: 'connection_id')
  String? connectionId;
  @JsonKey(name: 'card_id')
  String? cardId;
  String? currentUserId;

  ContactModel({
    this.currentUserId,
    // this.id,
    this.userId,
    this.name,
    this.email,
    this.phoneNumber,
    this.profilePicture,
    this.connectionExist,
    this.connectionId,
    this.cardId,
  });

  static const String colCurrentUserId = 'currentUserId';
  static const String colUserId = 'userId';
  static const String colLocalId = 'localId';
  static const String colPhone = 'phone_number';
  static const String colName = 'name';
  static const String colPhoto = 'profile_picture';

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return _$ContactModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ContactModelToJson(this);
}
