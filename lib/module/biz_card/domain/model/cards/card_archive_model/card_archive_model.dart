import 'package:json_annotation/json_annotation.dart';

part 'card_archive_model.g.dart';

@JsonSerializable()
class CardArchiveModel {
  @JsonKey(name: 'bizcard_id')
  String? bizcardId;
  @JsonKey(name: 'is_archived')
  bool? isArchived;

  CardArchiveModel({this.bizcardId, this.isArchived});

  factory CardArchiveModel.fromJson(Map<String, dynamic> json) {
    return _$CardArchiveModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CardArchiveModelToJson(this);
}
