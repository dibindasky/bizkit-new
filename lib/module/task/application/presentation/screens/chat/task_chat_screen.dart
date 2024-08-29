import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/chat/chat_controller.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/file_message/file_message_card.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/poll/chat_poll_container.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/chat_bubble/chat_bubble.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/time_expence/time_expence_card.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/widgets/chat_text_field.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
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
            title: GestureDetector(
              onTap: () {
                GoRouter.of(context).push(Routes.taskChatScreen);
              },
              child: taskController.isLoading.value
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShimmerLoaderTile(
                          height: 8.h,
                          width: 100.w,
                        ),
                        adjustHieght(7.w),
                        ShimmerLoaderTile(
                          height: 5.h,
                          width: 200.w,
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        // const CircleAvatar(
                        //   backgroundImage: AssetImage(imageDummyAsset),
                        // ),
                        adjustWidth(5.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                taskController.singleTask.value.title ??
                                    'Task Name',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: textHeadStyle1,
                              ),
                              Text(
                                'Tap here for more info',
                                style: textStyle1.copyWith(color: kgrey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.info_outline, color: neonShade),
              ),
              adjustWidth(10.w),
            ],
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                      child: GetBuilder<ChatController>(
                          id: 'chat',
                          builder: (controller) {
                            print(
                                'rebuid chat new chat arrived => ${chatController.messages.length}');
                            return ListView.builder(
                              // reverse: true,
                              shrinkWrap: true,
                              controller: chatController.chatScrollController,
                              itemCount: chatController.messages.length,
                              itemBuilder: (context, index) {
                                final message = chatController.messages[index];
                                bool showArrow = true;
                                if (index != 0 &&
                                    index !=
                                        chatController.messages.length - 1) {
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
                                return const Text('Unknown type');
                              },
                            );
                          })),
                ),
                // adjustHieght(10),
                const ChatTextfieldContainer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
