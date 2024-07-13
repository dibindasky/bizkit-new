import 'package:json_annotation/json_annotation.dart';

part 'user_search_model.g.dart';

@JsonSerializable()
class UserSearchModel {
  @JsonKey(name: 'search_term')
  String? searchTerm;

  UserSearchModel({this.searchTerm});

  factory UserSearchModel.fromJson(Map<String, dynamic> json) {
    return _$UserSearchModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserSearchModelToJson(this);
}
