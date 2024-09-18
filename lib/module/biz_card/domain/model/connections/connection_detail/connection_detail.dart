import 'package:json_annotation/json_annotation.dart';

part 'connection_detail.g.dart';

@JsonSerializable()
class ConnectionDetail {
  @JsonKey(name: 'connection_id')
  final String? connectionId;
  final String? notes;
  final List<String>? selfie;
  final String? occasion;
  final String? location;
  final String? category;

  ConnectionDetail({
    this.connectionId,
    this.notes,
    this.selfie,
    this.occasion,
    this.location,
    this.category,
  });

  factory ConnectionDetail.fromJson(Map<String, dynamic> json) =>
      _$ConnectionDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ConnectionDetailToJson(this);
}
