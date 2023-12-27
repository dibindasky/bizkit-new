import 'package:bizkit/core/const.dart';
import 'package:bizkit/fade_transition/fade_transition.dart';
import 'package:bizkit/feature/home/widgets/view_all_connection.dart';
import 'package:bizkit/initial_anime/second_anime.dart';
import 'package:flutter/material.dart';

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
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Column(
                                    children: [
                                      Text(
                                        'Hello',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        'Febin',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.mark_email_unread_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.settings,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'My Cards',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 120,
                                width: 200,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.green,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'My connections',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => Navigator.of(context).push(
                                      fadePageRoute(const ViewAllConnections()),
                                    ),
                                    child: const Text(
                                      'view all',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.white,
                                        decorationThickness: 1.5,
                                        color: Colors.white,
                                        fontSize: 18,
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
                                        color: Colors.grey,
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          Icons.add,
                                          size: 40,
                                          color: kwhite,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: 10,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            margin: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                            ),
                                            height: 40,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              image: const DecorationImage(
                                                image: NetworkImage(
                                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCp_ByMCZW8m0s3KmAbIENDvR2Zc_HkBJyYw&usqp=CAU",
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.amber,
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
                      ),
                      Expanded(
                        flex: 1,
                        child: SlideTransition(
                          position: _offsetAnimationBottom,
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
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: 15,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        elevation: 4,
                                        surfaceTintColor: Colors.transparent,
                                        margin: const EdgeInsets.only(
                                          bottom: 10,
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          height: 100,
                                          width: double.infinity,
                                          decoration: const BoxDecoration(
                                            color: Colors.black,
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 80,
                                                height: 80,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          'https://images.healthshots.com/healthshots/en/uploads/2020/12/08182549/positive-person.jpg'),
                                                      fit: BoxFit.cover),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft: Radius.circular(
                                                      12,
                                                    ),
                                                    bottomLeft:
                                                        Radius.circular(12),
                                                  ),
                                                  color: kblack,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        const Text(
                                                          'Project Discussion with \nReynolds',
                                                          maxLines: 2,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 50,
                                                        ),
                                                        IconButton(
                                                          onPressed: () {},
                                                          icon: const Icon(
                                                            Icons
                                                                .arrow_circle_right,
                                                            size: 30,
                                                            color:
                                                                Color.fromARGB(
                                                              255,
                                                              32,
                                                              233,
                                                              183,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
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
