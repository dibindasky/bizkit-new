import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/achievement.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/bottom_sheets/date_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class BizCardDeatailAchivements extends StatefulWidget {
  const BizCardDeatailAchivements({super.key});

  @override
  State<BizCardDeatailAchivements> createState() =>
      _BizCardDeatailAchivementsState();
}

class _BizCardDeatailAchivementsState extends State<BizCardDeatailAchivements> {
  final eventController = TextEditingController();
  final dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            kHeight10,
            Row(
              children: [
                kWidth20,
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 15.sp,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                ),
                kWidth10,
                Text('Achievements',
                    style: Theme.of(context).textTheme.displayMedium)
              ],
            ),
            kHeight5,
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GetBuilder<CardController>(builder: (cardController) {
                    final personalAchivements = cardController.bizcardDetail
                        .value.personalDetails?.personalAchievements;
                    final bussinessAchievemets = cardController.bizcardDetail
                        .value.businessDetails?.businessAchievements;
                    List<Achievement> achivement = [
                      ...personalAchivements ?? [],
                      ...bussinessAchievemets ?? []
                    ];

                    if (dateController.text != '') {
                      achivement = achivement
                          .where((element) =>
                              DateTimeFormater.getDateByDayMonthYear(
                                  element.date ?? '') ==
                              dateController.text)
                          .toList();
                    }
                    if (eventController.text != 'All' &&
                        eventController.text != 'Others' &&
                        eventController.text != '') {
                      achivement = achivement
                          .where((element) =>
                              element.event == eventController.text)
                          .toList();
                    } else if (eventController.text == 'Others') {
                      achivement = achivement
                          .where((element) =>
                              !achivementEvents.contains(element.event))
                          .toList();
                    }
                    return Column(
                      children: [
                        kHeight10,
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
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 12),
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
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall,
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
                              padding:
                                  const EdgeInsets.only(left: 10, right: 12),
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
                                  ],
                                  onTap: (value) {
                                    eventController.text = value ?? '';
                                    setState(() {});
                                  }),
                            ))
                          ],
                        ),
                        kHeight20,
                        Expanded(
                          child: achivement.isEmpty
                              ? Center(child: Image.asset(emptyNodata2))
                              : ListView.separated(
                                  // physics: const NeverScrollableScrollPhysics(),
                                  separatorBuilder: (context, index) =>
                                      adjustHieght(kwidth * .09),
                                  itemCount: achivement.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
                                      child: InkWell(
                                        onTap: () {
                                          // Navigator.push(
                                          //     context,
                                          //     cardFadePageRoute(ScreenAchivementDetail(
                                          //         achievement: achivement[index])));
                                        },
                                        child: SizedBox(
                                          height: 250,
                                          width: double.infinity,
                                          child: Stack(
                                            children: [
                                              achivement[index].images?[0]==null? SizedBox(
                                                height: 230,
                                                width: double.infinity,
                                                child:Image.asset(bizcardBgImage,fit: BoxFit.cover,),
                                              ):
                                              SizedBox(
                                                height: 230,
                                                width: double.infinity,
                                                child: NetworkImageWithLoader(
                                                  achivement[index].images![0],
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Positioned(
                                                left: 0,
                                                right: 0,
                                                bottom: 0,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  color: kblack.withOpacity(.5),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(achivement[index]
                                                              .title ??
                                                          ''),
                                                      Text(
                                                        achivement[index]
                                                                .description ??
                                                            '',
                                                        style:
                                                            textStyle1.copyWith(
                                                          fontSize:
                                                              kwidth * .03,
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
                        ),
                      ],
                    );
                  })),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDropDown extends StatefulWidget {
  const CustomDropDown(
      {super.key,
      required this.title,
      required this.icon,
      this.showError = false,
      required this.items,
      required this.onTap});
  final String title;
  final bool showError;
  final IconData icon;
  final List<String> items;
  final Function(String? value) onTap;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  void initState() {
    title = widget.title;
    super.initState();
  }

  String title = '';
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: DropdownButton(
            hint: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: Theme.of(context).textTheme.displaySmall),
              ],
            ),
            items: widget.items.map<DropdownMenuItem<String>>(
              (String value) {
                return DropdownMenuItem<String>(
                  onTap: () => setState(() {
                    title = value;
                  }),
                  value: value,
                  child: Text(value,
                      style: Theme.of(context).textTheme.displaySmall),
                );
              },
            ).toList(),
            onChanged: widget.onTap));
  }
}
