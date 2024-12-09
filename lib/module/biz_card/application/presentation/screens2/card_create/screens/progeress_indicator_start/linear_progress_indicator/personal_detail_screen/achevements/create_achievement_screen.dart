import 'dart:convert';
import 'dart:typed_data';
import 'package:bizkit/module/biz_card/application/controller/card/business_details.dart';
import 'package:bizkit/module/biz_card/application/controller/card/personal_details.dart';
import 'package:bizkit/utils/images/image_slidable_list.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/achievement.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/image_card/image_card.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:bizkit/utils/widgets/appbar.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/bottom_sheets/date_bottom_sheet.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:bizkit/utils/image_picker/image_picker.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/utils/show_dialogue/show_dailogue.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:bizkit/utils/text_field/auto_fill_text_field.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CardScreenAchievementsCreate extends StatefulWidget {
  const CardScreenAchievementsCreate(
      {super.key, this.achievement, required this.fromBusiness});
  final Achievement? achievement;
  final bool fromBusiness;

  @override
  State<CardScreenAchievementsCreate> createState() =>
      _CardScreenAchievementsCreateState();
}

class _CardScreenAchievementsCreateState
    extends State<CardScreenAchievementsCreate> {
  final GlobalKey<FormState> achivementFormKey = GlobalKey<FormState>();
  @override
  void initState() {
    if (widget.achievement != null) {
      final personalController = Get.find<PersonalDetailsController>();
      // personalController.existingAchievementImages =
      //     widget.achievement!.images ?? [];
      personalController.achievementTitleChange =
          widget.achievement!.title ?? '';
      personalController.achievementTitle.text =
          widget.achievement!.title ?? '';
      personalController.achievementDescriptionChange =
          widget.achievement!.description ?? '';
      personalController.achievementDescription.text =
          widget.achievement!.description ?? '';
      personalController.achievementDate.text =
          DateTimeFormater.getDateByDayMonthYear(
              widget.achievement!.date ?? '');
      personalController.achievementEvent.text =
          widget.achievement!.event ?? '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final personalController = Get.find<PersonalDetailsController>();
    final bussinessController = Get.find<BusinesDetailsController>();
    return GestureDetector(
      onTap: () {
        FocusNode focus = FocusScope.of(context);
        if (!focus.hasPrimaryFocus) {
          focus.unfocus();
        }
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(kwidth, 70),
          child: CardAppbarCommen(
            tittle: widget.fromBusiness
                ? 'Company Achievements'
                : 'Personal Achievements',
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Form(
                key: achivementFormKey,
                child: Column(
                  children: [
                    adjustHieght(khieght * .05),
                    // images adding or deleting section
                    InkWell(
                      onTap: () async {
                        // cameraAndGalleryPickImage(
                        //     tittle: "Choose image from",
                        //     context: context,
                        //     onPressCam: () async {
                        //       final img =
                        //           await ImagePickerClass.getImage(camera: true);
                        //       if (img != null) {
                        //         personalController.existingAchievementImages
                        //             .add(ImageCard(image: img.base64));
                        //         personalController.newAchievementimage
                        //             .add(ImageCard(image: img.base64));
                        //         setState(() {});
                        //       }
                        //     },
                        //     onPressGallery: () async {
                        //       final img = await ImagePickerClass.getImage(
                        //           camera: false);
                        //       if (img != null) {
                        //         personalController.existingAchievementImages
                        //             .add(ImageCard(image: img.base64));
                        //         personalController.newAchievementimage
                        //             .add(ImageCard(image: img.base64));
                        //         setState(() {});
                        //       }
                        //     });
                      },
                      child: SizedBox(
                        height: 170.dm,
                        child: Stack(
                          children: [
                            ListView.separated(
                              separatorBuilder: (context, index) => kWidth10,
                              scrollDirection: Axis.horizontal,
                              itemCount: 1,
                              // itemCount: personalController
                              //     .existingAchievementImages.length,
                              itemBuilder: (context, index) {
                                return MemoryImageMaker(
                                    deleteTap: () {
                                      showCustomConfirmationDialogue(
                                          context: context,
                                          title:
                                              'Are you sure want to remove ?',
                                          buttonText: 'Delete',
                                          onTap: () {
                                            // personalController
                                            //     .newAchievementimage
                                            //     .removeWhere((element) =>
                                            //         element ==
                                            //         personalController
                                            //                 .existingAchievementImages[
                                            //             personalController
                                            //                     .existingAchievementImages
                                            //                     .length -
                                            //                 index -
                                            //                 1]);
                                            // personalController
                                            //     .existingAchievementImages
                                            //     .removeAt(personalController
                                            //             .existingAchievementImages
                                            //             .length -
                                            //         index -
                                            //         1);
                                            // setState(() {});
                                          });
                                    },
                                    image: [ImageCard()],
                                    // personalController
                                    //     .existingAchievementImages,
                                    index: 0
                                    // index: personalController
                                    //         .existingAchievementImages.length -
                                    //     index -
                                    //     1
                                    );
                              },
                            ),
                            Positioned(
                              bottom: 5,
                              right: 5,
                              child: InkWell(
                                  onTap: () {
                                    cameraAndGalleryPickImage(
                                        tittle: "Choose image from",
                                        context: context,
                                        onPressCam: () async {
                                          // final img =
                                          //     await ImagePickerClass.getImage(
                                          //         camera: true);
                                          // if (img != null) {
                                          //   personalController
                                          //       .existingAchievementImages
                                          //       .add(ImageCard(
                                          //           image: img.base64));
                                          //   personalController
                                          //       .newAchievementimage
                                          //       .add(ImageCard(
                                          //           image: img.base64));
                                          //   setState(() {});
                                          // }
                                        },
                                        onPressGallery: () async {
                                          // final img =
                                          //     await ImagePickerClass.getImage(
                                          //         camera: false);
                                          // if (img != null) {
                                          //   personalController
                                          //       .existingAchievementImages
                                          //       .add(ImageCard(
                                          //           image: img.base64));
                                          //   personalController
                                          //       .newAchievementimage
                                          //       .add(ImageCard(
                                          //           image: img.base64));
                                          //   setState(() {});
                                          // }
                                        });
                                  },
                                  child: const CircleAvatar(
                                    radius: 30,
                                    child: Icon(Icons.add_a_photo_outlined),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                    adjustHieght(khieght * .02),
                    // date selection section
                    InkWell(
                      onTap: () => showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return DatePickingBottomSheet(
                            year: 500,
                            last: 500,
                            onPressed: (date) {
                              setState(() {
                                personalController.achievementDate.text = date;
                              });
                             
                            },
                            datePicker: personalController.achievementDate,
                          );
                        },
                      ),
                      child: Container(
                        padding: const EdgeInsets.only(left: 10, right: 12),
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: klightDarkGrey,
                          border: Border.all(color: kgrey),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                personalController.achievementDate.text.isEmpty
                                    ? 'Choose Date'
                                    : personalController.achievementDate.text,
                                style: personalController
                                        .achievementDate.text.isEmpty
                                    ? const TextStyle(color: kwhite)
                                    : const TextStyle(color: kwhite),
                              ),
                            ),
                            const Icon(Icons.calendar_month, color: neonShade),
                          ],
                        ),
                      ),
                    ),
                    kHeight5,
                    // Events section
                    AutocompleteTextField(
                        textCapitalization: TextCapitalization.words,
                        onDropDownSelection: (value) {
                          FocusScope.of(context).unfocus();
                        },
                        controller: personalController.achievementEvent,
                        label: 'Event',
                        autocompleteItems: achivementEvents),
                    // Title
                    CustomTextFormField(
                      controller: personalController.achievementTitle,
                      maxlegth: 100,
                      textCapitalization: TextCapitalization.words,
                      onChanaged: (value) {
                        personalController.achievementTitleChange = value;
                      },
                      labelText: 'Title',
                      inputType: TextInputType.name,
                      validate: Validate.notNull,
                    ),
                    // Description section
                    CustomTextFormField(
                      controller: personalController.achievementDescription,
                      maxlegth: 300,
                      onChanaged: (value) {
                        personalController.achievementDescriptionChange = value;
                      },
                      textCapitalization: TextCapitalization.sentences,
                      labelText: 'Description',
                      maxLines: 8,
                      inputType: TextInputType.name,
                      validate: Validate.notNull,
                    ),
                    adjustHieght(khieght * .02),
                    // save or update button
                    Obx(
                      () {
                        if ((!widget.fromBusiness &&
                                personalController.achievementLoading.value) ||
                            (widget.fromBusiness &&
                                bussinessController.achivementLoading.value)) {
                          return const LoadingAnimation();
                        }
                        return EventButton(
                          hieght: 48,
                          text: widget.achievement?.id == null
                              ? 'Save'
                              : 'Update',
                          onTap: () {
                            // if (personalController
                            //     .existingAchievementImages.isEmpty) {
                            //   showSnackbar(context,
                            //       message: 'Add image', backgroundColor: kred);
                            //   return;
                            // } else if (achivementFormKey.currentState!
                            //     .validate()) {
                            //   List<String> sendImage = personalController
                            //       .existingAchievementImages
                            //       .map((e) => e.image!)
                            //       .toList();
                            //   if (widget.achievement?.id == null) {
                            //     !widget.fromBusiness
                            //         ? personalController.acheievementAdding(
                            //             sendImage, context)
                            //         : bussinessController.achievementAdding(
                            //             sendImage, context);
                            //   } else {
                            //     !widget.fromBusiness
                            //         ? personalController.acheievementUpdate(
                            //             sendImage,
                            //             context,
                            //             widget.achievement!.id!)
                            //         : bussinessController.acheievementUpdate(
                            //             sendImage,
                            //             context,
                            //             widget.achievement!.id!);
                            //   }
                            // }
                          },
                        );
                      },
                    ),
                    adjustHieght(30)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MemoryImageMaker extends StatefulWidget {
  const MemoryImageMaker(
      {super.key, this.deleteTap, required this.index, this.image});

  final List<ImageCard>? image;
  final int index;
  final VoidCallback? deleteTap;

  @override
  State<MemoryImageMaker> createState() => _MemoryImageMakerState();
}

class _MemoryImageMakerState extends State<MemoryImageMaker> {
  Uint8List image = Uint8List(0);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: kgrey),
            borderRadius: BorderRadius.circular(10)),
        width: 270.dm,
        height: 170.dm,
        child: Stack(
          children: [
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SlidablePhotoGallery(
                          initialIndex: widget.image!.length - widget.index - 1,
                          images: widget.image!
                              .map((e) => e.image!)
                              .toList()
                              .reversed
                              .toList())));
                },
                child: SizedBox(
                  width: 270.dm,
                  height: 170.dm,
                  child: Image.memory(
                      base64.decode(
                          widget.image![widget.index].image!.startsWith('data')
                              ? widget.image![widget.index].image!.substring(22)
                              : widget.image![widget.index].image!),
                      fit: BoxFit.cover),
                )),
            Positioned(
              top: 5,
              right: 5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ColoredBox(
                  color: neonShade,
                  child: IconButton.filled(
                      onPressed: widget.deleteTap,
                      icon: const Icon(Icons.delete, color: kwhite)),
                ),
              ),
            )
          ],
        ));
  }
}
