import 'dart:developer';
import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/module/biz_card/application/business_logic/card_second/card_second_bloc.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/create_card/view/widgets/last_skip_and_continue.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/visiting_cards/visiting_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/widgets/image_slidable_list.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/utils/show_dialogue/show_dailogue.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:bizkit/utils/text_field/auto_fill_text_field.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/module/biz_card/domain/model/contact/add_new_contact/add_new_contact.dart';
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 250,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return adjustWidth(10);
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SlidablePhotoGallery(
                              images: [],
                              initialIndex: 2,
                            ),
                          ),
                        );
                      },
                      child: SizedBox(
                        height: 250,
                        width: kwidth,
                        child: Image.asset(
                          personImage,
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
                      const AutocompleteTextField(
                        textCapitalization: TextCapitalization.words,
                        autocompleteItems: [],
                        validate: Validate.notNull,
                        label: 'Name',
                        // controller:
                        //  context.read<CardSecondBloc>().nameController,
                        inputType: TextInputType.name,
                      ),
                      const AutocompleteTextField(
                        textCapitalization: TextCapitalization.words,
                        autocompleteItems: [],
                        // validate: Validate.notNull,
                        label: 'Company',
                        // controller:
                        //  context.read<CardSecondBloc>().copanyController,
                        inputType: TextInputType.emailAddress,
                      ),
                      const AutocompleteTextField(
                        //textCapitalization: TextCapitalization.words,
                        autocompleteItems: [],
                        validate: Validate.ifValidEmail,
                        label: 'Email',
                        // controller:
                        // context.read<CardSecondBloc>().emailController,
                        inputType: TextInputType.emailAddress,
                      ),
                      const AutocompleteTextField(
                        textCapitalization: TextCapitalization.words,
                        maxLength: 10,
                        autocompleteItems: [],
                        validate: Validate.ifValidnumber,
                        label: 'Phone Number',
                        // controller:
                        // context.read<CardSecondBloc>().phoneController,
                        inputType: TextInputType.number,
                      ),
                      const AutocompleteTextField(
                        autocompleteItems: [],
                        validate: Validate.ifValidWebsite,
                        label: 'Website',
                        // controller:
                        // context.read<CardSecondBloc>().webSiteController,
                        inputType: TextInputType.url,
                      ),
                      const AutocompleteTextField(
                        textCapitalization: TextCapitalization.words,
                        autocompleteItems: [],
                        // validate: Validate.notNull,
                        label: 'Designation',
                        // controller: context
                        // .read<CardSecondBloc>()
                        // .designationController,
                        inputType: TextInputType.name,
                      ),
                      adjustHieght(khieght * .02),
                      CardLastSkipContinueButtons(
                        onTap: () {
                          if (autoFillDataKey.currentState!.validate()) {
                            FocusScope.of(context).unfocus();
                            Navigator.of(context).push(
                              cardFadePageRoute(const SelfieTextFields()),
                            );
                            // Contact save
                            // AddNewContact addNewContact = AddNewContact(
                            //   name: context
                            //       .read<CardSecondBloc>()
                            //       .nameController
                            //       .text,
                            //   email: context
                            //       .read<CardSecondBloc>()
                            //       .emailController
                            //       .text,
                            //   phoneNumber: context
                            //       .read<CardSecondBloc>()
                            //       .phoneController
                            //       .text,
                            //   companyName: context
                            //       .read<CardSecondBloc>()
                            //       .copanyController
                            //       .text,
                            // );
                            // context.read<CardSecondBloc>().add(
                            //     CardSecondEvent.contactSaveToPhone(
                            //         addNewContact: addNewContact));

                            // context.read<CardSecondBloc>().add(
                            //         CardSecondEvent
                            //             .autoFillTExtfieldItems(
                            //       name: context
                            //           .read<CardSecondBloc>()
                            //           .nameController
                            //           .text,
                            //       scannedImage: state
                            //               .scannedImagesSecondCardCreation
                            //               .isNotEmpty
                            //           ? state
                            //               .scannedImagesSecondCardCreation
                            //               .first
                            //               .base64
                            //           : '',
                            //       email: context
                            //           .read<CardSecondBloc>()
                            //           .emailController
                            //           .text,
                            //       company: context
                            //           .read<CardSecondBloc>()
                            //           .copanyController
                            //           .text,
                            //       number: context
                            //           .read<CardSecondBloc>()
                            //           .phoneController
                            //           .text,
                            //       website: context
                            //           .read<CardSecondBloc>()
                            //           .webSiteController
                            //           .text,
                            //       designation: context
                            //           .read<CardSecondBloc>()
                            //           .designationController
                            //           .text,
                            //     ));

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
    // context.read<CardSecondBloc>().add(const CardSecondEvent.locationGeting());
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              ContainerPickImage(
                fromMain: false,
                onPressedGallery: () {},
                // context.read<CardSecondBloc>().add(
                //       const CardSecondEvent.selfieImage(
                //         isCam: false,
                //         cameraDeviceFront: false,
                //       ),
                //    ),
                onPressedCam: () {},
                // context.read<CardSecondBloc>().add(
                //       const CardSecondEvent.selfieImage(
                //         isCam: true,
                //         cameraDeviceFront: true,
                //       ),
                //     ),
                heading: 'Take Selfie',
              ),
              Stack(
                children: [
                  SizedBox(
                    height: 250,
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return adjustWidth(10);
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        // final selfiImages = state.selfieImageModel[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SlidablePhotoGallery(
                                  images: const [],
                                  initialIndex: index,
                                ),
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              Container(
                                height: 250,
                                width: kwidth,
                                decoration: const BoxDecoration(
                                    //image: DecorationImage(
                                    // image: FileImage(selfiImages.fileImage),
                                    // fit: BoxFit.cover,
                                    //),
                                    ),
                              ),
                              Positioned(
                                bottom: 70,
                                right: 10,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
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
                                            // context.read<CardSecondBloc>().add(
                                            //     CardSecondEvent
                                            //         .selfieimageClear(
                                            //             index: index - 1));
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
                                  // context.read<CardSecondBloc>().add(
                                  //       const CardSecondEvent
                                  //           .selfieImage(
                                  //         isCam: true,
                                  //         cameraDeviceFront: true,
                                  //       ),
                                  //     );
                                },
                                onPressGallery: () {
                                  // context.read<CardSecondBloc>().add(
                                  //       const CardSecondEvent
                                  //           .selfieImage(
                                  //         isCam: false,
                                  //         cameraDeviceFront: false,
                                  //       ),
                                  //     );
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
                      const CustomTextFormField(
                        textCapitalization: TextCapitalization.words,
                        // validate: Validate.notNull,
                        labelText: 'Occasion',
                        // controller: context
                        // .read<CardSecondBloc>()
                        // .occationController,
                        inputType: TextInputType.name,
                      ),
                      const CustomTextFormField(
                        maxLines: 2,
                        suffixIcon: null,
                        textCapitalization: TextCapitalization.sentences,
                        // validate: Validate.notNull,
                        labelText: 'Location',

                        inputType: TextInputType.name,
                      ),
                      const CustomTextFormField(
                        textCapitalization: TextCapitalization.words,
                        // validate: Validate.notNull,
                        labelText: 'Occupation',
                        // controller: context
                        //     .read<CardSecondBloc>()
                        //     .occupationController,
                        inputType: TextInputType.name,
                      ),
                      const CustomTextFormField(
                        textCapitalization: TextCapitalization.sentences,
                        // validate: Validate.notNull,
                        maxLines: 3,
                        labelText: 'Notes',
                        // controller:
                        //     context.read<CardSecondBloc>().notesController,
                        inputType: TextInputType.name,
                      ),
                      adjustHieght(khieght * .02),
                      CardLastSkipContinueButtons(onTap: () {
                        FocusScope.of(context).unfocus();
                        // context.read<CardSecondBloc>().add(
                        //       CardSecondEvent.meetingRelatedInfo(
                        //         selfieImage: state.selfieImageModel,
                        //         occation: context
                        //             .read<CardSecondBloc>()
                        //             .occationController
                        //             .text,
                        //         location: context
                        //             .read<CardSecondBloc>()
                        //             .locatioNController
                        //             .text,
                        //         occupation: context
                        //             .read<CardSecondBloc>()
                        //             .occupationController
                        //             .text,
                        //         notes: context
                        //             .read<CardSecondBloc>()
                        //             .notesController
                        //             .text,
                        //       ),
                        //     );
                      }),
                      adjustHieght(khieght * .02),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
