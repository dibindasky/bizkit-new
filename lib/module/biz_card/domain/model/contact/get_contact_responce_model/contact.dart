import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable()
class ContactModel {
  @JsonKey(name: 'user_id')
  String? userId;
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
  String? cardId;
  @JsonKey(name: 'current_user_id')
  String? currentUserId;

  ContactModel({
    this.currentUserId,
    this.userId,
    this.name,
    this.email,
    this.phoneNumber,
    this.profilePicture,
    this.connectionExist,
    this.connectionId,
    this.cardId,
  });

  static const String colCurrentUserId = 'current_user_id';
  static const String colUserId = 'user_id';
  static const String colLocalId = 'local_id';
  static const String colPhone = 'phone_number';
  static const String colName = 'name';
  static const String colPhoto = 'profile_picture';
  static const String colEmail = 'email';
  static const String colConnectionId = 'connection_id';
  static const String colCardId = 'cardId';

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return _$ContactModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ContactModelToJson(this);
}
