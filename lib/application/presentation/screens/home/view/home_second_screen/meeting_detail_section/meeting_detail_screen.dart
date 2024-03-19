import 'package:bizkit/application/business_logic/reminder/reminder_bloc.dart';
import 'package:bizkit/application/presentation/screens/home/view/home_second_screen/pageview_container_top/page_view_contents.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/screens/home/view/home_first_screen/home_first_screen.dart';
import 'package:bizkit/application/presentation/screens/home/view/home_second_screen/meeting_detail_section/meeting_detail_tab/meeting_detail_tab.dart';
import 'package:bizkit/application/presentation/utils/shimmier/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MeetingDetailScreen extends StatelessWidget {
  const MeetingDetailScreen({super.key, this.fadeCallBack});

  final VoidCallback? fadeCallBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: fadeCallBack == null,
        onPopInvoked: (didPop) => fadeCallBack != null
            ? () {
                showCardsNotifier.value = HomeScreensList.second;
                showCardsNotifier.notifyListeners();
                fadeCallBack!();
              }()
            : Navigator.pop(context),
        child: BlocBuilder<ReminderBloc, ReminderState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
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
                        height: khieght * .75,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: neonShade,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: state.isLoading
                                  ? ShimmerLoader(
                                      itemCount: 1,
                                      height: kwidth * 0.4,
                                      width: kwidth)
                                  : SecondScreenPageViewContents(
                                      reminder: state.reminder),
                            ),
                            adjustHieght(khieght * .02),
                            const Expanded(
                              child: MeetingDetailTabBarItems(),
                            )
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
            );
          },
        ),
      ),
    );
  }
}
