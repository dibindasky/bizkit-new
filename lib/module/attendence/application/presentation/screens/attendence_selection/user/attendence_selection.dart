import 'package:bizkit/module/attendence/application/presentation/widgets/attendence_appbar.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../utils/constants/constant.dart';
import 'widgets/attendence_grid_view.dart';

class AttendenceSelection extends StatelessWidget {
  const AttendenceSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 14.0, right: 14.0, top: 24),
          child: Column(
            children: [
              const AttendenceAppBar(
                title: 'Welcome\nGuest',
              ),
              adjustHieght(45.h),
              AttendenceSelectionGridView(
                images: imageUrls,
                titles: titles,
                onTaps: onTaps,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
