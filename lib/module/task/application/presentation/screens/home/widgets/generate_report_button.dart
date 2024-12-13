import 'package:bizkit/module/module_manager/application/controller/internet_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/generate_report/generate_repor.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/snackbar/flutter_toast.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GenerateReportButton extends StatelessWidget {
  const GenerateReportButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final internetConnectinController =
        Get.find<InternetConnectionController>();
    return Center(
      child: EventButton(
        hieght: 40.h,
        width: 320.w,
        borderRadius: 10,
        text: 'Generate Report',
        textColr: Theme.of(context).colorScheme.onTertiary,
        onTap: () {
          if (internetConnectinController.isConnectedToInternet.value) {
            showModalBottomSheet(
              context: context,
              enableDrag: true,
              isDismissible: true,
              showDragHandle: true,
              isScrollControlled: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              builder: (BuildContext context) {
                return const ScreenTaskReportGenerator();
              },
            );
          } else {
            showCustomToast(
              message:
                  'You must be online to generate report. Please check your internet connection.',
              backgroundColor: kred,
            );
          }
        },
        color: neonNewLinearGradient,
      ),
    );
  }
}
