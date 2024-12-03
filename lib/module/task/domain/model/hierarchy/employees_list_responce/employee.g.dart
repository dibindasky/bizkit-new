// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
      name: json['name'] as String?,
      email: json['email'] as String?,
      profilePicture: json['profile_picture'],
      empId: json['emp_id'] as String?,
      designation: json['designation'] as String?,
      userId: json['user_id'] as String?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'profile_picture': instance.profilePicture,
      'emp_id': instance.empId,
      'designation': instance.designation,
      'user_id': instance.userId,
      '_id': instance.id,
    };
