import 'package:bizkit/module/task/application/presentation/screens/home/notification/widget/notification_container.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestSentBuilder extends StatelessWidget {
  const RequestSentBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.h, right: 15.h, top: 10.h),
      child: ListView.separated(
        separatorBuilder: (context, index) => adjustHieght(10),
        itemCount: 10,
        itemBuilder: (context, index) {
          return const NotificationCard();
        },
      ),
    );
  }
}
