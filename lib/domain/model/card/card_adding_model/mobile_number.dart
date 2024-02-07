import 'package:json_annotation/json_annotation.dart';

part 'mobile_number.g.dart';

@JsonSerializable()
class MobileNumber {
  @JsonKey(name: 'mobile_number')
  String? mobileNumber;

  MobileNumber({this.mobileNumber});

  factory MobileNumber.fromJson(Map<String, dynamic> json) {
    return _$MobileNumberFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MobileNumberToJson(this);
}
