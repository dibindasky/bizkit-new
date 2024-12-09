import 'package:json_annotation/json_annotation.dart';

import 'created_by.dart';

part 'datum.g.dart';

@JsonSerializable()
class QuickTaskRequests {
  String? id;
  String? title;
  String? description;
  @JsonKey(name: 'created_by')
  CreatedBy? createdBy;
  @JsonKey(name: 'created_at')
  String? createdAt;

  QuickTaskRequests({
    this.id,
    this.title,
    this.description,
    this.createdBy,
    this.createdAt,
  });

  factory QuickTaskRequests.fromJson(Map<String, dynamic> json) =>
      _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
