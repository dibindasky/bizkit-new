import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  int? id;
  String? product;
  bool? enquiry;
  String? label;
  String? description;

  Product({
    this.id,
    this.product,
    this.enquiry,
    this.label,
    this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
