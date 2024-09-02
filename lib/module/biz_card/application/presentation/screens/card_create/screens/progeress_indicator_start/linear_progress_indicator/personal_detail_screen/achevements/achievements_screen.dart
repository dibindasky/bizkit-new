import 'dart:convert';
import 'package:bizkit/module/biz_card/application/controller/card/business_details.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/card/personal_details.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/achevements/create_achievement_screen.dart';
import 'package:bizkit/utils/image_preview/image_slidable_list.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/achievement/personal_achievent_deletion_model/personal_achievent_deletion_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/achievement.dart';
import 'package:bizkit/utils/appbar.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/date_bottom_sheet.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/utils/time.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CardScreenAchievements extends StatefulWidget {
  const CardScreenAchievements({super.key, required this.fromBusiness});

  final bool fromBusiness;
  //final int cardId;

  @override
  State<CardScreenAchievements> createState() => _CardScreenAchievementsState();
}

class _CardScreenAchievementsState extends State<CardScreenAchievements> {
  final dateController = TextEditingController(text: '');
  final eventController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final cardController = Get.find<CardController>();
    final personalController = Get.find<PersonalDetailsController>();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(kwidth, 70),
        child: CardAppbarCommen(
          tittle: !widget.fromBusiness
              ? 'Personal Achievements'
              : 'Company Achievements',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Add your ${!widget.fromBusiness ? 'Personal' : 'Company'}  Achievements here for people to know about you",
                  style: TextStyle(fontSize: kwidth * .043),
                ),
                kHeight10,
                Center(
                  child: InkWell(
                    onTap: () async {
                      personalController.achivementDataClear();
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CardScreenAchievementsCreate(
                          fromBusiness: widget.fromBusiness,
                        ),
                      ));
                    },
                    child: DottedBorder(
                      dashPattern: const [8, 8],
                      color: neonShade,
                      strokeWidth: 2.5,
                      child: SizedBox(
                        width: double.infinity,
                        height: kwidth * 0.25,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 32.dm,
                              height: 32.dm,
                              child: const CircleAvatar(
                                child: Icon(Icons.add),
                              ),
                            ),
                            Text(
                              'Add Achievements',
                              style: TextStyle(fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                adjustHieght(khieght * .04),
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () => showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return DatePickingBottomSheet(
                                // initialDate: DateTime.now(),
                                year: 500,
                                last: 500,
                                onPressed: (date) {
                                  dateController.text = date;
                                  setState(() {});
                                  Navigator.pop(context);
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
                                        onTap: () {
                                          setState(() {
                                            dateController.text = '';
                                          });
                                        },
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
                            items: const [...achivementEvents, 'Others', 'All'],
                            onTap: (value) {
                              eventController.text = value ?? '';
                              setState(() {});
                            }),
                      ))
                    ],
                  ),
                ),
                adjustHieght(khieght * .04),
                AchivementListViewCreation(
                  fromBusiness: widget.fromBusiness,
                  achievements: !widget.fromBusiness
                      ? cardController.bizcardDetail.value.personalDetails
                              ?.personalAchievements ??
                          <Achievement>[]
                      : cardController.bizcardDetail.value.businessDetails
                              ?.businessAchievements ??
                          <Achievement>[],
                ),
                adjustHieght(khieght * .03),
                EventButton(
                  hieght: 48,
                  text: 'Go Back',
                  onTap: () => Navigator.of(context).pop(),
                ),
                adjustHieght(khieght * .02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AchivementListViewCreation extends StatelessWidget {
  const AchivementListViewCreation(
      {super.key, this.achievements, required this.fromBusiness});
  final List<Achievement>? achievements;
  final bool fromBusiness;

  @override
  Widget build(BuildContext context) {
    final personalController = Get.find<PersonalDetailsController>();
    final cardController = Get.find<CardController>();
    final businessController = Get.find<BusinesDetailsController>();
    return Obx(
      () {
        if (personalController.deleteLoading.value) {
          return const LoadingAnimation();
        }
        return ListView.separated(
          separatorBuilder: (context, index) => adjustHieght(kwidth * .03),
          itemCount: (achievements?.length ?? 0),
          key: UniqueKey(),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                if (achievements != null) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CardScreenAchievementsCreate(
                          achievement: achievements![index],
                          fromBusiness: fromBusiness,
                        ),
                      ));
                }
              },
              child: SizedBox(
                height: 260,
                width: double.infinity,
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SlidablePhotoGallery(
                                images: achievements?[index]
                                        .images
                                        ?.map((e) => e.image ?? '')
                                        .toList() ??
                                    [],
                                initialIndex: index),
                          ),
                        );
                      },
                      child: SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Image.memory(
                          base64.decode((achievements != null &&
                                  achievements![index].images != null &&
                                  achievements![index].images!.isNotEmpty
                              ? achievements![index].images![0].image!
                              : '')),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.only(left: 10),
                        color: kblack.withOpacity(.7),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              achievements?[index].event ?? '',
                              style: textStyle1.copyWith(
                                fontSize: kwidth * .04,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              achievements?[index].description ?? '',
                              style: textStyle1.copyWith(
                                fontSize: kwidth * .03,
                              ),
                            ),
                            Text(
                              getDateByDayMonthYear(
                                  achievements?[index].date ?? ''),
                              style: textStyle1.copyWith(
                                fontSize: kwidth * .03,
                              ),
                            ),
                            Text(
                              achievements?[index].title ?? '',
                              style: textStyle1.copyWith(
                                fontSize: kwidth * .03,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: CircleAvatar(
                        child: IconButton(
                          onPressed: () {
                            showCustomConfirmationDialogue(
                                context: context,
                                title: 'Are you sure want to delete ?',
                                buttonText: 'Delete',
                                onTap: () {
                                  PersonalAchieventDeletionModel
                                      personalAchievementDeletion =
                                      PersonalAchieventDeletionModel(
                                          personalDetailsId: cardController
                                              .bizcardDetail
                                              .value
                                              .personalDetails
                                              ?.id,
                                          personalAchievementId: cardController
                                              .bizcardDetail
                                              .value
                                              .personalDetails
                                              ?.personalAchievements?[index]
                                              .id);
                                  !fromBusiness
                                      ? personalController
                                          .personalAcheievementDeleting(
                                              context: context,
                                              personalAchievementDeletion:
                                                  personalAchievementDeletion)
                                      : businessController.achievementDeleting(
                                          context: context, index: index);
                                });
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
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
                Text(title, style: const TextStyle(color: kwhite)),
              ],
            ),
            items: widget.items.map<DropdownMenuItem<String>>(
              (String value) {
                return DropdownMenuItem<String>(
                  onTap: () => setState(() {
                    title = value;
                  }),
                  value: value,
                  child: Text(
                    value,
                    // style: textHeadSemiBold1.copyWith(
                    //   fontSize: sWidth * 0.04,
                    // ),
                  ),
                );
              },
            ).toList(),
            onChanged: widget.onTap));
  }
}
