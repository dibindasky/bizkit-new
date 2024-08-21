import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageReadMarker extends StatelessWidget {
  const MessageReadMarker({
    super.key,
    required this.read,
  });

  final bool read;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15.sp,
      width: 15.sp,
      child: FittedBox(
        child: Stack(
          children: [
            Icon(Icons.check, color: read ? kblue : kblack.withOpacity(0.7)),
            Positioned(
                left: 5,
                child: Icon(Icons.check,
                    color: read ? kblue : kGrayLight.withOpacity(0.7))),
          ],
        ),
      ),
    );
  }
}
