import 'package:bizkit/core/const.dart';
import 'package:bizkit/fade_transition/fade_transition.dart';
import 'package:bizkit/feature/home/view/home_second_screen/widgets/pageview_detail_screen.dart';
import 'package:bizkit/feature/home/view/home_second_screen/widgets/pageview_offset_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenPageviewAnimatedContaner extends StatefulWidget {
  const HomeScreenPageviewAnimatedContaner({super.key});

  @override
  State<HomeScreenPageviewAnimatedContaner> createState() =>
      _HomeScreenPageviewAnimatedContanerState();
}

class _HomeScreenPageviewAnimatedContanerState
    extends State<HomeScreenPageviewAnimatedContaner> {
  List<String> image = [
    'asset/images/previewiamge1.jpeg',
    'asset/images/previewImage2.jpeg',
    'asset/images/previewImage3.jpeg',
    'asset/images/previewImage4.jpeg',
    'asset/images/previewimage5.jpeg',
  ];
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
    return SizedBox(height: kwidth *0.6,
      child: HomeScreenPagviewAnimatedWidget(
        pageController: pageController,
        pageValue: pageValue,
        pageCount: image.length,
        onpageCallBack: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        child: (index, _) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => Navigator.of(context).push(
                fadePageRoute(const SecondHomeScreenPAgeviewMeetingScreen()),
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: neonShade,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const SizedBox(width: 30),
                        const CircleAvatar(
                          radius: 32,
                          backgroundColor: neonShade,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              'https://images.healthshots.com/healthshots/en/uploads/2020/12/08182549/positive-person.jpg',
                            ),
                            radius: 30,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          'Meeting With \nMarcopolo',
                          style: TextStyle(
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: kwidth * 0.8,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Venue :',
                                  style: TextStyle(fontSize: 9.sp),
                                ),
                                const Spacer(),
                                Text(
                                  'Central Mall, Jayanagar',
                                  style: TextStyle(
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Created :',
                                  style: TextStyle(fontSize: 9.sp),
                                ),
                                const Spacer(),
                                Text(
                                  '2nd October, 11:45 AM',
                                  style: TextStyle(
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Occasion :',
                                  style: TextStyle(fontSize: 9.sp),
                                ),
                                const Spacer(),
                                Text(
                                  'International Film Festival',
                                  style: TextStyle(
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: kwidth * 0.05),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: kwidth * 0.1,
                            decoration: const BoxDecoration(
                              color: neonShade,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(7)),
                            ),
                            child: const Center(
                              child: Text('Connect'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: kwidth * 0.1,
                            decoration: BoxDecoration(
                              border: Border.all(color: neonShade),
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(7),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'Postpone',
                                style: TextStyle(color: neonShade),
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
        },
      ),
    );
  }
}
