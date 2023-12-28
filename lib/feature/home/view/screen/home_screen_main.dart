import 'package:bizkit/core/const.dart';
import 'package:bizkit/fade_transition/fade_transition.dart';
import 'package:bizkit/feature/business_card_preview/view/screen/preview_main_screen.dart';
import 'package:bizkit/feature/create_business_card.dart/view/screens/create_business_card.dart';
import 'package:bizkit/feature/home/view/screen/second_screen_anime.dart';
import 'package:bizkit/feature/home/view/widgets/view_all_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplitScreen extends StatefulWidget {
  const SplitScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplitScreenState createState() => _SplitScreenState();
}

class _SplitScreenState extends State<SplitScreen>
    with TickerProviderStateMixin {
  bool showScreens = false;
  late AnimationController _controllerTop;
  late Animation<Offset> _offsetAnimationTop;
  late AnimationController _controllerBottom;
  late Animation<Offset> _offsetAnimationBottom;

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
      showScreens = false;
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
    return GestureDetector(
      onTapUp: (details) async {
        await _reverseAnimation();
        // ignore: use_build_context_synchronously
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const SecondAnimation(),
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
              child: ClipRect(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 400,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Hello',
                                      style: TextStyle(
                                        color: kwhite,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      'Febin',
                                      style: TextStyle(
                                        color: kwhite,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                const CircleAvatar(
                                  radius: 17,
                                  backgroundColor: textFieldFillColr,
                                  backgroundImage: AssetImage(
                                    'asset/images/bizkitIcon.png',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  'My Cards',
                                  style: TextStyle(
                                    color: kwhite,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            adjustHieght(khieght * .02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 130,
                                  width: 240,
                                  child: ListView.separated(
                                    separatorBuilder: (context, index) =>
                                        adjustWidth(
                                      kwidth * .03,
                                    ),
                                    itemCount: 10,
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) =>
                                        GestureDetector(
                                      onTap: () => Navigator.of(context).push(
                                          fadePageRoute(
                                              const PreviewMainScreen())),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        height: 130,
                                        width: 220,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 1,
                                            color: kgreen,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  'Febin baby',
                                                  style: TextStyle(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Text(
                                                  'Mobile app developer',
                                                  style: TextStyle(
                                                      fontSize: 14.sp),
                                                ),
                                                Image.asset(
                                                    'asset/images/home logo 1.png'),
                                              ],
                                            ),
                                            const Icon(
                                              Icons.arrow_right,
                                              color: kwhite,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                adjustWidth(kwidth * .07),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => Navigator.of(context).push(
                                      fadePageRoute(
                                          const StartingBusinessCardCreation()),
                                    ),
                                    child: Container(
                                      height: 130,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: textFieldFillColr,
                                      ),
                                      width: 140,
                                      child: const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: AssetImage(
                                              'asset/images/home add circl.png',
                                            ),
                                          ),
                                          Text('Add Card'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            adjustHieght(khieght * .02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'My connections',
                                  style: TextStyle(
                                    color: kwhite,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.of(context).push(
                                    fadePageRoute(const ViewAllConnections()),
                                  ),
                                  child: Text(
                                    'view all',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationColor: kwhite,
                                      decorationThickness: 1.5,
                                      color: kwhite,
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              height: 60,
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    height: 60,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: textFieldFillColr),
                                    child: const Center(
                                      child: Icon(
                                        Icons.add,
                                        size: 20,
                                        color: kwhite,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListView.separated(
                                      separatorBuilder: (context, index) =>
                                          adjustWidth(kwidth * .02),
                                      itemCount: 5,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        List image = [
                                          'https://images.healthshots.com/healthshots/en/uploads/2020/12/08182549/positive-person.jpg',
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRE4g-3ZH_1TjfN-zOuCRru2LrfrGtPbwaCsQ&usqp=CAU',
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2fU6VWMdDDAYhNv6NQiHuGeXP3KKtPwVHew&usqp=CAU',
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoKJPxxwPeNvISnBbZsZHe887Ws0FnrL7o0w&usqp=CAU',
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQm3gg3rbRr7rpvpYvr5viM9Bi1L3LglCYQ7w&usqp=CAU',
                                        ];
                                        return Container(
                                          height: 40,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(image[index]),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          color: Colors.transparent,
                          child: Column(
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Reminders',
                                    style: TextStyle(
                                      color: kwhite,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              adjustHieght(khieght * .02),
                              Expanded(
                                child: ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      adjustHieght(khieght * .02),
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
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(12),
                                                bottomLeft: Radius.circular(12),
                                              ),
                                              color: kblack,
                                            ),
                                          ),
                                          adjustWidth(kwidth * .03),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
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
