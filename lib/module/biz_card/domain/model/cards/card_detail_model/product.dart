import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  String? title;
  List<String>? images;
  String? description;
  bool? enquiry;
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'product_link')
  String? productLink;

  Product({
    this.title,
    this.images,
    this.description,
    this.enquiry,
    this.id,
    this.productLink,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
