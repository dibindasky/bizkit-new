import 'package:bizkit/module/biz_card/domain/model/card/card/image_card/image_card.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_image_adding_model.g.dart';

@JsonSerializable()
class ProductImageAddingModel {
  @JsonKey(name: 'product_id')
  int? productId;
  List<ImageCard>? image;

  ProductImageAddingModel({this.productId, this.image});

  factory ProductImageAddingModel.fromJson(Map<String, dynamic> json) {
    return _$ProductImageAddingModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductImageAddingModelToJson(this);
}
