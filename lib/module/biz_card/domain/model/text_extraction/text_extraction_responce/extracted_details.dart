import 'package:json_annotation/json_annotation.dart';

part 'extracted_details.g.dart';

@JsonSerializable()
class ExtractedDetails {
  @JsonKey(name: 'business_name')
  String? businessName;
  List<String>? emails;
  @JsonKey(name: 'phone_numbers')
  List<String>? phoneNumbers;
  List<String>? location;
  List<String>? websites;
  String? designation;
  @JsonKey(name: 'person_name')
  String? personName;
  @JsonKey(name: 'company_name')
  String? companyName;
  @JsonKey(name: 'unidentified_text')
  List<String>? unIdentifiedText;

  ExtractedDetails({
    this.businessName,
    this.emails,
    this.phoneNumbers,
    this.location,
    this.websites,
    this.designation,
    this.personName,
    this.companyName,
    this.unIdentifiedText,
  });

  factory ExtractedDetails.fromJson(Map<String, dynamic> json) {
    return _$ExtractedDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ExtractedDetailsToJson(this);
}
