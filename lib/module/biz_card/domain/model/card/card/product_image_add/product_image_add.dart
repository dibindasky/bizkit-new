import 'package:json_annotation/json_annotation.dart';

import 'image.dart';

part 'product_image_add.g.dart';

@JsonSerializable()
class ProductImageAdd {
  @JsonKey(name: 'product_id')
  int? productId;
  List<Image>? image;

  ProductImageAdd({this.productId, this.image});

  factory ProductImageAdd.fromJson(Map<String, dynamic> json) {
    return _$ProductImageAddFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductImageAddToJson(this);
}
