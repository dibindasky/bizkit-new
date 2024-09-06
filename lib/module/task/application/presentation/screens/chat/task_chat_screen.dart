import 'dart:async';

import 'package:bizkit/module/task/application/controller/chat/chat_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/widgets/chat_list.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/widgets/chat_text_field.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/widgets/preview_container_chat.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:bizkit/utils/constants/colors.dart';

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
    return Obx(
      () {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                chatController.closeConnetion(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            title: Text(
              taskTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textHeadStyle1,
            ),
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
                      // Container(
                      //   height: 40.h,
                      //   margin: const EdgeInsets.all(5),
                      //   padding: const EdgeInsets.all(5),
                      //   decoration: BoxDecoration(
                      //     color: kGrayLight,
                      //     borderRadius: kBorderRadius10,
                      //   ),
                      //   // child: 
                      // ),
                      active ? const ChatTextfieldContainer() : kempty,
                    ],
                  ),
          ),
        );
      },
    );
  }
}
