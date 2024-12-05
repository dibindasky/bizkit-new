import 'dart:developer';
import 'package:bizkit/module/module_manager/application/controller/matcho_meter/matcho_meter_screen_controller.dart';
import 'package:bizkit/utils/animations/expansion_tile.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
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
    machoMeterScreenController.getMatchoMeters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  InkWell(
                    child: CircleAvatar(
                      backgroundColor:
                          Theme.of(context).colorScheme.onSecondary,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(Icons.arrow_back_ios,
                            color: Theme.of(context).colorScheme.onTertiary),
                      ),
                    ),
                    onTap: () => GoRouter.of(context).pop(),
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Machometer',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontSize: 30),
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
                        Obx(() {
                          return machoMeterScreenController.isloadingDatas.value
                              ? ShimmerLoader(
                                  seprator: kHeight10,
                                  itemCount: machoMeterScreenController
                                      .matchoMeter.length,
                                  height: 35,
                                  width: double.infinity,
                                )
                              : ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  separatorBuilder: (context, index) {
                                    return const Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                      ),
                                      child: Divider(
                                        color: kGreyNormal,
                                      ),
                                    );
                                  },
                                  itemCount: machoMeterScreenController
                                      .matchoMeter.length,
                                  itemBuilder: (context, indexs) {
                                    final userMachoMeterData =
                                        machoMeterScreenController
                                            .matchoMeter[indexs];
                                    final TextEditingController tagController =
                                        TextEditingController();
                                    return Obx(() {
                                      return CustomExpansionTileWidget(
                                          borderColor: kblack,
                                          isExpandable: true,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: SizedBox(
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
                                          ),
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Wrap(
                                                  spacing: 18.0,
                                                  runSpacing: 4.0,
                                                  children:
                                                      machoMeterScreenController
                                                              .matchoMeter[
                                                                  indexs]
                                                              .userAnswer
                                                              ?.map(
                                                                  (userAnswer) {
                                                            return Chip(
                                                              side: BorderSide
                                                                  .none,
                                                              onDeleted: () {
                                                                machoMeterScreenController
                                                                    .deleteFromUserAnswers(
                                                                        userAnswer,
                                                                        indexs);
                                                              },
                                                              label: Text(
                                                                userAnswer,
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .titleSmall,
                                                              ),
                                                            );
                                                          }).toList() ??
                                                          [],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: CupertinoTextField(
                                                textCapitalization:
                                                    TextCapitalization.words,
                                                placeholder: 'Add your answer',
                                                placeholderStyle:
                                                    Theme.of(context)
                                                        .textTheme
                                                        .displaySmall,
                                                suffix: GestureDetector(
                                                  onTap: () {
                                                    final tag = tagController
                                                        .text
                                                        .trim();

                                                    if (tag.isNotEmpty &&
                                                        !(machoMeterScreenController
                                                                    .matchoMeter[
                                                                        indexs]
                                                                    .userAnswer ??
                                                                [])
                                                            .contains(tag)) {
                                                      var userAnswersList =
                                                          machoMeterScreenController
                                                                  .matchoMeter[
                                                                      indexs]
                                                                  .userAnswer ??
                                                              [];
                                                      userAnswersList.add(tag);
                                                      machoMeterScreenController
                                                                  .matchoMeter[
                                                              indexs] =
                                                          machoMeterScreenController
                                                              .matchoMeter[
                                                                  indexs]
                                                              .copyWith(
                                                                  userAnswer:
                                                                      userAnswersList,
                                                                  showButton:
                                                                      true);
                                                      // FocusScope.of(context).unfocus();
                                                      log('Tags =====> ${machoMeterScreenController.matchoMeter[indexs].userAnswer}');
                                                    }
                                                    tagController.clear();
                                                  },
                                                  child: const Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 10.0),
                                                    child: Icon(Icons.add,
                                                        color: kneon),
                                                  ),
                                                ),
                                                controller: tagController,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displaySmall,
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: kneon,
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Wrap(
                                                  spacing: 18.0,
                                                  runSpacing: 4.0,
                                                  children: machoMeterScreenController
                                                          .matchoMeter[indexs]
                                                          .answers
                                                          ?.where((test) =>
                                                              !(machoMeterScreenController
                                                                          .matchoMeter[
                                                                              indexs]
                                                                          .userAnswer ??
                                                                      [])
                                                                  .contains(
                                                                      test))
                                                          .map((answer) {
                                                        return InkWell(
                                                          onTap: () {
                                                            machoMeterScreenController
                                                                .addToUserAnswers(
                                                                    answer,
                                                                    indexs);
                                                          },
                                                          child: Chip(
                                                            side:
                                                                BorderSide.none,
                                                            label: Text(
                                                              answer,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .titleSmall,
                                                            ),
                                                          ),
                                                        );
                                                      }).toList() ??
                                                      [],
                                                ),
                                              ),
                                            ),
                                            if (userMachoMeterData.id == null &&
                                                (userMachoMeterData
                                                        .userAnswer?.isEmpty ??
                                                    true))
                                              kempty
                                            else if (userMachoMeterData
                                                .showButton)
                                              Obx(() {
                                                return machoMeterScreenController
                                                        .loadingList
                                                        .contains(indexs)
                                                    ? const Center(
                                                        child:
                                                            CircularProgressIndicator())
                                                    : EventButton(
                                                        showGradiant: false,
                                                        text: userMachoMeterData
                                                                    .id ==
                                                                null
                                                            ? 'add'
                                                            : 'Update',
                                                        onTap: () {
                                                          userMachoMeterData
                                                                      .id ==
                                                                  null
                                                              ? machoMeterScreenController
                                                                  .addMatchoMeter(
                                                                      indexs)
                                                              : machoMeterScreenController
                                                                  .editMatchoMeter(
                                                                      indexs);
                                                        },
                                                      );
                                              }),
                                          ]);
                                    });
                                  });
                        }),
                        kHeight20,
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
