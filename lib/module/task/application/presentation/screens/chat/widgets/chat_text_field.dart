import 'dart:async';

import 'package:bizkit/module/task/application/controller/chat/chat_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/widgets/attachments_chat_dialog.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatTextfieldContainer extends StatefulWidget {
  const ChatTextfieldContainer({
    super.key,
  });

  @override
  State<ChatTextfieldContainer> createState() => _ChatTextfieldContainerState();
}

class _ChatTextfieldContainerState extends State<ChatTextfieldContainer> {
  int maxLines = 1;
  final int maxAllowedLines = 5;
  bool typing = false;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChatController>();
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 50.h + maxLines * 10.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: klightDarkGrey,
        // border: Border(
        //   top: BorderSide(color: klightgrey, width: 0),
        // ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => const AttachmentsChatDialog());
            },
            icon: const Icon(Icons.add, color: neonShade),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: ClipRRect(
                borderRadius: kBorderRadius25,
                child: TextField(
                  onTap: () {
                    Timer(const Duration(milliseconds: 200), () {
                      if (controller.loadedImages.isEmpty) {
                        controller.chatScrollController.animateTo(
                          controller
                              .chatScrollController.position.minScrollExtent,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      }
                    });
                  },
                  controller: controller.controller,
                  onChanged: onChanged,
                  textInputAction: TextInputAction.newline,
                  maxLines: maxLines == 1 ? null : maxLines,
                  style: textStyle1.copyWith(color: kblack),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 0),
                    hintText: 'Send message ...',
                    hintStyle: textStyle1.copyWith(color: kgrey),
                    filled: true,
                    fillColor: kwhite,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          Obx(
            () => controller.loadedImages.isNotEmpty ||
                    controller.controller.text != ''
                ? IconButton(
                    onPressed: () {
                      controller.loadedImages.isNotEmpty
                          // send image if image is selected
                          ? controller.sendImageBase64()
                          // send text message
                          : controller.sendTextMessage();
                      setState(() {
                        maxLines = 1;
                      });
                    },
                    icon: const Icon(
                      Icons.send,
                      color: neonShade,
                    ),
                  )
                : Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          controller.getImageBase64(camera: true);
                        },
                        icon: const Icon(Icons.camera_alt_outlined,
                            color: neonShade),
                      ),
                      Obx(() {
                        return GestureDetector(
                          onTap: controller.micTap,
                          onLongPress: controller.micTap,
                          onLongPressUp: controller.micTap,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: controller.isRecording.value
                                ? neonShade.withOpacity(0.5)
                                : knill,
                            child: Icon(
                              controller.isRecording.value
                                  ? Icons.mic_off
                                  : Icons.mic,
                              color: neonShade,
                            ),
                          ),
                        );
                      })
                      // IconButton(
                      //   onPressed: () {

                      //     // Navigator.push(
                      //     //     context,
                      //     //     MaterialPageRoute(
                      //     //       builder: (context) => AudioRecorderScreen(),
                      //     //     ));
                      //   },
                      //   icon: const Icon(Icons.mic, color: neonShade),
                      // ),
                    ],
                  ),
          )
        ],
      ),
    );
  }

  void onChanged(String value) {
    if (value == '') {
      setState(() {
        maxLines = 1;
      });
      return;
    }

    // Calculate the height of the text to determine the number of lines
    TextSpan span = TextSpan(
      style: textStyle1.copyWith(color: kblack),
      text: value,
    );

    TextPainter tp = TextPainter(
      text: span,
      textDirection: TextDirection.ltr,
      maxLines: maxAllowedLines, // Set maxLines to the max allowed lines
    );

    tp.layout(maxWidth: MediaQuery.of(context).size.width - ((16 + 24) * 3));

    if (tp.didExceedMaxLines) {
      setState(() {
        maxLines = maxAllowedLines;
      });
    } else {
      setState(() {
        maxLines = tp.computeLineMetrics().length;
      });
    }
  }
}

