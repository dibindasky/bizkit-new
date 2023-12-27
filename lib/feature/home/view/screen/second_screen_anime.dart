import 'package:bizkit/core/const.dart';
import 'package:bizkit/feature/home/view/screen/home_screen_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondAnimation extends StatefulWidget {
  const SecondAnimation({super.key});

  @override
  State<SecondAnimation> createState() => _SecondAnimationState();
}

class _SecondAnimationState extends State<SecondAnimation>
    with TickerProviderStateMixin {
  bool showScreens = false;
  late AnimationController _controllerTop;
  late Animation<Offset> _offsetAnimationTop;
  late AnimationController _controllerBottom;
  late Animation<Offset> _offsetAnimationBottom;
  int selectedChoiceIndex = 0;

  @override
  void initState() {
    super.initState();

    _controllerTop = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _offsetAnimationTop = Tween<Offset>(
      begin: const Offset(0.0, -2.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controllerTop,
        curve: Curves.easeInOut,
      ),
    );

    _controllerTop.forward();

    _controllerBottom = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _offsetAnimationBottom = Tween<Offset>(
      begin: const Offset(0.0, 2.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controllerBottom,
        curve: Curves.easeInOut,
      ),
    );

    // Delay the showing of split screens by a second after the top animation completes
    Future.delayed(const Duration(milliseconds: 50), () {
      _controllerBottom.forward();
      setState(() {
        showScreens = true;
      });
    });
  }

  Future<void> _reverseAnimation() async {
    setState(() {
      showScreens = true;
    });

    await _controllerBottom.reverse();
    await _controllerTop.reverse();
  }

  @override
  void dispose() {
    _controllerTop.dispose();
    _controllerBottom.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await _reverseAnimation();
        return true;
      },
      child: GestureDetector(
        onTapUp: (details) async {
          await _reverseAnimation();
          // ignore: use_build_context_synchronously
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const SplitScreen(),
          ));
        },
        child: Scaffold(
          body: AnimatedContainer(
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
            transform: showScreens
                ? Matrix4.translationValues(0.0, 0.0, 0.0)
                : Matrix4.translationValues(
                    0.0,
                    -MediaQuery.of(context).size.height / 2,
                    0.0,
                  ),
            child: SlideTransition(
              position: _offsetAnimationTop,
              child: SafeArea(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      adjustHieght(khieght * .04),
                      const Column(
                        children: [
                          SizedBox(
                            height: 230.5,
                            child: HomeScreenPageviewAnimatedContaner(),
                          ),
                        ],
                      ),
                      adjustHieght(khieght * .04),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomButton(
                                    label: 'Archived',
                                    onPressed: () {
                                      setState(() {
                                        selectedChoiceIndex = 0;
                                      });
                                    },
                                    isSelected: selectedChoiceIndex == 0,
                                  ),
                                  CustomButton(
                                    label: 'Reminders',
                                    onPressed: () {
                                      setState(() {
                                        selectedChoiceIndex = 1;
                                      });
                                    },
                                    isSelected: selectedChoiceIndex == 1,
                                  ),
                                  CustomButton(
                                    label: 'Upcoming',
                                    onPressed: () {
                                      setState(() {
                                        selectedChoiceIndex = 2;
                                      });
                                    },
                                    isSelected: selectedChoiceIndex == 2,
                                  ),
                                ],
                              ),
                              adjustHieght(khieght * .02),
                              Expanded(
                                child: Builder(
                                  builder: (BuildContext context) {
                                    if (selectedChoiceIndex == 0) {
                                      return const ArchiedTilesHomeScreen();
                                    } else if (selectedChoiceIndex == 1) {
                                      return const RemindersTilesHomeScreen();
                                    } else if (selectedChoiceIndex == 2) {
                                      return const ArchiedTilesHomeScreen();
                                    } else {
                                      return const SizedBox();
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RemindersTilesHomeScreen extends StatelessWidget {
  const RemindersTilesHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => adjustHieght(khieght * .02),
      itemCount: 5,
      itemBuilder: (context, index) {
        List names = [
          'Febin',
          'Dibin',
          'Joshua',
          'Anagh',
          'Santhosh',
        ];
        List image = [
          'https://images.healthshots.com/healthshots/en/uploads/2020/12/08182549/positive-person.jpg',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRE4g-3ZH_1TjfN-zOuCRru2LrfrGtPbwaCsQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2fU6VWMdDDAYhNv6NQiHuGeXP3KKtPwVHew&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoKJPxxwPeNvISnBbZsZHe887Ws0FnrL7o0w&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQm3gg3rbRr7rpvpYvr5viM9Bi1L3LglCYQ7w&usqp=CAU',
        ];
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          height: 100,
          child: Row(
            children: [
              Container(
                width: 95,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      image[index],
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  color: kblack,
                ),
              ),
              adjustWidth(kwidth * .03),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Project Discussion with \n${names[index]}',
                    style: const TextStyle(
                      color: kwhite,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      const Text('11 Nov'),
                      adjustWidth(kwidth * .02),
                      const Text('11:45 AM'),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              const CircleAvatar(
                radius: 15,
                backgroundColor: neonShade,
                child: Icon(
                  Icons.keyboard_arrow_right,
                  size: 25,
                  color: kblack,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ArchiedTilesHomeScreen extends StatelessWidget {
  const ArchiedTilesHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => adjustHieght(khieght * .02),
      itemCount: 5,
      itemBuilder: (context, index) {
        List names = [
          'Joshua',
          'Anagh',
          'Santhosh',
          'Febin',
          'Dibin',
        ];
        List image = [
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoKJPxxwPeNvISnBbZsZHe887Ws0FnrL7o0w&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQm3gg3rbRr7rpvpYvr5viM9Bi1L3LglCYQ7w&usqp=CAU',
          'https://images.healthshots.com/healthshots/en/uploads/2020/12/08182549/positive-person.jpg',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRE4g-3ZH_1TjfN-zOuCRru2LrfrGtPbwaCsQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2fU6VWMdDDAYhNv6NQiHuGeXP3KKtPwVHew&usqp=CAU',
        ];
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          height: 100,
          child: Row(
            children: [
              Container(
                width: 95,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      image[index],
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  color: kblack,
                ),
              ),
              adjustWidth(kwidth * .03),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Project Discussion with \n${names[index]}',
                    style: const TextStyle(
                      color: kwhite,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      const Text('11 Nov'),
                      adjustWidth(kwidth * .02),
                      const Text('11:45 AM'),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              const CircleAvatar(
                radius: 15,
                backgroundColor: neonShade,
                child: Icon(
                  Icons.keyboard_arrow_right,
                  size: 25,
                  color: kblack,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isSelected;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? kwhite : klightgrey,
        ),
      ),
    );
  }
}

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
    return HomeScreenPagviewAnimatedWidget(
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
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: neonShade,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                adjustHieght(khieght * .02),
                Row(
                  children: [
                    adjustWidth(kwidth * .03),
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
                    adjustWidth(kwidth * .02),
                    Text(
                      'Meeting With \nMarcopolo',
                      style: TextStyle(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                adjustHieght(khieght * .03),
                SizedBox(
                  width: 280,
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
                adjustHieght(khieght * .03),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 42,
                        decoration: const BoxDecoration(
                          color: neonShade,
                          borderRadius:
                              BorderRadius.only(bottomLeft: Radius.circular(7)),
                        ),
                        child: const Center(
                          child: Text('Connect'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 42,
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
        );
      },
    );
  }
}

typedef ChildBuilder = Widget Function(int index, BuildContext context);
typedef OnPageCallBack = void Function(int index);

class HomeScreenPagviewAnimatedWidget extends StatelessWidget {
  const HomeScreenPagviewAnimatedWidget({
    Key? key,
    required this.pageController,
    required this.pageValue,
    required this.child,
    required this.pageCount,
    required this.onpageCallBack,
  }) : super(key: key);
  final PageController pageController;
  final double pageValue;
  final ChildBuilder child;
  final int pageCount;
  final OnPageCallBack onpageCallBack;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: onpageCallBack,
      controller: pageController,
      itemCount: pageCount,
      itemBuilder: (context, index) {
        double translation = 50.0;

        if (index == pageValue.floor() + 1 || index == pageValue.floor() + 2) {
          return Transform.translate(
            offset: Offset(
              0.0,
              translation *
                  (index - pageValue), // Linear translation for next pages
            ),
            child: child(index, context),
          );
        } else if (index == pageValue.floor() ||
            index == pageValue.floor() - 1) {
          return Transform.translate(
            offset: Offset(
              0,
              translation * (pageValue - index),
            ),
            child: child(index, context),
          );
        } else {
          return child(index, context);
        }
      },
    );
  }
}
