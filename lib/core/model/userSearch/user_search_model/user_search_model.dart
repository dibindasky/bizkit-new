import 'package:json_annotation/json_annotation.dart';

part 'user_search_model.g.dart';

@JsonSerializable()
class UserSearchModel {
  @JsonKey(name: 'search_term')
  String? searchTerm;
  int? page;
  @JsonKey(name: 'page_size')
  int? pageSize;

  UserSearchModel({this.searchTerm, this.page, this.pageSize});

  factory UserSearchModel.fromJson(Map<String, dynamic> json) {
    return _$UserSearchModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserSearchModelToJson(this);

  UserSearchModel copyWith({
    String? searchTerm,
    int? page,
    int? pageSize,
  }) {
    return UserSearchModel(
      searchTerm: searchTerm ?? this.searchTerm,
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
    );
  }
}
