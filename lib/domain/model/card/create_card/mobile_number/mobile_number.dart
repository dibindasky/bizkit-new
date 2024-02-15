import 'package:json_annotation/json_annotation.dart';

part 'mobile_number.g.dart';

@JsonSerializable()
class MobileNumberCreate {
  @JsonKey(name: 'mobile_number')
  String? mobileNumber;

  MobileNumberCreate({this.mobileNumber});

  factory MobileNumberCreate.fromJson(Map<String, dynamic> json) {
    return _$MobileNumberCreateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MobileNumberCreateToJson(this);

  MobileNumberCreate copyWith({
    String? mobileNumber,
  }) {
    return MobileNumberCreate(
      mobileNumber: mobileNumber ?? this.mobileNumber,
    );
  }
}
