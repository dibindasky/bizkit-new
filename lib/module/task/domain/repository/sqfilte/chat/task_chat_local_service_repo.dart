import 'package:bizkit/module/task/domain/model/chat/message.dart';

abstract class TaskChatLocalServiceRepo {
  /// [Message] insert if not present or else update
  Future<int?> insertOrUpdateMessage({required Message message});
}
