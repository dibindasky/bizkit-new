import 'package:json_annotation/json_annotation.dart';

part 'card_first_creation_model.g.dart';

@JsonSerializable()
class CardFirstCreationModel {
  String? name;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  String? email;
  String? designation;
  @JsonKey(name: 'business_category_id')
  int? businessCategoryId;
  String? photos;

  CardFirstCreationModel({
    this.name,
    this.phoneNumber,
    this.email,
    this.designation,
    this.businessCategoryId,
    this.photos,
  });

  factory CardFirstCreationModel.fromJson(Map<String, dynamic> json) {
    return _$CardFirstCreationModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CardFirstCreationModelToJson(this);
}
