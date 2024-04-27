import 'package:bizkit/domain/model/card/card/image_card/image_card.dart';
import 'package:bizkit/domain/model/extracted_text_model/extracted_text_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'personal_photo.dart';

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
  @JsonKey(name: 'photos')
  List<PersonalPhoto>? photos;
  @JsonKey(name: 'card_image')
  List<ImageCard>? cardImage;
  @JsonKey(name: 'card_extracted_data')
  ExtractedTextModel? cardJson;

  CardFirstCreationModel(
      {this.name,
      this.phoneNumber,
      this.email,
      this.designation,
      this.businessCategoryId,
      this.photos,
      this.cardImage,
      this.cardJson});

  factory CardFirstCreationModel.fromJson(Map<String, dynamic> json) {
    return _$CardFirstCreationModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CardFirstCreationModelToJson(this);
}
