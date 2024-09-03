import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/domain/model/chat/file_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PdfMessageCard extends StatelessWidget {
  const PdfMessageCard({super.key, required this.message});

  final FileMessage message;

  @override
  Widget build(BuildContext context) {
    final sender = message.sender;
    const image = 'asset/images/fa-solid_file-pdf.png';
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushNamed(Routes.pdfPreview,
            extra: {'base64': message.file, 'label': message.message});
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.h),
        decoration: BoxDecoration(
            borderRadius: kBorderRadius5,
            color: sender ? kwhite.withOpacity(0.3) : lightGrey),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image.asset(
              image,
              height: 30.h,
            ),
            kWidth10,
            Expanded(child: Text(message.message ?? 'Document')),
          ],
        ),
      ),
    );
  }
}
