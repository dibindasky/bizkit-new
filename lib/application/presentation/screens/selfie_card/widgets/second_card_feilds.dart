import 'dart:developer';
import 'package:bizkit/application/business_logic/card_second/card_second_bloc.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/last_skip_and_continue.dart';
import 'package:bizkit/application/presentation/screens/selfie_card/selfie_screen.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/application/presentation/utils/show_dialogue/show_dailogue.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:bizkit/application/presentation/utils/text_field/auto_fill_text_field.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/widgets/image_slidable_list.dart';
import 'package:bizkit/domain/model/contact/add_new_contact/add_new_contact.dart';
import 'package:bottom_bar_matu/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardSecondScannedDatas extends StatelessWidget {
  CardSecondScannedDatas({super.key});
  final GlobalKey<FormState> autoFillDataKey = GlobalKey<FormState>();

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
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 17,
            ),
          ),
          title: const Text(
            'Make Visting Card',
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
            if (state.contactAdded) {
              showSnackbar(
                context,
                message: 'This person Added in your contact',
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  state.scannedImagesSecondCardCreation.isEmpty
                      ? kempty
                      : SizedBox(
                          height: 250,
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return adjustWidth(10);
                            },
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                state.scannedImagesSecondCardCreation.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          SlidablePhotoGallery(
                                        images: state
                                            .scannedImagesSecondCardCreation
                                            .map((e) => e.base64)
                                            .toList(),
                                        initialIndex: state
                                            .scannedImagesSecondCardCreation
                                            .map((e) => e.base64)
                                            .toList()
                                            .indexWhere((element) =>
                                                element.toInt() == index),
                                      ),
                                    ),
                                  );
                                },
                                child: SizedBox(
                                  height: 250,
                                  width: kwidth,
                                  child: Image.file(
                                    state.scannedImagesSecondCardCreation[index]
                                        .fileImage,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Form(
                      key: autoFillDataKey,
                      child: Column(
                        children: [
                          adjustHieght(khieght * 0.008),
                          AutocompleteTextField(
                            textCapitalization: TextCapitalization.words,
                            autocompleteItems:
                                state.scannedImageDatasModel?.names ?? [],
                            validate: Validate.notNull,
                            label: 'Name',
                            controller:
                                context.read<CardSecondBloc>().nameController,
                            inputType: TextInputType.name,
                          ),
                          AutocompleteTextField(
                            textCapitalization: TextCapitalization.words,
                            autocompleteItems:
                                state.scannedImageDatasModel?.names ?? [],
                            // validate: Validate.notNull,
                            label: 'Company',
                            controller:
                                context.read<CardSecondBloc>().copanyController,
                            inputType: TextInputType.emailAddress,
                          ),
                          AutocompleteTextField(
                            //textCapitalization: TextCapitalization.words,
                            autocompleteItems:
                                state.scannedImageDatasModel?.emails ?? [],
                            validate: Validate.ifValidEmail,
                            label: 'Email',
                            controller:
                                context.read<CardSecondBloc>().emailController,
                            inputType: TextInputType.emailAddress,
                          ),
                          AutocompleteTextField(
                            textCapitalization: TextCapitalization.words,
                            maxLength: 10,
                            autocompleteItems:
                                state.scannedImageDatasModel?.phone ?? [],
                            validate: Validate.ifValidnumber,
                            label: 'Phone number',
                            controller:
                                context.read<CardSecondBloc>().phoneController,
                            inputType: TextInputType.number,
                          ),
                          AutocompleteTextField(
                            textCapitalization: TextCapitalization.words,
                            autocompleteItems:
                                state.scannedImageDatasModel?.websites ?? [],
                            validate: Validate.ifValidWebsite,
                            label: 'Website',
                            controller: context
                                .read<CardSecondBloc>()
                                .webSiteController,
                            inputType: TextInputType.url,
                          ),
                          AutocompleteTextField(
                            textCapitalization: TextCapitalization.words,
                            autocompleteItems:
                                state.scannedImageDatasModel?.names ?? [],
                            // validate: Validate.notNull,
                            label: 'Designation',
                            controller: context
                                .read<CardSecondBloc>()
                                .designationController,
                            inputType: TextInputType.name,
                          ),
                          adjustHieght(khieght * .02),
                          state.contactAddLoading
                              ? const LoadingAnimation()
                              : LastSkipContinueButtons(
                                  onTap: () {
                                    if (autoFillDataKey.currentState!
                                        .validate()) {
                                      FocusScope.of(context).unfocus();
                                      Navigator.of(context).push(
                                        fadePageRoute(const SelfieTextFields()),
                                      );
                                      // Contact save
                                      AddNewContact addNewContact =
                                          AddNewContact(
                                        name: context
                                            .read<CardSecondBloc>()
                                            .nameController
                                            .text,
                                        email: context
                                            .read<CardSecondBloc>()
                                            .emailController
                                            .text,
                                        phoneNumber: context
                                            .read<CardSecondBloc>()
                                            .phoneController
                                            .text,
                                        companyName: context
                                            .read<CardSecondBloc>()
                                            .copanyController
                                            .text,
                                      );
                                      context.read<CardSecondBloc>().add(
                                          CardSecondEvent.contactSaveToPhone(
                                              addNewContact: addNewContact));

                                      context.read<CardSecondBloc>().add(
                                              CardSecondEvent
                                                  .autoFillTExtfieldItems(
                                            name: context
                                                .read<CardSecondBloc>()
                                                .nameController
                                                .text,
                                            scannedImage: state
                                                    .scannedImagesSecondCardCreation
                                                    .isNotEmpty
                                                ? state
                                                    .scannedImagesSecondCardCreation
                                                    .first
                                                    .base64
                                                : '',
                                            email: context
                                                .read<CardSecondBloc>()
                                                .emailController
                                                .text,
                                            company: context
                                                .read<CardSecondBloc>()
                                                .copanyController
                                                .text,
                                            number: context
                                                .read<CardSecondBloc>()
                                                .phoneController
                                                .text,
                                            website: context
                                                .read<CardSecondBloc>()
                                                .webSiteController
                                                .text,
                                            designation: context
                                                .read<CardSecondBloc>()
                                                .designationController
                                                .text,
                                          ));

                                      log('before navigating to selfie screen');
                                    }
                                  },
                                ),
                          adjustHieght(20)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class SelfieTextFields extends StatefulWidget {
  const SelfieTextFields({super.key});

  @override
  State<SelfieTextFields> createState() => _SelfieTextFieldsState();
}

class _SelfieTextFieldsState extends State<SelfieTextFields> {
  final GlobalKey<FormState> meetingDataKey = GlobalKey<FormState>();

  @override
  void initState() {
    context.read<CardSecondBloc>().add(const CardSecondEvent.locationGeting());
    super.initState();
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
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 17,
            ),
          ),
          title: const Text(
            'Make Visting Card',
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
            log('secondCardcreated listener');
            if (state.secondCardcreated) {
              log('secondCardcreated secondCardcreated');
              Navigator.pop(context);
              Navigator.pop(context);
              //Navigator.pop(context);
              context
                  .read<CardSecondBloc>()
                  .add(const CardSecondEvent.cardFeildClearing());
              showSnackbar(context, message: 'Card created successfully');
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  state.pickImageLoading
                      ? SizedBox(
                          height: khieght * .3,
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: neonShade,
                            ),
                          ),
                        )
                      : state.selfieImageModel.isEmpty
                          ? ContainerPickImage(
                              onPressedGallery: () =>
                                  context.read<CardSecondBloc>().add(
                                        const CardSecondEvent.selfieImage(
                                          isCam: false,
                                          cameraDeviceFront: false,
                                        ),
                                      ),
                              onPressedCam: () =>
                                  context.read<CardSecondBloc>().add(
                                        const CardSecondEvent.selfieImage(
                                          isCam: true,
                                          cameraDeviceFront: true,
                                        ),
                                      ),
                              heading: 'Take Selfie',
                            )
                          : Stack(
                              children: [
                                SizedBox(
                                  height: 250,
                                  child: ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return adjustWidth(10);
                                    },
                                    scrollDirection: Axis.horizontal,
                                    itemCount: state.selfieImageModel.length,
                                    itemBuilder: (context, index) {
                                      final selfiImages =
                                          state.selfieImageModel[index];
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SlidablePhotoGallery(
                                                images: state.selfieImageModel
                                                    .map((e) => e.base64)
                                                    .toList(),
                                                initialIndex: index,
                                              ),
                                            ),
                                          );
                                          // Navigator.push(
                                          //   context,
                                          //   fadePageRoute(ScreenImagePreview(
                                          //       image: selfiImages.base64)),
                                          // );
                                        },
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: 250,
                                              width: kwidth,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: FileImage(
                                                      selfiImages.fileImage),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 70,
                                              right: 10,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                child: ColoredBox(
                                                  color: neonShade,
                                                  child: IconButton(
                                                    onPressed: () {
                                                      showCustomConfirmationDialogue(
                                                        context: context,
                                                        buttonText: 'Delete',
                                                        title:
                                                            'You want to remove your selfie',
                                                        onTap: () {
                                                          context
                                                              .read<
                                                                  CardSecondBloc>()
                                                              .add(CardSecondEvent
                                                                  .selfieimageClear(
                                                                      index:
                                                                          index -
                                                                              1));
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
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  right: 10,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: ColoredBox(
                                      color: neonShade,
                                      child: IconButton(
                                        onPressed: () {
                                          cameraAndGalleryPickImage(
                                              tittle: 'Choose image from ?',
                                              context: context,
                                              onPressCam: () {
                                                context
                                                    .read<CardSecondBloc>()
                                                    .add(
                                                      const CardSecondEvent
                                                          .selfieImage(
                                                        isCam: true,
                                                        cameraDeviceFront: true,
                                                      ),
                                                    );
                                              },
                                              onPressGallery: () {
                                                context
                                                    .read<CardSecondBloc>()
                                                    .add(
                                                      const CardSecondEvent
                                                          .selfieImage(
                                                        isCam: false,
                                                        cameraDeviceFront:
                                                            false,
                                                      ),
                                                    );
                                              });
                                        },
                                        icon: const Icon(Icons.camera),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Form(
                      key: meetingDataKey,
                      child: Column(
                        children: [
                          adjustHieght(khieght * 0.008),
                          CustomTextFormField(
                            textCapitalization: TextCapitalization.words,
                            // validate: Validate.notNull,
                            labelText: 'Occasion',
                            controller: context
                                .read<CardSecondBloc>()
                                .occationController,
                            inputType: TextInputType.name,
                          ),
                          BlocBuilder<CardSecondBloc, CardSecondState>(
                            builder: (context, state) {
                              return CustomTextFormField(
                                maxLines: 2,
                                suffixIcon: state.locationFetchLoading
                                    ? const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: CircularProgressIndicator(
                                          color: neonShade,
                                        ),
                                      )
                                    : null,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                // validate: Validate.notNull,
                                labelText: 'Location',
                                controller: context
                                    .read<CardSecondBloc>()
                                    .locatioNController,
                                inputType: TextInputType.name,
                              );
                            },
                          ),
                          CustomTextFormField(
                            textCapitalization: TextCapitalization.words,
                            // validate: Validate.notNull,
                            labelText: 'Occupation',
                            controller: context
                                .read<CardSecondBloc>()
                                .occupationController,
                            inputType: TextInputType.name,
                          ),
                          CustomTextFormField(
                            textCapitalization: TextCapitalization.sentences,
                            // validate: Validate.notNull,
                            maxLines: 3,
                            labelText: 'Notes',
                            controller:
                                context.read<CardSecondBloc>().notesController,
                            inputType: TextInputType.name,
                          ),
                          adjustHieght(khieght * .02),
                          state.isLoading
                              ? const LoadingAnimation()
                              : LastSkipContinueButtons(onTap: () {
                                  FocusScope.of(context).unfocus();
                                  context.read<CardSecondBloc>().add(
                                        CardSecondEvent.meetingRelatedInfo(
                                          selfieImage: state.selfieImageModel,
                                          occation: context
                                              .read<CardSecondBloc>()
                                              .occationController
                                              .text,
                                          location: context
                                              .read<CardSecondBloc>()
                                              .locatioNController
                                              .text,
                                          occupation: context
                                              .read<CardSecondBloc>()
                                              .occupationController
                                              .text,
                                          notes: context
                                              .read<CardSecondBloc>()
                                              .notesController
                                              .text,
                                        ),
                                      );
                                }),
                          adjustHieght(khieght * .02),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
