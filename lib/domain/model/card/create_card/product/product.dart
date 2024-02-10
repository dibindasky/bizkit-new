import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  bool? enquiry;
  String? label;
  String? description;
  dynamic product;

  Product({this.enquiry, this.label, this.description, this.product});

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  Product copyWith({
    bool? enquiry,
    String? label,
    String? description,
    dynamic product,
  }) {
    return Product(
      enquiry: enquiry ?? this.enquiry,
      label: label ?? this.label,
      description: description ?? this.description,
      product: product ?? this.product,
    );
  }
}
