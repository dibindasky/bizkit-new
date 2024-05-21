import 'package:bizkit/module/biz_card/domain/model/card/card/image_card/image_card.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  int? id;
  //ProductImageAdd? productImages;
  List<ImageCard>? image;
  bool? enquiry;
  String? label;
  String? description;
  @JsonKey(name: 'card_id')
  int? cardId;

  Product({
    this.id,
    this.enquiry,
    this.label,
    this.description,
    this.image,
    //this.productImages,
    this.cardId,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
