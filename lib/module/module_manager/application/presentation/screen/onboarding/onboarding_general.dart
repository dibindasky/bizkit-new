import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/module_manager/application/controller/auth_controller.dart';
import 'package:bizkit/module/module_manager/application/controller/on_boarding_controller.dart/on_boarding_controller.dart';
import 'package:bizkit/service/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      SecureStorage.setOnBoardBool();
      Get.find<AuthenticationController>().checkLoginStatus(context);
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
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Image.asset(
                      onBoardingData[index]["image"]!,
                      height: 500,
                    ),
                  );
                },
              ),
            ),
            // Title with fade animation
            Obx(() => Stack(
                  alignment: Alignment.centerLeft,
                  children: List.generate(onBoardingData.length, (index) {
                    double opacity =
                        (onBoardingController.currentIndex.value == index)
                            ? 1.0
                            : 0.0;
                    return AnimatedOpacity(
                      opacity: opacity,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          onBoardingData[index]["title"]!,
                          style: Theme.of(context).textTheme.headlineLarge,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    );
                  }),
                )),
            const SizedBox(height: 16),
            // Subtitle with fade animation
            Obx(() => Stack(
                  alignment: Alignment.centerLeft,
                  children: List.generate(onBoardingData.length, (index) {
                    final isActive =
                        onBoardingController.currentIndex.value == index;
                    return AnimatedOpacity(
                      opacity: isActive ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          onBoardingData[index]["subtitle"]!,
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    );
                  }),
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
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            width:
                                onBoardingController.currentIndex.value == index
                                    ? 30
                                    : 10,
                            height: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: onBoardingController.currentIndex.value ==
                                      index
                                  ? kneonShade
                                  : kblack,
                            ),
                          ),
                        ),
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
