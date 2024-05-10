import 'dart:convert';
import 'dart:developer';
import 'package:bizkit/application/business_logic/card_second/card_second_bloc.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/last_skip_and_continue.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/image_picker/image_picker.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/application/presentation/utils/show_dialogue/show_dailogue.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/widgets/image_preview.dart';
import 'package:bizkit/application/presentation/widgets/image_slidable_list.dart';
import 'package:bizkit/domain/model/card_second/add_selfie_model/add_selfie_model.dart';
import 'package:bizkit/domain/model/card_second/get_all_second_card_model/seond_card_new.dart';
import 'package:bizkit/domain/model/card_second/get_second_card_model/selfie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondCardUpdation extends StatefulWidget {
  const SecondCardUpdation({super.key, required this.secondCard});
  final SecondCardNew secondCard;

  @override
  State<SecondCardUpdation> createState() => _SecondCardUpdationState();
}

class _SecondCardUpdationState extends State<SecondCardUpdation> {
  List<String> selfieBase64List = [];
  String? base64imagecard;
  List<Selfie> imageList = [];
  List<Selfie> newImageList = [];

  @override
  void initState() {
    newImageList = [];
    // if (widget.secondCard.selfie != null ||
    //     widget.secondCard.selfie!.isNotEmpty) {
    //   for (var image in widget.secondCard.selfie!) {
    //     String im = image.image!;
    //     im = im.startsWith('data') ? im.substring(22) : im;
    //     selfieBase64List.add(im);
    //   }
    // }
    if (widget.secondCard.image != null ||
        widget.secondCard.selfie!.isNotEmpty) {
      base64imagecard = widget.secondCard.image ?? "";
      base64imagecard =
          base64imagecard!.replaceFirst(RegExp(r'data:image/jpg;base64,'), '');
    }
    if (widget.secondCard.selfie != null) {
      log('id ${widget.secondCard.selfie?.length}', name: 'sefie image legth');
      imageList = widget.secondCard.selfie ?? <Selfie>[];
      log('${imageList.length}', name: 'imageList  legth');
    }
    context.read<CardSecondBloc>().updateEmailController.text =
        widget.secondCard.email ?? '';
    context.read<CardSecondBloc>().updatedesignationController.text =
        widget.secondCard.designation ?? '';
    context.read<CardSecondBloc>().updatelocatioNController.text =
        widget.secondCard.location ?? '';
    context.read<CardSecondBloc>().updatenotesController.text =
        widget.secondCard.notes ?? '';
    context.read<CardSecondBloc>().updateoccationController.text =
        widget.secondCard.whereWeMet ?? '';
    context.read<CardSecondBloc>().updatephoneController.text =
        widget.secondCard.phoneNumber ?? '';
    context.read<CardSecondBloc>().updateoccupationController.text =
        widget.secondCard.occupation ?? '';
    context.read<CardSecondBloc>().updatewebSiteController.text =
        widget.secondCard.website ?? '';
    context.read<CardSecondBloc>().updatedesignationController.text =
        widget.secondCard.designation ?? '';
    context.read<CardSecondBloc>().updateNameController.text =
        widget.secondCard.name ?? '';
    context.read<CardSecondBloc>().updateCompanyController.text =
        widget.secondCard.company ?? '';

    super.initState();
    log('${selfieBase64List.length}', name: 'selfieBase64List');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode focusScope = FocusScope.of(context);
        if (!focusScope.hasPrimaryFocus) {
          focusScope.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.keyboard_arrow_left_outlined),
          ),
          title: const Text(
            'Update visiting card',
            style: TextStyle(
              fontFamily: 'Euclid',
              fontWeight: FontWeight.bold,
              color: kwhite,
            ),
          ),
          backgroundColor: knill,
        ),
        body: BlocConsumer<CardSecondBloc, CardSecondState>(
          listener: (context, state) {
            if (state.updated) {
              context
                  .read<CardSecondBloc>()
                  .add(const CardSecondEvent.imageClear());
              Navigator.pop(context);
              showSnackbar(context, message: 'Card Updated Successfully');
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    adjustHieght(20),
                    widget.secondCard.image != null &&
                            widget.secondCard.image!.isNotEmpty
                        ? const Text('Scanned card image')
                        : const Text('Add visitig card image'),
                    adjustHieght(20),
                    state.scannedImagesSecondCardCreation.isNotEmpty
                        ? Stack(
                            children: [
                              InkWell(
                                onTap: () => Navigator.of(context).push(
                                  fadePageRoute(ScreenImagePreview(
                                      image: state
                                          .scannedImagesSecondCardCreation
                                          .first
                                          .base64)),
                                ),
                                child: Container(
                                  height: kwidth * 0.60,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: FileImage(state
                                          .scannedImagesSecondCardCreation
                                          .first
                                          .fileImage),
                                      fit: BoxFit.fitHeight,
                                      onError: (exception, stackTrace) {
                                        const Icon(Icons.image);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 10,
                                bottom: 10,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: ColoredBox(
                                    color: neonShade,
                                    child: IconButton(
                                      onPressed: () {
                                        cameraAndGalleryPickImage(
                                          context: context,
                                          onPressCam: () {
                                            context.read<CardSecondBloc>().add(
                                                  const CardSecondEvent
                                                      .scanImage(
                                                    isFront: false,
                                                    isCam: true,
                                                  ),
                                                );
                                          },
                                          onPressGallery: () {
                                            context.read<CardSecondBloc>().add(
                                                  const CardSecondEvent
                                                      .scanImage(
                                                      isFront: false,
                                                      isCam: false),
                                                );
                                          },
                                        );
                                      },
                                      icon: const Icon(
                                        size: 30,
                                        color: kwhite,
                                        Icons.add,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : widget.secondCard.image != null &&
                                widget.secondCard.image!.isNotEmpty
                            ? Stack(
                                children: [
                                  InkWell(
                                    onTap: () => Navigator.of(context).push(
                                      fadePageRoute(ScreenImagePreview(
                                          image: base64imagecard!)),
                                    ),
                                    child: Container(
                                      height: kwidth * 0.60,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: MemoryImage(
                                              base64.decode(base64imagecard!)),
                                          fit: BoxFit.fitHeight,
                                          onError: (exception, stackTrace) {
                                            const Icon(Icons.image);
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 10,
                                    bottom: 10,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: ColoredBox(
                                        color: neonShade,
                                        child: IconButton(
                                          onPressed: () {
                                            cameraAndGalleryPickImage(
                                              context: context,
                                              onPressCam: () {
                                                context
                                                    .read<CardSecondBloc>()
                                                    .add(
                                                      const CardSecondEvent
                                                          .scanImage(
                                                        isFront: false,
                                                        isCam: true,
                                                      ),
                                                    );
                                              },
                                              onPressGallery: () {
                                                context
                                                    .read<CardSecondBloc>()
                                                    .add(
                                                      const CardSecondEvent
                                                          .scanImage(
                                                          isFront: false,
                                                          isCam: false),
                                                    );
                                              },
                                            );
                                          },
                                          icon: const Icon(
                                            size: 30,
                                            color: kwhite,
                                            Icons.add,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: ColoredBox(
                                  color: neonShade,
                                  child: IconButton(
                                    onPressed: () {
                                      cameraAndGalleryPickImage(
                                        context: context,
                                        onPressCam: () {
                                          context.read<CardSecondBloc>().add(
                                              const CardSecondEvent.scanImage(
                                                  isFront: false, isCam: true));
                                        },
                                        onPressGallery: () {
                                          context.read<CardSecondBloc>().add(
                                                  const CardSecondEvent
                                                      .scanImage(
                                                isFront: false,
                                                isCam: false,
                                              ));
                                        },
                                      );
                                    },
                                    icon: const Icon(
                                      size: 30,
                                      color: kwhite,
                                      Icons.add,
                                    ),
                                  ),
                                ),
                              ),
                    adjustHieght(20),
                    imageList.isNotEmpty
                        ? const Text('Selfie Image')
                        : const Text('Selfie image is empty'),
                    adjustHieght(20),
                    Stack(
                      children: [
                        SizedBox(
                          height: 200.dm,
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return adjustWidth(10);
                            },
                            scrollDirection: Axis.horizontal,
                            itemCount: imageList.length,
                            itemBuilder: (context, index) {
                              final imageSelfie = imageList[index];
                              if (imageSelfie.selfie == null) {
                                return kempty;
                              }
                              return Stack(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              SlidablePhotoGallery(
                                            images: imageList
                                                .map((e) => e.selfie!)
                                                .toList(),
                                            initialIndex: index,
                                          ),
                                        ),
                                      );
                                    },
                                    child: SizedBox(
                                      width: 300.dm,
                                      height: 200.dm,
                                      child: Image.memory(
                                        base64.decode(imageSelfie.selfie!
                                                .startsWith('data')
                                            ? imageSelfie.selfie!.substring(22)
                                            : imageSelfie.selfie ?? ''),
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return const Icon(Icons.error);
                                        },
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: ColoredBox(
                                        color: neonShade,
                                        child: IconButton(
                                          onPressed: () {
                                            showCustomConfirmationDialogue(
                                              context: context,
                                              buttonText: 'Delete',
                                              title:
                                                  'You want to delete product image',
                                              onTap: () {
                                                if (imageList[index].id !=
                                                    null) {
                                                  context
                                                      .read<CardSecondBloc>()
                                                      .add(CardSecondEvent
                                                          .removeSelfieIndexImages(
                                                              id: imageList[
                                                                      index]
                                                                  .id!));
                                                }
                                                newImageList.removeWhere(
                                                    (element) =>
                                                        element ==
                                                        imageList[index]);
                                                imageList.removeAt(index);
                                                setState(() {});
                                              },
                                            );
                                          },
                                          icon: const Icon(
                                            size: 30,
                                            color: kwhite,
                                            Icons.delete,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        Positioned(
                          right: 5,
                          bottom: 5,
                          child: InkWell(
                            onTap: () {
                              cameraAndGalleryPickImage(
                                context: context,
                                onPressCam: () async {
                                  final img = await ImagePickerClass.getImage(
                                      camera: true);
                                  if (img != null) {
                                    imageList.insert(
                                        0, Selfie(selfie: img.base64));
                                    newImageList
                                        .add(Selfie(selfie: img.base64));
                                    setState(() {});
                                  }
                                },
                                onPressGallery: () async {
                                  final img = await ImagePickerClass.getImage(
                                      camera: false);
                                  if (img != null) {
                                    imageList.insert(
                                        0, Selfie(selfie: img.base64));
                                    newImageList
                                        .add(Selfie(selfie: img.base64));
                                    setState(() {});
                                  }
                                },
                              );
                            },
                            child: const CircleAvatar(
                              radius: 30,
                              child: Icon(Icons.add_a_photo_outlined),
                            ),
                          ),
                        )
                      ],
                    ),
                    Form(
                      key: context.read<CardSecondBloc>().cardUpdateKey,
                      child: Column(
                        children: [
                          adjustHieght(khieght * 0.008),
                          CustomTextFormField(
                            textCapitalization: TextCapitalization.words,
                            validate: Validate.notNull,
                            labelText: 'Name',
                            controller: context
                                .read<CardSecondBloc>()
                                .updateNameController,
                            inputType: TextInputType.name,
                          ),
                          CustomTextFormField(
                            textCapitalization: TextCapitalization.words,
                            //validate: Validate.notNull,
                            labelText: 'Company',
                            controller: context
                                .read<CardSecondBloc>()
                                .updateCompanyController,
                            inputType: TextInputType.name,
                          ),
                          CustomTextFormField(
                            textCapitalization: TextCapitalization.none,
                            validate: Validate.ifValidEmail,
                            labelText: 'Email',
                            controller: context
                                .read<CardSecondBloc>()
                                .updateEmailController,
                            inputType: TextInputType.emailAddress,
                          ),
                          CustomTextFormField(
                            maxlegth: 10,
                            validate: Validate.ifValidnumber,
                            labelText: 'Phone number',
                            controller: context
                                .read<CardSecondBloc>()
                                .updatephoneController,
                            inputType: TextInputType.number,
                          ),
                          CustomTextFormField(
                            validate: Validate.ifValidWebsite,
                            labelText: 'Website',
                            controller: context
                                .read<CardSecondBloc>()
                                .updatewebSiteController,
                            inputType: TextInputType.emailAddress,
                          ),
                          CustomTextFormField(
                            textCapitalization: TextCapitalization.words,
                            // validate: Validate.notNull,
                            labelText: 'Designation',
                            controller: context
                                .read<CardSecondBloc>()
                                .updatedesignationController,
                            inputType: TextInputType.name,
                          ),
                          CustomTextFormField(
                            maxLines: 2,
                            textCapitalization: TextCapitalization.words,
                            // validate: Validate.notNull,
                            labelText: 'Location',
                            controller: context
                                .read<CardSecondBloc>()
                                .updatelocatioNController,
                            inputType: TextInputType.name,
                          ),
                          CustomTextFormField(
                            textCapitalization: TextCapitalization.words,
                            // validate: Validate.notNull,
                            labelText: 'Occasion',
                            controller: context
                                .read<CardSecondBloc>()
                                .updateoccationController,
                            inputType: TextInputType.name,
                          ),
                          CustomTextFormField(
                            //validate: Validate.notNull,
                            labelText: 'Occupation',
                            controller: context
                                .read<CardSecondBloc>()
                                .updateoccupationController,
                            inputType: TextInputType.name,
                          ),
                          CustomTextFormField(
                            textCapitalization: TextCapitalization.words,
                            //validate: Validate.notNull,
                            labelText: 'Notes',
                            controller: context
                                .read<CardSecondBloc>()
                                .updatenotesController,
                            inputType: TextInputType.name,
                          ),
                          adjustHieght(20),
                          !state.isLoading
                              ? LastSkipContinueButtons(
                                  continueText: '   Save   ',
                                  onTap: () {
                                    if (context
                                        .read<CardSecondBloc>()
                                        .cardUpdateKey
                                        .currentState!
                                        .validate()) {
                                      SecondCardNew secondCard = SecondCardNew(
                                        id: widget.secondCard.id,
                                        date: widget.secondCard.date,
                                        time: widget.secondCard.time,
                                        isActive: true,
                                        tag: '',
                                        whereWeMet: context
                                            .read<CardSecondBloc>()
                                            .updateoccationController
                                            .text,
                                        designation: context
                                            .read<CardSecondBloc>()
                                            .updatedesignationController
                                            .text,
                                        email: context
                                            .read<CardSecondBloc>()
                                            .updateEmailController
                                            .text,
                                        location: context
                                            .read<CardSecondBloc>()
                                            .updatelocatioNController
                                            .text,
                                        notes: context
                                            .read<CardSecondBloc>()
                                            .updatenotesController
                                            .text,
                                        occupation: context
                                            .read<CardSecondBloc>()
                                            .updateoccupationController
                                            .text,
                                        phoneNumber: context
                                            .read<CardSecondBloc>()
                                            .updatephoneController
                                            .text,
                                        website: context
                                            .read<CardSecondBloc>()
                                            .updatewebSiteController
                                            .text,
                                        image: state.scannedImagesSecondCardCreation
                                                .isNotEmpty
                                            ? state
                                                .scannedImagesSecondCardCreation
                                                .last
                                                .base64
                                            : widget.secondCard.image!,
                                        company: context
                                            .read<CardSecondBloc>()
                                            .updateCompanyController
                                            .text,
                                        name: context
                                            .read<CardSecondBloc>()
                                            .updateNameController
                                            .text,
                                        selfie: [],
                                      );
                                      AddSelfieModel addSelfieModel =
                                          AddSelfieModel(
                                        businessCardId: widget.secondCard.id,
                                        selfie: newImageList,
                                      );
                                      context.read<CardSecondBloc>().add(
                                            CardSecondEvent
                                                .addSelfieIndexImages(
                                              addSelfieModel: addSelfieModel,
                                              secondCard: secondCard,
                                              id: widget.secondCard.id
                                                  .toString(),
                                            ),
                                          );
                                    }
                                  },
                                )
                              : const LoadingAnimation(),
                          adjustHieght(40)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
