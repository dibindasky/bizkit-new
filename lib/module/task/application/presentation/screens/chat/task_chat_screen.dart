import 'package:bizkit/module/task/application/controller/chat/chat_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/preview_widgets/voice_preview_container.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/widgets/chat_list.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/widgets/chat_text_field.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/preview_widgets/preview_container_chat.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:go_router/go_router.dart';

class ScreenTaskChat extends StatelessWidget {
  const ScreenTaskChat({
    super.key,
    required this.active,
    required this.taskTitle,
  });

  final bool active;
  final String taskTitle;

  @override
  Widget build(BuildContext context) {
    final chatController = Get.find<ChatController>();
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        if (didPop) {
          chatController.closeConnetion(context);
          return;
        }
      },
      child: Obx(
        () {
          return Scaffold(
            backgroundColor: Get.isDarkMode ? kblack : kdarkOffWhite,
            body: SafeArea(
              child: chatController.connectionLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 6.h),
                            child: AnimatedCrossFade(
                                crossFadeState:
                                    chatController.selectedMessages.isNotEmpty
                                        ? CrossFadeState.showSecond
                                        : CrossFadeState.showFirst,
                                firstChild: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        GoRouter.of(context).pop();
                                        // chatController.closeConnetion(context);
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        child: Icon(
                                          Icons.arrow_back_ios_new,
                                          size: 18.sp,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onTertiary,
                                        ),
                                      ),
                                    ),
                                    adjustWidth(10.w),
                                    Text(
                                      taskTitle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall
                                          ?.copyWith(fontSize: 15),
                                    ),
                                  ],
                                ),
                                secondChild: Row(children: [
                                  GestureDetector(
                                    onTap: () {
                                      chatController.clearSelectedMessages();
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      child: Icon(
                                        Icons.close,
                                        size: 18.sp,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onTertiary,
                                      ),
                                    ),
                                  ),
                                  adjustWidth(10.w),
                                  Text(
                                    "${chatController.selectedMessages.length} Selected",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall
                                        ?.copyWith(fontSize: 15),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                      child: const Icon(Icons.delete),
                                      onTap: () {
                                        chatController.deleteFileFromChat();
                                      })
                                ]),
                                duration: const Duration(milliseconds: 300))),
                        const Divider(
                          thickness: 1,
                          color: kGrayLight,
                        ),
                        adjustHieght(5.h),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                            child: Obx(
                              () {
                                return chatController.loadedImages.isNotEmpty
                                    ? const PreviewContainer()
                                    : ChatListView(active: active);
                              },
                            ),
                          ),
                        ),
                        adjustHieght(5.h),
                        const VoicePreviewChat(),
                        active ? const ChatTextfieldContainer() : kempty,
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}
