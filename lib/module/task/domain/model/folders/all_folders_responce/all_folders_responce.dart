import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'all_folders_responce.g.dart';

@JsonSerializable()
class AllFoldersResponce {
  List<Datum>? data;

  AllFoldersResponce({this.data});

  factory AllFoldersResponce.fromJson(Map<String, dynamic> json) {
    return _$AllFoldersResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AllFoldersResponceToJson(this);
}
