// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserView _$UserViewFromJson(Map<String, dynamic> json) => UserView(
      id: json['id'] as int?,
      profile: json['profile'] == null
          ? null
          : Profile.fromJson(json['profile'] as Map<String, dynamic>),
      userId: json['user_id'] as int?,
      cardId: json['card_id'] as int?,
    );

Map<String, dynamic> _$UserViewToJson(UserView instance) => <String, dynamic>{
      'id': instance.id,
      'profile': instance.profile,
      'user_id': instance.userId,
      'card_id': instance.cardId,
    };
