import 'package:bizkit/module/module_manager/application/controller/matcho_meter/matcho_meter_screen_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class MachoMeterScreen extends StatefulWidget {
  const MachoMeterScreen({super.key});

  @override
  State<MachoMeterScreen> createState() => _MachoMeterScreenState();
}

class _MachoMeterScreenState extends State<MachoMeterScreen> {
  PageController pageController = PageController();

  final machoMeterScreenController = Get.put(MatchoMeterScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                InkWell(
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.onSecondary,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Icon(Icons.arrow_back_ios,
                          color: Theme.of(context).colorScheme.onTertiary),
                    ),
                  ),
                  onTap: () => GoRouter.of(context).pop(),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: Obx(() => Row(
                            children: List.generate(
                                machoMeterScreenController.items.length,
                                (index) {
                          return AnimatedContainer(
                            duration: const Duration(microseconds: 300),
                            width: 20,
                            height: 6,
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: index ==
                                        machoMeterScreenController
                                            .currentIndex.value
                                    ? kneonShade
                                    : Colors.teal[100]),
                          );
                        }))))
              ],
            ),
          ),
          kHeight10,
          Expanded(
            child: PageView.builder(
                onPageChanged: (index) {
                  machoMeterScreenController.currentIndex.value = index;
                },
                controller: pageController,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Machometer',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontSize: 30),
                          ),
                        ),
                        kHeight10,
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          width: double.infinity,
                          height: 250,
                          child: const Image(
                            image: AssetImage(bizcardBgImage),
                            fit: BoxFit.fill,
                          ),
                        ),
                        kHeight20,
                        Container(
                          decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius: BorderRadius.circular(10)),
                          width: double.infinity,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Obx(() => DropdownButton(
                                underline: kempty,
                                items: machoMeterScreenController.items
                                    .map((toElement) {
                                  return DropdownMenuItem(
                                      value: toElement,
                                      child: Text(toElement,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                  fontWeight:
                                                      FontWeight.w400)));
                                }).toList(),
                                icon: const Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Icon(Icons.arrow_drop_down,
                                      color: Colors.grey),
                                ),
                                isExpanded: true,
                                value: machoMeterScreenController
                                    .selectedOne.value,
                                onChanged: (newValue) {
                                  machoMeterScreenController.selectedOne.value =
                                      newValue!;
                                })),
                          ),
                        ),
                        kHeight10,
                        Container(
                          decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius: BorderRadius.circular(10)),
                          width: double.infinity,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Obx(() => DropdownButton(
                                underline: kempty,
                                items: machoMeterScreenController.items
                                    .map((toElement) {
                                  return DropdownMenuItem(
                                      value: toElement,
                                      child: Text(toElement,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                  fontWeight:
                                                      FontWeight.w400)));
                                }).toList(),
                                icon: const Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Icon(Icons.arrow_drop_down,
                                      color: Colors.grey),
                                ),
                                isExpanded: true,
                                value: machoMeterScreenController
                                    .selectedTwo.value,
                                onChanged: (newValue) {
                                  machoMeterScreenController.selectedTwo.value =
                                      newValue!;
                                })),
                          ),
                        ),
                        kHeight10,
                        Container(
                          decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius: BorderRadius.circular(10)),
                          width: double.infinity,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Obx(() => DropdownButton(
                                underline: kempty,
                                items: machoMeterScreenController.items
                                    .map((toElement) {
                                  return DropdownMenuItem(
                                      value: toElement,
                                      child: Text(toElement,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                  fontWeight:
                                                      FontWeight.w400)));
                                }).toList(),
                                icon: const Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Icon(Icons.arrow_drop_down,
                                      color: Colors.grey),
                                ),
                                isExpanded: true,
                                value: machoMeterScreenController
                                    .selectedThree.value,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    machoMeterScreenController
                                        .selectedThree.value = newValue!;
                                  });
                                })),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          )
        ]),
      ),
    );
  }
}
