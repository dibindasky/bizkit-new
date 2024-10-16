import 'package:json_annotation/json_annotation.dart';

part 'assigned_to_detail.g.dart';

@JsonSerializable()
class AssignedToDetail {
  // Local ID
  int? localId;

  @JsonKey(name: 'user')
  String? userId;
  String? name;
  @JsonKey(name: 'is_accepted')
  String? isAccepted;

  AssignedToDetail({this.userId, this.name, this.isAccepted});

  factory AssignedToDetail.fromJson(Map<String, dynamic> json) {
    return _$AssignedToDetailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AssignedToDetailToJson(this);

  // equals function to compare AssignedToDetail objects
  bool equals(AssignedToDetail other) {
    return userId == other.userId &&
        name == other.name &&
        isAccepted == other.isAccepted;
  }

  // List comparison function for AssignedToDetail (ignores order)
  static bool compareAssignedToDetailLists(
      List<AssignedToDetail>? list1, List<AssignedToDetail>? list2) {
    if (list1 == null && list2 == null) return true;
    if (list1 == null || list2 == null || list1.length != list2.length) {
      return false;
    }

    final map1 = {for (var detail in list1) detail.userId: detail};
    final map2 = {for (var detail in list2) detail.userId: detail};

    if (map1.length != map2.length) return false;

    for (var id in map1.keys) {
      if (!map2.containsKey(id)) return false;
      if (!map1[id]!.equals(map2[id]!)) return false;
    }

    return true;
  }

  static const colTaskAssignedToDetailLocalId =
      'task_assigned_to_detail_local_id';

  static const colTaskAssignedToDetailUserId =
      'task_assigned_to_detail_user_id';
  static const colTaskAssignedToDetailUserName =
      'task_assigned_to_detail_username';
  static const colTaskAssignedToDetailIsAccepted =
      'task_assigned_to_detail_is_accepted';

  static const ccolTaskAssignedToDetailReferenceId =
      'task_assigned_to_detail_reference_id ';
}
