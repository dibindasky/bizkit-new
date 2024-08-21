import 'package:bizkit/module/biz_card/application/presentation/screens/home/view/home_first_screen/home_first_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/view/home_second_screen/meeting_detail_section/meeting_detail_tab/history_log_tab_builder.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/view/home_second_screen/pageview_container_top/page_view_contents.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MeetingDetailScreen extends StatelessWidget {
  const MeetingDetailScreen({super.key, this.fadeCallBack});

  final VoidCallback? fadeCallBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: fadeCallBack == null,
        onPopInvoked: (didPop) {
          if (fadeCallBack != null) {
            showCardsNotifier.value = HomeScreensList.second;
            showCardsNotifier.notifyListeners();
            fadeCallBack!();
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              fadeCallBack != null
                  ? adjustHieght(khieght * .02)
                  : adjustHieght(khieght * 0.1),
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: khieght * .7,
                    decoration: BoxDecoration(
                      border: Border.all(color: neonShade, width: 1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      children: [
                        const SecondScreenPageViewContents(),
                        adjustHieght(khieght * .02),
                        // const Expanded(
                        //   child: MeetingDetailTabBarItems(),
                        // )
                        const Expanded(
                            child: MeetingDetailHistoryLogTabBuilder())
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        if (fadeCallBack != null) {
                          showCardsNotifier.value = HomeScreensList.second;
                          showCardsNotifier.notifyListeners();
                          fadeCallBack!();
                        } else {
                          Navigator.pop(context);
                        }
                      },
                      child: const CircleAvatar(
                        radius: 15,
                        backgroundColor: neonShade,
                        child: Icon(
                          Icons.close,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
