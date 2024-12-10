import 'dart:convert';
import 'dart:typed_data';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/card/business_details.dart';
import 'package:bizkit/module/biz_card/application/controller/card/personal_details.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/achievement.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/image_card/image_card.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/bottom_sheets/date_bottom_sheet.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:bizkit/utils/image_picker/image_picker.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/utils/show_dialogue/show_dailogue.dart';
import 'package:bizkit/utils/text_field/auto_fill_text_field.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class BizCardAchivementCreationAndUpdation extends StatefulWidget {
  const BizCardAchivementCreationAndUpdation(
      {super.key, this.achievement, required this.fromBusiness});
  final Achievement? achievement;
  final bool fromBusiness;

  @override
  State<BizCardAchivementCreationAndUpdation> createState() =>
      _BizCardAchivementCreationAndUpdationState();
}

class _BizCardAchivementCreationAndUpdationState
    extends State<BizCardAchivementCreationAndUpdation> {
  final GlobalKey<FormState> achivementFormKey = GlobalKey<FormState>();
  final personalController = Get.find<PersonalDetailsController>();
  final bussinessController = Get.find<BusinesDetailsController>();
  @override
  void initState() {
    if (widget.achievement != null) {
      Get.find<PersonalDetailsController>()
          .addAchivementDetailsToController(achievement: widget.achievement);
    }
    super.initState();
  }

  @override
  void dispose() {
    personalController.personalAchivementImage.value = [];

    personalController.achievementDate.clear();
    personalController.achievementDateChange.value = '';

    personalController.achievementEvent.clear();

    personalController.achievementDescription.clear();
    personalController.achievementDescriptionChange = '';

    personalController.achievementTitle.clear();
    personalController.achievementTitleChange = '';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusNode focus = FocusScope.of(context);
        if (!focus.hasPrimaryFocus) {
          focus.unfocus();
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SafeArea(
            child: Column(
              children: [
                kHeight10,
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).pop();
                      },
                      child: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 15.sp,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                      ),
                    ),
                    kWidth10,
                    Text(
                        widget.fromBusiness
                            ? 'Company Achievements'
                            : 'Personal Achievements',
                        style: Theme.of(context).textTheme.displayMedium)
                  ],
                ),
                kHeight10,
                Form(
                  key: achivementFormKey,
                  child: Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          kHeight5,
                          // images adding or deleting section
                          InkWell(
                            onTap: () async {
                              cameraAndGalleryPickImage(
                                  tittle: "Choose image from",
                                  context: context,
                                  onPressCam: () async {
                                    final img = await ImagePickerClass.getImage(
                                        camera: true);
                                    if (img != null) {
                                      personalController.personalAchivementImage
                                          .add(ImageCard(image: img.base64));
                                      setState(() {});
                                    }
                                  },
                                  onPressGallery: () async {
                                    final img = await ImagePickerClass.getImage(
                                        camera: false);
                                    if (img != null) {
                                      personalController.personalAchivementImage
                                          .add(ImageCard(image: img.base64));
                                      setState(() {});
                                    }
                                  });
                            },
                            child: SizedBox(
                              height: 170.dm,
                              child: Stack(
                                children: [
                                  personalController.personalAchivementImage
                                              .isEmpty ||
                                          personalController
                                                  .personalAchivementImage ==
                                              null
                                      ? Center(
                                          child: Text('Add Image',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall),
                                        )
                                      : ListView.separated(
                                          separatorBuilder: (context, index) =>
                                              kWidth10,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: personalController
                                              .personalAchivementImage.length,
                                          itemBuilder: (context, index) {
                                            return CardAchivementImageMaker(
                                                deleteTap: () {
                                                  showCustomConfirmationDialogue(
                                                      context: context,
                                                      title:
                                                          'Are you sure want to remove ?',
                                                      buttonText: 'Delete',
                                                      onTap: () {
                                                        personalController
                                                            .personalAchivementImage
                                                            .removeAt(index);
                                                        setState(() {});
                                                      });
                                                },
                                                image: personalController
                                                    .personalAchivementImage,
                                                index: index);
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
                                                    await ImagePickerClass
                                                        .getImage(camera: true);
                                                if (img != null) {
                                                  personalController
                                                      .personalAchivementImage
                                                      .insert(
                                                          0,
                                                          ImageCard(
                                                              image:
                                                                  img.base64));
                                                  setState(() {});
                                                }
                                              },
                                              onPressGallery: () async {
                                                final img =
                                                    await ImagePickerClass
                                                        .getImage(
                                                            camera: false);
                                                if (img != null) {
                                                  personalController
                                                      .personalAchivementImage
                                                      .insert(
                                                          0,
                                                          ImageCard(
                                                              image:
                                                                  img.base64));
                                                  setState(() {});
                                                }
                                              });
                                        },
                                        child: const CircleAvatar(
                                          radius: 30,
                                          child:
                                              Icon(Icons.add_a_photo_outlined),
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
                                    personalController.addDate(date: date);
                                    // setState(() {
                                    //   personalController.achievementDate.text =
                                    //       date;
                                    // });
                                  },
                                  datePicker:
                                      personalController.achievementDate,
                                );
                              },
                            ),
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 12),
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                // color: Theme.of(context).,
                                border: Border.all(color: kgrey),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      personalController
                                              .achievementDate.text.isEmpty
                                          ? 'Choose Date'
                                          : personalController
                                              .achievementDate.text,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    ),
                                  ),
                                  Icon(Icons.calendar_month,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .surface),
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
                            controller:
                                personalController.achievementDescription,
                            maxlegth: 300,
                            onChanaged: (value) {
                              personalController.achievementDescriptionChange =
                                  value;
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
                                      personalController
                                          .achievementLoading.value) ||
                                  (widget.fromBusiness &&
                                      bussinessController
                                          .achivementLoading.value)) {
                                return const LoadingAnimation();
                              }
                              return EventButton(
                                showGradiant: false,
                                hieght: 48,
                                text: widget.achievement?.id == null
                                    ? 'Save'
                                    : 'Update',
                                onTap: () {
                                  // if (personalController
                                  //     .personalAchivementImage.isEmpty) {
                                  //   showSnackbar(context,
                                  //       message: 'Add image',
                                  //       backgroundColor: kred);
                                  //   return;
                                  // } else
                                  if (achivementFormKey.currentState!
                                      .validate()) {
                                    List<String> sendImage = personalController
                                        .personalAchivementImage
                                        .map((e) => e.image!)
                                        .toList();
                                    if (widget.achievement?.id == null) {
                                      !widget.fromBusiness
                                          ? personalController
                                              .acheievementAdding(
                                                  sendImage, context)
                                          : bussinessController
                                              .achievementAdding(
                                                  sendImage, context);
                                    } else {
                                      !widget.fromBusiness
                                          ? personalController
                                              .acheievementUpdate(
                                                  sendImage,
                                                  context,
                                                  widget.achievement!.id!)
                                          : bussinessController
                                              .acheievementUpdate(
                                                  sendImage,
                                                  context,
                                                  widget.achievement!.id!);
                                    }
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardAchivementImageMaker extends StatefulWidget {
  const CardAchivementImageMaker(
      {super.key, this.deleteTap, required this.index, this.image});

  final List<ImageCard>? image;
  final int index;
  final VoidCallback? deleteTap;

  @override
  State<CardAchivementImageMaker> createState() =>
      _CardAchivementImageMakerState();
}

class _CardAchivementImageMakerState extends State<CardAchivementImageMaker> {
  Uint8List image = Uint8List(0);

  @override
  void initState() {
    if (!widget.image![widget.index].networkImage) {
      image = base64.decode(
          widget.image![widget.index].image!.startsWith('data')
              ? widget.image![widget.index].image!.substring(22)
              : widget.image![widget.index].image!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: kgrey), borderRadius: kBorderRadius10),
        width: 270.dm,
        height: 170.dm,
        child: Stack(
          children: [
            InkWell(
                onTap: () {
                          GoRouter.of(context)
                              .pushNamed(Routes.slidablePhotoGallery, extra: {
                            'images':  [widget.image![widget.index].image!],
                            'initial':widget.index,
                            'memory':widget.image![widget.index].networkImage==true? false:true,
                          });
                },
                child: SizedBox(
                  width: 270.dm,
                  height: 170.dm,
                  child: widget.image![widget.index].networkImage
                      ? NetworkImageWithLoader(
                          widget.image![widget.index].image ?? "",
                          radius: 10)
                      : Image.memory(image, fit: BoxFit.cover),
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
