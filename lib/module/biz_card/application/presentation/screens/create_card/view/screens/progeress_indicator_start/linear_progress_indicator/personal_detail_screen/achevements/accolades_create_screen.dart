import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:bizkit/module/biz_card/application/controller/card/personal_details.dart';
import 'package:bizkit/utils/image_preview/image_slidable_list.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/achievement.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/image_card/image_card.dart';
import 'package:bizkit/utils/appbar.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/date_bottom_sheet.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:bizkit/utils/image_picker/image_picker.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/utils/show_dialogue/show_dailogue.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:bizkit/utils/text_field/auto_fill_text_field.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:bizkit/utils/time.dart';
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
  List<ImageCard> image = [];
  List<ImageCard> newimage = [];
  String titleChange = '';
  String descriptionChange = '';

  @override
  void initState() {
    if (widget.achievement != null) {
      final personalController = Get.find<PersonalDetailsController>();
      image = widget.achievement!.images ?? [];
      titleChange = widget.achievement!.title ?? '';
      personalController.personalAchievementTitle.text =
          widget.achievement!.title ?? '';
      descriptionChange = widget.achievement!.description ?? '';
      personalController.personalAchievementDescription.text =
          widget.achievement!.description ?? '';
      personalController.personalAchievementDate.text =
          getDateByDayMonthYear(widget.achievement!.date ?? '');
      personalController.personalAchievementEvent.text =
          widget.achievement!.event ?? '';
      log('${image.length}');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final personalController = Get.find<PersonalDetailsController>();
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
              child: Column(
                children: [
                  adjustHieght(khieght * .05),
                  InkWell(
                    onTap: () async {
                      cameraAndGalleryPickImage(
                          tittle: "Choose image from",
                          context: context,
                          onPressCam: () async {
                            final img =
                                await ImagePickerClass.getImage(camera: true);
                            if (img != null) {
                              image.add(ImageCard(image: img.base64));
                              newimage.add(ImageCard(image: img.base64));
                              setState(() {});
                            }
                          },
                          onPressGallery: () async {
                            final img =
                                await ImagePickerClass.getImage(camera: false);
                            if (img != null) {
                              image.add(ImageCard(image: img.base64));
                              newimage.add(ImageCard(image: img.base64));
                              setState(() {});
                            }
                          });
                    },
                    child: SizedBox(
                      height: 170.dm,
                      child: Stack(
                        children: [
                          ListView.separated(
                            separatorBuilder: (context, index) =>
                                adjustWidth(10),
                            scrollDirection: Axis.horizontal,
                            itemCount: image.length,
                            itemBuilder: (context, index) {
                              return MemoryImageMaker(
                                  deleteTap: () {
                                    showCustomConfirmationDialogue(
                                        context: context,
                                        title: 'Are you sure want to remove ?',
                                        buttonText: 'Delete',
                                        onTap: () {
                                          newimage.removeWhere((element) =>
                                              element ==
                                              image[image.length - index - 1]);
                                          image.removeAt(
                                              image.length - index - 1);
                                          setState(() {});
                                        });
                                  },
                                  image: image,
                                  index: image.length - index - 1);
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
                                        final img =
                                            await ImagePickerClass.getImage(
                                                camera: true);
                                        if (img != null) {
                                          image.add(
                                              ImageCard(image: img.base64));
                                          newimage.add(
                                              ImageCard(image: img.base64));
                                          setState(() {});
                                        }
                                      },
                                      onPressGallery: () async {
                                        final img =
                                            await ImagePickerClass.getImage(
                                                camera: false);
                                        if (img != null) {
                                          image.add(
                                              ImageCard(image: img.base64));
                                          newimage.add(
                                              ImageCard(image: img.base64));
                                          setState(() {});
                                        }
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
                              personalController.personalAchievementDate.text =
                                  date;
                            });
                          },
                          datePicker:
                              personalController.personalAchievementDate,
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
                              personalController
                                      .personalAchievementDate.text.isEmpty
                                  ? 'Choose Date'
                                  : personalController
                                      .personalAchievementDate.text,
                              style: personalController
                                      .personalAchievementDate.text.isEmpty
                                  ? const TextStyle(color: kwhite)
                                  : const TextStyle(color: kwhite),
                            ),
                          ),
                          const Icon(
                            Icons.calendar_month,
                            color: neonShade,
                          ),
                        ],
                      ),
                    ),
                  ),
                  kHeight5,
                  AutocompleteTextField(
                      textCapitalization: TextCapitalization.words,
                      onDropDownSelection: (value) {
                        FocusScope.of(context).unfocus();
                      },
                      controller: personalController.personalAchievementEvent,
                      label: 'Event',
                      autocompleteItems: achivementEvents),
                  CustomTextFormField(
                    controller: personalController.personalAchievementTitle,
                    maxlegth: 100,
                    textCapitalization: TextCapitalization.words,
                    onChanaged: (value) {
                      titleChange = value;
                    },
                    labelText: 'Title',
                    inputType: TextInputType.name,
                  ),
                  CustomTextFormField(
                    controller:
                        personalController.personalAchievementDescription,
                    maxlegth: 300,
                    onChanaged: (value) {
                      descriptionChange = value;
                    },
                    textCapitalization: TextCapitalization.sentences,
                    labelText: 'Description',
                    maxLines: 8,
                    inputType: TextInputType.name,
                  ),
                  adjustHieght(khieght * .02),
                  Obx(
                    () {
                      if (personalController.isLoading.value) {
                        return const LoadingAnimation();
                      }
                      return EventButton(
                        hieght: 48,
                        text: 'Save',
                        onTap: () {
                          if (image.isEmpty ||
                              titleChange == '' ||
                              descriptionChange == '') {
                            showSnackbar(context,
                                message: image.isEmpty
                                    ? 'Add image'
                                    : titleChange == ''
                                        ? 'Add title'
                                        : 'Add description',
                                backgroundColor: kred);
                            return;
                          } else {
                            List<String> sendImage = image
                                .map((e) => e.image!.substring(22))
                                .toList();
                            !widget.fromBusiness
                                ? personalController.acheievementAdding(
                                    sendImage, context)
                                : null;
                          }
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
