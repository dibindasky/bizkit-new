import 'package:bizkit/core/const.dart';
import 'package:bizkit/fade_transition/fade_transition.dart';
import 'package:bizkit/feature/business_card_preview/view/widgets/bank_person_achived.dart';
import 'package:bizkit/feature/business_card_preview/view/widgets/show_model_items.dart';
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

  List names = [
    'Archived',
    'Reminders',
    'Upcoming',
  ];
  int selectedIndex = 0;

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
                                  textChange(index: 0),
                                  textChange(index: 1),
                                  textChange(index: 2),
                                ],
                              ),
                              adjustHieght(khieght * .02),
                              Expanded(
                                child: Builder(
                                  builder: (BuildContext context) {
                                    if (selectedIndex == 0) {
                                      return const ArchiedTilesHomeScreen();
                                    } else if (selectedIndex == 1) {
                                      return const RemindersTilesHomeScreen();
                                    } else if (selectedIndex == 2) {
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

  Widget textChange({required int index}) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: () {
        setState(() {
          String temp = names[index];
          names[index] = names[1];
          names[1] = temp;
          selectedIndex = index;
        });
      },
      child: Text(names[index]),
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
          child: GestureDetector(
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

class SecondHomeScreenPAgeviewMeetingScreen extends StatelessWidget {
  const SecondHomeScreenPAgeviewMeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        //   icon: const Icon(
        //     Icons.arrow_back_ios,
        //     color: kwhite,
        //     size: 20,
        //   ),
        // ),
        backgroundColor: Colors.transparent,
        title: Text(
          'Todays \nReminders',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: kwhite,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: kwhite,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.list_rounded,
              color: kwhite,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            adjustHieght(khieght * .03),
            Stack(
              children: [
                Positioned(
                  right: 2,
                  top: 2,
                  child: InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: const CircleAvatar(
                      radius: 15,
                      backgroundImage:
                          AssetImage('asset/images/close icon home.png'),
                      child: Icon(
                        Icons.close,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: khieght * .8,
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
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: SizedBox(
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
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(7),
                                          topLeft: Radius.circular(7),
                                        ),
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
                                          topRight: Radius.circular(7),
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
                      adjustHieght(khieght * .02),
                      const Expanded(child: TabBarHomeScreen())
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TabBarHomeScreen extends StatelessWidget {
  const TabBarHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 60,
              decoration: const BoxDecoration(),
              child: TabBar(
                dividerHeight: 0,
                isScrollable: true,
                labelPadding: const EdgeInsets.symmetric(horizontal: 30),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromRGBO(6, 199, 172, 1),
                      Color.fromRGBO(6, 199, 172, 1),
                      Color.fromRGBO(6, 199, 172, .34),
                    ],
                  ),
                ),
                tabs: const [
                  SizedBox(
                    width: 120,
                    child: Tab(
                      child: Text(
                        "History/Log",
                        style: TextStyle(color: kwhite),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Tab(
                      child: Text(
                        "Profile",
                        style: TextStyle(color: kwhite),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      child: ListView(
                        children: [
                          historyLog(
                            'asset/images/meeting profile png1.png',
                            '16-10-23 | 11:40 AM',
                            'Scheduled on 16-10-23 to discuss about features and pipeline details of project at office location.',
                          ),
                          historyLog(
                            'asset/images/meeting profile png2.png',
                            '16-10-23 | 11:40 AM',
                            'Scheduled on 16-10-23 to discuss about features and pipeline details of project at office location.',
                          ),
                          historyLog(
                            'asset/images/meeting profile png3.png',
                            '16-10-23 | 11:40 AM',
                            'Scheduled on 16-10-23 to discuss about features and pipeline details of project at office location.',
                          ),
                          historyLog(
                            'asset/images/meeting profile png4.png',
                            '16-10-23 | 11:40 AM',
                            'Scheduled on 16-10-23 to discuss about features and pipeline details of project at office location.',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListView(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () => bottomSheet(context),
                                child: Container(
                                  height: 40,
                                  decoration: const BoxDecoration(
                                      color: textFieldFillColr),
                                  child: Image.asset(
                                      'asset/images/preview phone.png'),
                                ),
                              ),
                              rowItems(
                                  asset:
                                      'asset/images/preview messages gif.gif'),
                              rowItems(asset: 'asset/images/preview globe.gif'),
                              rowItems(
                                  asset: 'asset/images/preview_spinner.png'),
                              rowItems(
                                  asset:
                                      'asset/images/preview location gif.gif'),
                            ],
                          ),
                          adjustHieght(khieght * .01),
                          const BankPersonAchivedRows(
                            first: 'asset/images/banking.png',
                            scnd: 'asset/images/persona.png',
                            third: 'asset/images/achieved.png',
                          ),
                          adjustHieght(khieght * .02),
                          Container(
                            decoration: const BoxDecoration(
                              color: textFieldFillColr,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            width: double.infinity,
                            height: 140,
                            child: Column(
                              children: [
                                adjustHieght(khieght * .01),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('Products / Brands'),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          color: neonShade,
                                        ),
                                        child: const Icon(
                                            Icons.arrow_right_outlined),
                                      ),
                                    ],
                                  ),
                                ),
                                adjustHieght(khieght * .01),
                                SizedBox(
                                  width: double.infinity,
                                  height: 80,
                                  child: ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      List listImages = [
                                        'asset/images/preview image 0.png',
                                        'asset/images/preview list image 2.png',
                                        'asset/images/preview list image 3.png',
                                        'asset/images/previewlist image 1.png',
                                        'asset/images/preview list image 3.png',
                                        'asset/images/preview list image 2.png',
                                      ];
                                      return SizedBox(
                                        width: 75.dm,
                                        height: 80.dm,
                                        child: Image.asset(
                                          listImages[index],
                                        ),
                                      );
                                    },
                                    itemCount: 6,
                                  ),
                                ),
                              ],
                            ),
                          ),
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

  Widget rowItems({required String asset}) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
        color: Color.fromRGBO(53, 53, 53, 0.42),
      ),
      height: 40,
      child: Image.asset(asset),
    );
  }

  void bottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const ModelSheetItems(),
    );
  }

  Widget historyLog(String image, String date, String detail) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(image),
              adjustWidth(kwidth * .004),
              Text(
                date,
                style: TextStyle(fontSize: 11.sp),
              ),
            ],
          ),
          adjustHieght(khieght * .006),
          Text(
            detail,
            style: TextStyle(fontSize: 11.sp),
          ),
        ],
      ),
    );
  }
}