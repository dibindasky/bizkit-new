import 'dart:convert';

import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/achevements/achievements_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/achevements/achivement_detail_screen.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/achievement.dart';
import 'package:bizkit/utils/appbar.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/date_bottom_sheet.dart';
import 'package:bizkit/utils/time.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenCardAchivements extends StatefulWidget {
  const ScreenCardAchivements({super.key, this.isPreview = true});

  final bool isPreview;

  @override
  State<ScreenCardAchivements> createState() => _ScreenCardAchivementsState();
}

class _ScreenCardAchivementsState extends State<ScreenCardAchivements> {
  final eventController = TextEditingController();
  final dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(kwidth, 70),
        child: const CardAppbarCommen(
          tittle: 'Achievements',
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: GetBuilder<CardController>(builder: (cardController) {
            final personalAchivements = cardController
                .bizcardDetail.value.personalDetails?.personalAchievements;
            final bussinessAchievemets = cardController
                .bizcardDetail.value.businessDetails?.businessAchievements;
            List<Achievement> achivement = widget.isPreview
                ? [...personalAchivements ?? [], ...bussinessAchievemets ?? []]
                : [...personalAchivements ?? [], ...bussinessAchievemets ?? []];

            if (dateController.text != '') {
              achivement = achivement
                  .where((element) =>
                      getDateByDayMonthYear(element.date ?? '') ==
                      dateController.text)
                  .toList();
            }
            if (eventController.text != 'All' &&
                eventController.text != 'Others' &&
                eventController.text != '') {
              achivement = achivement
                  .where((element) => element.event == eventController.text)
                  .toList();
            } else if (eventController.text == 'Others') {
              achivement = achivement
                  .where((element) => !achivementEvents.contains(element.event))
                  .toList();
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () => showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return DatePickingBottomSheet(
                                year: 500,
                                last: 500,
                                onPressed: (date) {
                                  dateController.text = date;
                                  setState(() {});
                                },
                                datePicker: dateController,
                              );
                            },
                          ),
                          child: Container(
                            padding: const EdgeInsets.only(left: 10, right: 12),
                            height: 50,
                            // width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: kgrey),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    dateController.text.isEmpty
                                        ? 'Date '
                                        : dateController.text,
                                    style: dateController.text.isEmpty
                                        ? const TextStyle(color: kwhite)
                                        : const TextStyle(color: kwhite),
                                  ),
                                ),
                                dateController.text != ''
                                    ? InkWell(
                                        onTap: () => setState(() {
                                          dateController.text = '';
                                        }),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: const ColoredBox(
                                                color: neonShade,
                                                child: Icon(
                                                  Icons.close,
                                                  color: kblack,
                                                ))),
                                      )
                                    : const Icon(
                                        Icons.calendar_month,
                                        color: neonShade,
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      adjustWidth(20),
                      Expanded(
                          child: Container(
                        padding: const EdgeInsets.only(left: 10, right: 12),
                        height: 50,
                        // width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: kgrey),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: CustomDropDown(
                            title: 'Event',
                            icon: Icons.sort,
                            items: const [
                              'All',
                              ...achivementEvents,
                              'Others',
                            ],
                            onTap: (value) {
                              eventController.text = value ?? '';
                              setState(() {});
                            }),
                      ))
                    ],
                  ),
                  kHeight20,
                  achivement.isEmpty
                      ? Center(child: Image.asset(emptyNodata2))
                      : ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) =>
                              adjustHieght(kwidth * .09),
                          itemCount: achivement.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      cardFadePageRoute(ScreenAchivementDetail(
                                          achievement: achivement[index])));
                                },
                                child: SizedBox(
                                  height: 250,
                                  width: double.infinity,
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                        height: 230,
                                        width: double.infinity,
                                        child: Image.memory(
                                          base64.decode(
                                              achivement[index].images != null
                                                  ? achivement[index]
                                                          .images![0]
                                                          .image!
                                                          .startsWith('data')
                                                      ? achivement[index]
                                                          .images![0]
                                                          .image!
                                                          .substring(22)
                                                      : achivement[index]
                                                          .images![0]
                                                          .image!
                                                  : personDemoImg),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        bottom: 0,
                                        child: Container(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          color: kblack.withOpacity(.5),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(achivement[index].title ??
                                                  ''),
                                              Text(
                                                achivement[index].description ??
                                                    '',
                                                style: textStyle1.copyWith(
                                                  fontSize: kwidth * .03,
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
                            );
                          },
                        ),
                ],
              ),
            );
          })),
    );
  }
}
