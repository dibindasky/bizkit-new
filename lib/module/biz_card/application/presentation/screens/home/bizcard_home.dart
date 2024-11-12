import 'package:bizkit/module/biz_card/application/presentation/screens/home/widgets/bizcards_list_section.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/widgets/home_appbar.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/widgets/my_connection_section.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BizCardHomeScreen extends StatefulWidget {
  const BizCardHomeScreen({super.key});

  @override
  State<BizCardHomeScreen> createState() => _BizCardHomeScreenState();
}

class _BizCardHomeScreenState extends State<BizCardHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const HomeAppBarWidget(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    adjustHieght(30.h),
                    const BizcardsListSection(),
                    adjustHieght(20.h),
                    const MyConnectionSection(),
                    kHeight40,
                  ],
                ),
              ),
            ),
            kHeight50
          ],
        ),
      ),
    );
  }
}
