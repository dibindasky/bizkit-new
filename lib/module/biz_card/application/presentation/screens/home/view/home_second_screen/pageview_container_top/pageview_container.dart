import 'package:bizkit/module/biz_card/application/business_logic/reminder/reminder_bloc.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/view/first_and_second_commen/pageview_animated_builder.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/view/home_second_screen/pageview_container_top/page_view_contents.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/view/home_first_screen/home_first_screen.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/shimmier/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenPageviewAnimatedContaner extends StatefulWidget {
  const HomeScreenPageviewAnimatedContaner(
      {super.key, required this.fadeCallBack});

  final VoidCallback fadeCallBack;

  @override
  State<HomeScreenPageviewAnimatedContaner> createState() =>
      _HomeScreenPageviewAnimatedContanerState();
}

class _HomeScreenPageviewAnimatedContanerState
    extends State<HomeScreenPageviewAnimatedContaner> {
  late PageController pageController;
  int currentIndex = 0;
  double pageValue = 0.0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      viewportFraction: 0.8,
    )..addListener(() {
        setState(() {
          pageValue = pageController.page!;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kwidth * 0.6,
      child: BlocBuilder<ReminderBloc, ReminderState>(
        builder: (context, state) {
          print('state todays data = > ${state.toDaysRminderList}');
          if (state.isLoading) {
            return ShimmerLoader(
                itemCount: 1,
                height: kwidth * 0.6,
                width: kwidth * 0.8,
                scrollDirection: Axis.horizontal);
          }
          if (state.toDaysRminderList != null &&
              state.toDaysRminderList!.isNotEmpty) {
            return HomeScreenPagviewAnimateBuilder(
              pageController: pageController,
              pageValue: pageValue,
              pageCount: state.toDaysRminderList!.length,
              onpageCallBack: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              child: (index, _) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      context.read<ReminderBloc>().add(
                          ReminderEvent.getReminderDetails(
                              id: state.toDaysRminderList![index].id!));
                      showCardsNotifier.value = HomeScreensList.third;
                      widget.fadeCallBack();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: neonShade,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SecondScreenPageViewContents(
                          reminder: state.toDaysRminderList![index]),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: Image.asset(emptyNodata1));
          }
        },
      ),
    );
  }
}
