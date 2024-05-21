// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_selected_users_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanySelectedUsersListModel _$CompanySelectedUsersListModelFromJson(
        Map<String, dynamic> json) =>
    CompanySelectedUsersListModel(
      id: json['id'] as int?,
      password: json['password'] as String?,
      lastLogin: json['last_login'],
      type: json['type'] as int?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      company: json['company'],
      websiteLink: json['website_link'],
      address: json['address'] as String?,
      deviceId: json['device_id'] as String?,
      deviceToken: json['device_token'] as String?,
      hasCard: json['has_card'] as bool?,
      isLogined: json['is_logined'] as bool?,
      profilePic: json['profile_pic'] as String?,
      isBusiness: json['is_business'] as bool?,
      isActive: json['is_active'] as bool?,
      isVerified: json['is_verified'] as bool?,
      isStaff: json['is_staff'] as bool?,
      isSuperuser: json['is_superuser'] as bool?,
      forgotPasswordOtp: json['forgot_password_otp'],
      forgotPasswordEmailVerified:
          json['forgot_password_email_verified'] as bool?,
    );

Map<String, dynamic> _$CompanySelectedUsersListModelToJson(
        CompanySelectedUsersListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'password': instance.password,
      'last_login': instance.lastLogin,
      'type': instance.type,
      'email': instance.email,
      'name': instance.name,
      'phone_number': instance.phoneNumber,
      'company': instance.company,
      'website_link': instance.websiteLink,
      'address': instance.address,
      'device_id': instance.deviceId,
      'device_token': instance.deviceToken,
      'has_card': instance.hasCard,
      'is_logined': instance.isLogined,
      'profile_pic': instance.profilePic,
      'is_business': instance.isBusiness,
      'is_active': instance.isActive,
      'is_verified': instance.isVerified,
      'is_staff': instance.isStaff,
      'is_superuser': instance.isSuperuser,
      'forgot_password_otp': instance.forgotPasswordOtp,
      'forgot_password_email_verified': instance.forgotPasswordEmailVerified,
    };
