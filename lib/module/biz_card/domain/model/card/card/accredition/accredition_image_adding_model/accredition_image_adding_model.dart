import 'package:bizkit/module/biz_card/domain/model/card/card/image_card/image_card.dart';
import 'package:json_annotation/json_annotation.dart';

part 'accredition_image_adding_model.g.dart';

@JsonSerializable()
class AccreditionImageAddingModel {
  @JsonKey(name: 'accreditation_id')
  int? accreditionId;
  List<ImageCard>? image;

  AccreditionImageAddingModel({this.accreditionId, this.image});

  factory AccreditionImageAddingModel.fromJson(Map<String, dynamic> json) {
    return _$AccreditionImageAddingModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AccreditionImageAddingModelToJson(this);
}
