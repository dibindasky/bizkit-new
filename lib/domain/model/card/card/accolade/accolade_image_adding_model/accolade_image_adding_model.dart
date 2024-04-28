import 'package:bizkit/domain/model/card/card/image_card/image_card.dart';
import 'package:json_annotation/json_annotation.dart';

part 'accolade_image_adding_model.g.dart';

@JsonSerializable()
class AccoladeImageAddingModel {
  @JsonKey(name: 'accolade_id')
  int? accoladeId;
  List<ImageCard>? image;

  AccoladeImageAddingModel({this.accoladeId, this.image});

  factory AccoladeImageAddingModel.fromJson(Map<String, dynamic> json) {
    return _$AccoladeImageAddingModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AccoladeImageAddingModelToJson(this);
}
