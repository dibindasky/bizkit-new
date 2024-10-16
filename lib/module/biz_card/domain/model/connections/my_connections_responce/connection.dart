import 'package:json_annotation/json_annotation.dart';

import 'card.dart';

part 'connection.g.dart';

@JsonSerializable()
class MyConnection {
  @JsonKey(name: 'to_user')
  int? localId;
  String? toUser;
  String? username;
  List<Card>? cards;

  MyConnection({this.toUser, this.username, this.cards, this.localId});

  factory MyConnection.fromJson(Map<String, dynamic> json) {
    return _$ConnectionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ConnectionToJson(this);

  // equals function to compare MyConnection objects
  bool equals(MyConnection other) {
    return localId == other.localId &&
           toUser == other.toUser &&
           username == other.username &&
           _compareCardLists(cards, other.cards);
  }

  // Updated function to compare lists of Card objects (ignores order)
  bool _compareCardLists(List<Card>? list1, List<Card>? list2) {
    if (list1 == null && list2 == null) return true;
    if (list1 == null || list2 == null || list1.length != list2.length) return false;

    // Create maps for easier comparison by connectionId
    final map1 = {for (var card in list1) card.toCard: card};
    final map2 = {for (var card in list2) card.toCard: card};

    if (map1.length != map2.length) return false;

    for (var id in map1.keys) {
      if (!map2.containsKey(id)) return false; // Different connectionId
      if (!map1[id]!.equals(map2[id]!)) return false; // Compare card fields
    }

    return true;
  }

  // Static constants
  static const String colCurrentUserId = 'current_user_id';
  static const String colLocalId = 'local_id';
  static const String colToUser = 'to_user';
  static const String colUserNmae = 'username';
}