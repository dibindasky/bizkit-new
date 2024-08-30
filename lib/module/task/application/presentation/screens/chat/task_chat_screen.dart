import 'package:bizkit/module/task/application/controller/chat/chat_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/current_location/current_location_card.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/file_message/file_message_card.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/poll/chat_poll_container.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/chat_bubble/chat_bubble.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/time_expence/time_expence_card.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/widgets/chat_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:bizkit/utils/constants/colors.dart';

class ScreenTaskChat extends StatelessWidget {
  const ScreenTaskChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<CreateTaskController>();
    final chatController = Get.find<ChatController>();
    return Obx(
      () {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
                chatController.closeConnetion();
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            title: Text(
              taskController.singleTask.value.title ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textHeadStyle1,
            ),
            // actions: [
            // IconButton(
            //   onPressed: () {},
            //   icon: const Icon(Icons.info_outline, color: neonShade),
            // ),
            // adjustWidth(10.w),
            // ],
          ),
          body: SafeArea(
            child: chatController.connectionLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                            child: GetBuilder<ChatController>(
                                id: 'chat',
                                builder: (controller) {
                                  print(
                                      'rebuid chat new chat arrived => ${chatController.messages.length}');
                                  final length =
                                      chatController.messages.length +
                                          (chatController.loadMoreLoading.value
                                              ? 1
                                              : 0);
                                  return ListView.builder(
                                    reverse: true,
                                    shrinkWrap: true,
                                    controller:
                                        chatController.chatScrollController,
                                    itemCount: length,
                                    itemBuilder: (context, index) {
                                      if (controller.loadMoreLoading.value &&
                                          index == length - 1) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                      final message =
                                          chatController.messages[index];
                                      bool showArrow = true;
                                      if (index != 0 &&
                                          index !=
                                              chatController.messages.length -
                                                  1) {
                                        if (message.sender ==
                                            chatController
                                                .messages[index + 1].sender) {
                                          showArrow = false;
                                        }
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
                                            message: message.poll!);
                                      }
                                      // time or expence
                                      if (message.timeExpence != null) {
                                        return TimeAndExpenseCard(
                                          message: message.timeExpence!,
                                        );
                                      }
                                      // file type
                                      if (message.file != null) {
                                        return FileMessageCard(
                                            message: message.file!);
                                      }
                                      if (message.currentLocation != null) {
                                        return CurrentLocationCard(
                                            message: message.currentLocation!);
                                      }
                                      return const Text('Unknown type');
                                    },
                                  );
                                })),
                      ),
                      adjustHieght(5.h),
                      const ChatTextfieldContainer(),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
