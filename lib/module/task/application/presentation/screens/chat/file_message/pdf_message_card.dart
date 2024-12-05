import 'package:bizkit/module/task/application/controller/chat/chat_controller.dart';
import 'package:bizkit/module/task/domain/model/chat/file/file_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

class PdfMessageCard extends StatelessWidget {
  const PdfMessageCard({super.key, required this.message});

  final FileMessage message;

  @override
  Widget build(BuildContext context) {
    final sender = message.sender;
    const image = 'asset/images/fa-solid_file-pdf.png';
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => Scaffold(
        //       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        //       primary: true,
        //       appBar: AppBar(
        //         surfaceTintColor: knill,
        //         title: Text(
        //           '${message.message}',
        //           style: Theme.of(context)
        //               .textTheme
        //               .displaySmall
        //               ?.copyWith(fontSize: 19),
        //         ),
        //       ),
        //       body: SfPdfViewer.network(
        //         message.file ?? '',
        //         key: _pdfViewerKey,
        //       ),
        //     ),
        //   ),
        // );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.h),
        decoration: BoxDecoration(
            borderRadius: kBorderRadius5,
            color: sender
                ? kwhite.withOpacity(0.3)
                : kGreyNormal.withOpacity(0.1)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Obx(() => Stack(
                  children: [
                    Image.asset(
                      image,
                      height: 30.h,
                    ),
                    if (Get.find<ChatController>()
                        .downloadingMessagesFilesId
                        .contains(message.messageId))
                      const CircularProgressIndicator(
                        color: kwhite,
                      )
                    else if (message.filePath?.isEmpty ?? true)
                      GestureDetector(
                        onTap: () => Get.find<ChatController>()
                            .downloadFile(message.messageId),
                        child: Icon(
                          Icons.downloading_sharp,
                          color: kwhite,
                          size: 25.h,
                          shadows: [
                            // Black shadow at the top
                            BoxShadow(
                              color: kblack.withOpacity(0.5),
                              offset: const Offset(0, -4), // Offset to the top
                              blurRadius: 10,
                            ),
                            // White shadow at the bottom
                            BoxShadow(
                              color: kblack.withOpacity(0.5),
                              offset:
                                  const Offset(0, 4), // Offset to the bottom
                              blurRadius: 10,
                            ),
                          ],
                        ),
                      )
                  ],
                )),
            kWidth10,
            Expanded(
              child: Text(
                message.message ?? 'Document',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(color: sender ? kwhite : kblack),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
