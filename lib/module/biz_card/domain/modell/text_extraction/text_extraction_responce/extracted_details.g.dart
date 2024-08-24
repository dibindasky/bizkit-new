// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extracted_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExtractedDetails _$ExtractedDetailsFromJson(Map<String, dynamic> json) =>
    ExtractedDetails(
      businessName: json['business_name'] as String?,
      emails:
          (json['emails'] as List<dynamic>?)?.map((e) => e as String).toList(),
      phoneNumbers: (json['phone_numbers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      location: (json['location'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      websites: (json['websites'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      designation: json['designation'] as String?,
      personName: json['person_name'] as String?,
      companyName: json['company_name'] as String?,
    );

Map<String, dynamic> _$ExtractedDetailsToJson(ExtractedDetails instance) =>
    <String, dynamic>{
      'business_name': instance.businessName,
      'emails': instance.emails,
      'phone_numbers': instance.phoneNumbers,
      'location': instance.location,
      'websites': instance.websites,
      'designation': instance.designation,
      'person_name': instance.personName,
      'company_name': instance.companyName,
    };
