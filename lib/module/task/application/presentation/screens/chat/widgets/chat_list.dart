import 'package:bizkit/module/task/application/controller/chat/chat_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/chat_bubble/chat_bubble.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/current_location/current_location_card.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/file_message/file_message_card.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/poll/chat_poll_container.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/time_expence/time_expence_card.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/voice/voice_card.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/widgets/deleted_message_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({
    super.key,
    required this.active,
  });

  final bool active;

  @override
  Widget build(BuildContext context) {
    final chatController = Get.find<ChatController>();
    return GetBuilder<ChatController>(
        id: 'chat',
        builder: (controller) {
          print(
              'rebuid chat new chat arrived => ${chatController.messages.length}');
          final length = chatController.messages.length +
              (chatController.loadMoreLoading.value ? 1 : 0);
          return ListView.builder(
            reverse: true,
            shrinkWrap: true,
            controller: chatController.chatScrollController,
            itemCount: length,
            itemBuilder: (context, index) {
              if (controller.loadMoreLoading.value && index == length - 1) {
                return Container(
                  height: 15.h,
                  margin: EdgeInsets.symmetric(vertical: 5.h),
                  child: FittedBox(
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 5.h,
                      ),
                    ),
                  ),
                );
              }
              final message = chatController.messages[index];
              bool showArrow = true;
              if (index != 0 && index != chatController.messages.length - 1) {
                if (message.sender ==
                    chatController.messages[index + 1].sender) {
                  showArrow = false;
                }
              }
              // deleted message
              if (message.deleted) {
                return DeletedChatMessageContainer(message: message);
              }
              // text message
              if (message.textMessage != null) {
                return ChatBubble(
                  showArrow: showArrow,
                  message: message.textMessage!,
                );
              }
              // poll message
              if (message.poll != null) {
                return PollContainerChat(
                  message: message.poll!,
                  active: active,
                );
              }
              // time or expence
              if (message.timeExpence != null) {
                return TimeAndExpenseCard(
                  message: message.timeExpence!,
                );
              }
              // file type
              if (message.file != null) {
                return FileMessageCard(message: message.file!);
              }
              // current location
              if (message.currentLocation != null) {
                return CurrentLocationCard(message: message.currentLocation!);
              }
              // voice message
              if (message.voiceMessage != null) {
                return VoiceMessageCard(message: message.voiceMessage!);
              }
              return const Text('Unknown type');
            },
          );
        });
  }
}
