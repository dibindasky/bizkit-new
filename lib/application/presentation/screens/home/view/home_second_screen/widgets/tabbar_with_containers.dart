import 'package:bizkit/application/presentation/screens/preview_commen_widgets/banking_personal_achieved/bank_person_achived_rows.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/preview_products_and_brands.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/preview_row_vice_icons/preview_row_wice_icons.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/preview_screen_meeting_time_description_section.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class PreviewScreenDetailMeetingTabBarHomeScreen extends StatelessWidget {
  const PreviewScreenDetailMeetingTabBarHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            TabBar(
              dividerHeight: 0,
              isScrollable: true,
              tabAlignment: TabAlignment.center,
              labelPadding: const EdgeInsets.symmetric(horizontal: 30),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: neonShadeGradient,
              ),
              tabs: [
                Tab(
                  child: SizedBox(
                    width: kwidth * 0.3,
                    child: const Center(
                      child: Text(
                        "History/Log",
                        style: TextStyle(color: kwhite),
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: SizedBox(
                    width: kwidth * 0.3,
                    child: const Center(
                      child: Text(
                        "Profile",
                        style: TextStyle(color: kwhite),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            adjustHieght(khieght * 0.02),
            Expanded(
              child: TabBarView(
                children: [
                  const PreviewScreenMeetingTimeDescriptionSection(),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListView(
                        children: [
                          const PreviewRowWiceIcons(),
                          adjustHieght(khieght * .01),
                          const PreviewBankPersonAchivedRows(),
                          adjustHieght(khieght * .02),
                          const PreviewProductsBrandsLists(),
                          adjustHieght(khieght * .02),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
