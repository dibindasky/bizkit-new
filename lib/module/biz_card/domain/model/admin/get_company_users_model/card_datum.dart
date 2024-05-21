import 'package:json_annotation/json_annotation.dart';

part 'card_datum.g.dart';

@JsonSerializable()
class CardDatum {
  int? id;
  String? designation;
  String? name;
  dynamic photos;

  CardDatum({this.id, this.designation, this.name, this.photos});

  factory CardDatum.fromJson(Map<String, dynamic> json) {
    return _$CardDatumFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CardDatumToJson(this);
}
