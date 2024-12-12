import 'dart:io';
import 'dart:typed_data';

import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/controller/chat/chat_controller.dart';
import 'package:bizkit/module/task/domain/model/chat/file/file_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
import 'package:bizkit/utils/widgets/blur_maker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ImageMessageCard extends StatefulWidget {
  const ImageMessageCard({
    Key? key,
    required this.message,
  }) : super(key: key);

  final FileMessage message;

  @override
  State<ImageMessageCard> createState() => _ImageMessageCardState();
}

class _ImageMessageCardState extends State<ImageMessageCard> {
  late Uint8List image;

  @override
  void initState() {
    super.initState();
    // _decodeImage();
  }

  // @override
  // void didUpdateWidget(covariant ImageMessageCard oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   if (oldWidget.message.file != widget.message.file) {
  //     _decodeImage();
  //   }
  // }

  // void _decodeImage() {
  //   setState(() {
  //     image = base64Decode(widget.message.file ?? '');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final chatController = Get.find<ChatController>();
    return GestureDetector(
      onTap: () {
        if (widget.message.filePath?.isNotEmpty ?? false) {
          GoRouter.of(context).pushNamed(Routes.slidablePhotoGallery, extra: {
            'initial': 0,
            'memory': false,
            'file': true,
            'images': [widget.message.filePath!]
          });
        } else {
          chatController.downloadFile(widget.message.messageId);
        }
      },
      child: Container(
        height: 200.h,
        decoration: BoxDecoration(
          borderRadius: kBorderRadius5,
          image: widget.message.filePath?.isNotEmpty ?? false
              ? DecorationImage(
                  fit: BoxFit.cover,
                  image: FileImage(File(widget.message.filePath ?? '')),
                )
              : null,
        ),
        child: widget.message.filePath?.isNotEmpty ?? false
            ? null
            : Stack(
                children: [
                  BlurMaker(
                      show: true,
                      child: NetworkImageWithLoader(widget.message.file!,
                          radius: 5)),
                  Obx(
                    () => Center(
                      child: chatController.downloadingMessagesFilesId
                              .contains(widget.message.messageId ?? '')
                          ? CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.primary,
                            )
                          : GestureDetector(
                              onTap: () => chatController
                                  .downloadFile(widget.message.messageId),
                              child: Icon(
                                Icons.downloading_sharp,
                                color: Theme.of(context).colorScheme.primary,
                                size: 40.h,
                                shadows: [
                                  // Black shadow at the top
                                  BoxShadow(
                                    color: kblack.withOpacity(0.5),
                                    offset: const Offset(
                                        0, -4), // Offset to the top
                                    blurRadius: 10,
                                  ),
                                  // White shadow at the bottom
                                  BoxShadow(
                                    color: kwhite.withOpacity(0.5),
                                    offset: const Offset(
                                        0, 4), // Offset to the bottom
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                            ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
