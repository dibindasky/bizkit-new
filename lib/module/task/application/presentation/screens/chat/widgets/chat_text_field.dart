import 'dart:async';

import 'package:bizkit/module/task/application/controller/chat/chat_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/widgets/attachments_chat_dialog.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
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

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChatController>();
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 50.h + maxLines * 10.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: lightGrey,
          border: const Border(top: BorderSide(color: klightgrey, width: 0))),
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
                  Timer(const Duration(milliseconds: 300), () {
                    controller.chatScrollController.animateTo(
                        controller
                                .chatScrollController.position.maxScrollExtent +
                            200,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease);
                  });
                },
                controller: controller.controller,
                onChanged: (value) {
                  setState(() {});
                  if (value == '') {
                    setState(() {
                      maxLines = 1;
                    });
                    return;
                  }
                  TextSpan span = TextSpan(
                    style: textStyle1.copyWith(color: kblack),
                    text: value,
                  );

                  TextPainter tp = TextPainter(
                    text: span,
                    textDirection: TextDirection.ltr,
                    maxLines: maxLines,
                  );

                  tp.layout(maxWidth: MediaQuery.of(context).size.width);
                  if (tp.didExceedMaxLines) {
                    setState(() {
                      maxLines++;
                    });
                  }
                },
                maxLines: maxLines,
                style: textStyle1.copyWith(color: kblack),
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 0),
                  hintText: 'send message ...',
                  hintStyle: textStyle1.copyWith(color: kgrey),
                  filled: true,
                  fillColor: kwhite,
                  border: InputBorder.none,
                ),
              ),
            ),
          )),
          controller.controller.text == ''
              ? Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.camera_alt_outlined,
                          color: neonShade),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.mic, color: neonShade),
                    ),
                  ],
                )
              : IconButton(
                  onPressed: () {
                    controller.sendTextMessage();
                  },
                  icon: const Icon(Icons.send, color: neonShade)),
        ],
      ),
    );
  }
}
