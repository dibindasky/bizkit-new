// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactModel _$ContactModelFromJson(Map<String, dynamic> json) => ContactModel(
      currentUserId: json['current_user_id'] as String?,
      userId: json['user_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      profilePicture: json['profile_picture'] as String?,
      connectionExist: json['connection_exist'] as bool?,
      connectionId: json['connection_id'] as String?,
      cardId: json['cardId'] as String?,
    );

Map<String, dynamic> _$ContactModelToJson(ContactModel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'profile_picture': instance.profilePicture,
      'connection_exist': instance.connectionExist,
      'connection_id': instance.connectionId,
      'cardId': instance.cardId,
      'current_user_id': instance.currentUserId,
    };
