import 'dart:convert';

import 'package:bizkit/module/task/application/controller/chat/chat_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PreviewContainer extends StatelessWidget {
  const PreviewContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChatController>();
    return Obx(
      () => controller.loadedImages.isEmpty
          ? kempty
          : Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: kBorderRadius10,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: MemoryImage(
                        base64Decode(
                            controller.loadedImages.first.base64 ?? ''),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 5.h,
                    right: 5.h,
                    child: IconButton(
                        onPressed: () {
                          controller.clearImageFromSelectedList(0);
                        },
                        icon: const Icon(Icons.clear)))
              ],
            ),
    );
  }
}

