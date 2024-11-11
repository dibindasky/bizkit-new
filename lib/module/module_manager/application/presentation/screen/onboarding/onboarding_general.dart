import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/module_manager/application/controller/on_boarding_controller.dart/on_boarding_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ScreenOnboardingGeneral extends StatefulWidget {
  const ScreenOnboardingGeneral({super.key});

  @override
  State<ScreenOnboardingGeneral> createState() =>
      _ScreenOnboardingGeneralState();
}

class _ScreenOnboardingGeneralState extends State<ScreenOnboardingGeneral> {
  final PageController pageController = PageController();
  final OnBoardingController onBoardingController =
      Get.put(OnBoardingController());

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void pageNext() async {
    if (onBoardingController.currentIndex < onBoardingData.length - 1) {
      pageController.nextPage(
          duration: const Duration(microseconds: 300), curve: Curves.easeIn);
    } else {
      await GoRouter.of(context).pushNamed(Routes.loginPage);
    }
  }

  @override
  void initState() {
    super.initState();
    // Reset the page to the first page
    WidgetsBinding.instance.addPostFrameCallback((_) {
      pageController.jumpToPage(0);
      onBoardingController.currentIndex.value = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 500,
                child: PageView.builder(
                    controller: pageController,
                    itemCount: onBoardingData.length,
                    onPageChanged: (index) {
                      onBoardingController.currentIndex.value = index;
                    },
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Obx(() => Image.asset(
                            onBoardingData[onBoardingController
                                .currentIndex.value]["image"]!,
                            height: 500)),
                      );
                    })),
            Obx(() => Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    onBoardingData[onBoardingController.currentIndex.value]
                        ["title"]!,
                    style: const TextStyle(
                      height: 1.3,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                )),
            const SizedBox(height: 16),
            Obx(() => Padding(
                  padding: const EdgeInsets.only(left: 20, right: 15),
                  child: Text(
                    onBoardingData[onBoardingController.currentIndex.value]
                        ["subtitle"]!,
                    style: const TextStyle(fontSize: 16,color: Colors.grey),
                    textAlign: TextAlign.start,
                    
                  ),
                )),
            
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => Row(
                        children: List.generate(
                            onBoardingData.length,
                            (index) => AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  width:
                                      onBoardingController.currentIndex.value ==
                                              index
                                          ? 30
                                          : 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: onBoardingController
                                                  .currentIndex.value ==
                                              index
                                          ? kneonShade
                                          : kblack),
                                )),
                      )),
                  InkWell(
                    onTap: () => pageNext(),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: kblack, shape: BoxShape.circle),
                      width: 40,
                      height: 40,
                      child: const Icon(
                        Icons.arrow_forward,
                        color: kneon,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
