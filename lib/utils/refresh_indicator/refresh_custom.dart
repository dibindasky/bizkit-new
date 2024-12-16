import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ErrorRefreshIndicator extends StatelessWidget {
  const ErrorRefreshIndicator({
    super.key,
    this.shrinkWrap = false,
    // required this.onTap,
    required this.onRefresh,
    this.errorMessage = 'something went wrong pull to refresh',
    this.image,
  });

  final VoidCallback onRefresh;
  // final VoidCallback onTap;
  final String errorMessage;
  final bool shrinkWrap;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        onRefresh();
        await Future.delayed(const Duration(milliseconds: 1500));
      },
      child: ListView(
        shrinkWrap: shrinkWrap,
        children: [
          adjustHieght(50),
          image != null
              ? Image.asset(image!)
              : const Icon(Icons.refresh, color: kgrey),
          Center(
              child: Text(
            errorMessage,
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(fontSize: 13),
          )),
          adjustHieght(15.h),
          Center(
            child: EventButton(
              textColr: Get.isDarkMode ? kblack : kwhite,
              color: LinearGradient(
                  colors: Get.isDarkMode ? [kblack, kblack] : [kblack, kblack]),
              text: 'Try Again',
              onTap: onRefresh,
            ),
          ),
        ],
      ),
    );
  }
}

class InternetConnectionLostWidget extends StatelessWidget {
  const InternetConnectionLostWidget({
    required this.onTap,
    this.showImage = true,
    this.shrinkWrap = false,
    super.key,
  });
  final VoidCallback onTap;
  final bool? showImage;
  final bool? shrinkWrap;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: shrinkWrap ?? false,
      children: [
        adjustHieght(20),
        if (showImage == true) Image.asset(internetConnectionLost),
        Center(
            child: Text(
          textAlign: TextAlign.center,
          'Maybe you are not connected to the internet ?',
          style:
              Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 13),
        )),
        adjustHieght(5.h),
        Center(
            child: Text(
          'Please check your connection and try again.',
          style: Theme.of(context)
              .textTheme
              .displaySmall
              ?.copyWith(fontSize: 10, color: kGreyNormal),
          textAlign: TextAlign.center,
        )),
        adjustHieght(10),
        Center(
          child: EventButton(
            textColr: Get.isDarkMode ? kblack : kwhite,
            color: LinearGradient(
                colors: Get.isDarkMode ? [kblack, kblack] : [kblack, kblack]),
            text: 'Try Again',
            onTap: onTap,
          ),
        ),
        const SizedBox(width: double.infinity)
      ],
    );
  }
}
