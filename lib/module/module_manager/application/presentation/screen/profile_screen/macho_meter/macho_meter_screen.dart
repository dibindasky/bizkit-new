import 'package:bizkit/module/module_manager/application/controller/matcho_meter/matcho_meter_screen_controller.dart';
import 'package:bizkit/utils/animations/expansion_tile.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/cupertino.dart';
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
  void initState() {
    machoMeterScreenController.getAdminsMachoMeter();
    super.initState();
  }

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
                                machoMeterScreenController.matchoMeter.length,
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
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: kwhite,
                                borderRadius: BorderRadius.circular(10)),
                            width: double.infinity,
                            // height: 200,
                            child: Padding(
                                padding: 
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Obx(() => ListView.builder(
                                    itemCount: machoMeterScreenController
                                        .matchoMeter.length,
                                    itemBuilder: (context, indexs) {
                                      return CustomExpansionTileWidget(
                                          isExpandable: true,
                                          child: Container(
                                            child: Text(
                                              machoMeterScreenController
                                                      .matchoMeter[indexs]
                                                      .question ??
                                                  '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium,
                                            ),
                                          ),
                                          children: [
                                            Container(
                                            
                                              child: Wrap(
                                                children:
                                                    machoMeterScreenController
                                                            .matchoMeter[indexs]
                                                            .answers
                                                            ?.map((answer) {
                                                          return Container(
                                                            child: Text(
                                                              answer,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .titleMedium,
                                                            ),
                                                          );
                                                        }).toList() ??
                                                        [],
                                              ),
                                            ),
                                            //                     Padding(
                                            //   padding: const EdgeInsets.all(8.0),
                                            //   child: CupertinoTextField(
                                            //     placeholder: 'Add your tags',
                                            //     placeholderStyle: Theme.of(context).textTheme.displaySmall,
                                            //     suffix: GestureDetector(
                                            //       onTap: () {
                                            //         if (machoMeterScreenController.tagsForEdit) {
                                            //           final tag =machoMeterScreenController.tagController.text.trim();
                          
                                            //           if (tag.isNotEmpty &&
                                            //               !controller.tagsForEdit.contains(tag)) {
                                            //             controller.tagsForEdit.add(tag);
                                            //             // FocusScope.of(context).unfocus();
                                            //             log('Tags For Edit =====> ${controller.tagsForEdit}');
                                            //           }
                                            //           tagController.clear();
                                            //         } else {
                                            //           final tag = tagController.text.trim();
                          
                                            //           if (tag.isNotEmpty &&
                                            //               !controller.tags.contains(tag)) {
                                            //             controller.tags.add(tag);
                                            //             // FocusScope.of(context).unfocus();
                                            //             log('Tags =====> ${controller.tags}');
                                            //           }
                                            //           tagController.clear();
                                            //         }
                                            //       },
                                            //       child: const Padding(
                                            //         padding: EdgeInsets.only(right: 10.0),
                                            //         child: Icon(Icons.add, color: kneon),
                                            //       ),
                                            //     ),
                                            //     controller: tagController,
                                            //     style: Theme.of(context).textTheme.displaySmall,
                                            //     padding: const EdgeInsets.all(10.0),
                                            //     decoration: BoxDecoration(
                                            //       borderRadius: BorderRadius.circular(8.0),
                                            //       border: Border.all(
                                            //         color: kneon,
                                            //         width: 1.0,
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),
                                          ]
                                          //  machoMeterScreenController
                                          //         .matchoMeter[index].answers
                                          //         ?.map((answer) {
                                          //       return ListTile(
                                          //         title: Text(answer),
                                          //       );
                                          //     }).toList() ??
                                          //     [],
                                          );
                                    }))),
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
