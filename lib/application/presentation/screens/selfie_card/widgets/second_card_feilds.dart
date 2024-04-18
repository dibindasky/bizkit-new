import 'dart:developer';
import 'package:bizkit/application/business_logic/card_second/card_second_bloc.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/last_skip_and_continue.dart';
import 'package:bizkit/application/presentation/screens/selfie_card/selfie_screen.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/show_dialogue/show_dailogue.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:bizkit/application/presentation/utils/text_field/auto_fill_text_field.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardSecondScannedDatas extends StatelessWidget {
  CardSecondScannedDatas({super.key});
  final GlobalKey<FormState> autoFillDataKey = GlobalKey<FormState>();
  final String emptyData = '';
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
          leading: adjustWidth(0),
          title: const Text(
            'Make Selfie Card',
            style: TextStyle(
              fontFamily: 'Euclid',
              fontWeight: FontWeight.bold,
              color: kwhite,
            ),
          ),
          backgroundColor: knill,
        ),
        body: BlocBuilder<CardSecondBloc, CardSecondState>(
          builder: (context, state) {
            return ListView(
              children: [
                Container(
                  height: kwidth * 0.60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: FileImage(
                          state.scannedImagesSecondCardCreation.first.fileImage,
                        ),
                        fit: BoxFit.cover),
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
                            inputType: TextInputType.name),
                        AutocompleteTextField(
                          textCapitalization: TextCapitalization.words,
                          autocompleteItems:
                              state.scannedImageDatasModel?.names ?? [],
                          validate: Validate.notNull,
                          label: 'Company',
                          controller:
                              context.read<CardSecondBloc>().copanyController,
                          inputType: TextInputType.emailAddress,
                        ),
                        AutocompleteTextField(
                          textCapitalization: TextCapitalization.words,
                          autocompleteItems:
                              state.scannedImageDatasModel?.emails ?? [],
                          validate: Validate.email,
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
                          validate: Validate.phone,
                          label: 'Phone number',
                          controller:
                              context.read<CardSecondBloc>().phoneController,
                          inputType: TextInputType.number,
                        ),
                        AutocompleteTextField(
                          textCapitalization: TextCapitalization.words,
                          autocompleteItems:
                              state.scannedImageDatasModel?.websites ?? [],
                          validate: Validate.website,
                          label: 'Website',
                          controller:
                              context.read<CardSecondBloc>().webSiteController,
                          inputType: TextInputType.url,
                        ),
                        AutocompleteTextField(
                          textCapitalization: TextCapitalization.words,
                          autocompleteItems:
                              state.scannedImageDatasModel?.names ?? [],
                          validate: Validate.notNull,
                          label: 'Designation',
                          controller: context
                              .read<CardSecondBloc>()
                              .designationController,
                          inputType: TextInputType.name,
                        ),
                        adjustHieght(khieght * .02),
                        LastSkipContinueButtons(
                          onTap: () {
                            if (autoFillDataKey.currentState!.validate()) {
                              context
                                  .read<CardSecondBloc>()
                                  .add(CardSecondEvent.autoFillTExtfieldItems(
                                    name: context
                                        .read<CardSecondBloc>()
                                        .nameController
                                        .text,
                                    scannedImage: state
                                        .scannedImagesSecondCardCreation
                                        .first
                                        .base64,
                                    email: context
                                            .read<CardSecondBloc>()
                                            .emailController
                                            .text
                                            .isEmpty
                                        ? emptyData
                                        : context
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
                                            .text
                                            .isEmpty
                                        ? emptyData
                                        : context
                                            .read<CardSecondBloc>()
                                            .phoneController
                                            .text,
                                    website: context
                                            .read<CardSecondBloc>()
                                            .webSiteController
                                            .text
                                            .isEmpty
                                        ? emptyData
                                        : context
                                            .read<CardSecondBloc>()
                                            .webSiteController
                                            .text,
                                    designation: context
                                            .read<CardSecondBloc>()
                                            .designationController
                                            .text
                                            .isEmpty
                                        ? emptyData
                                        : context
                                            .read<CardSecondBloc>()
                                            .designationController
                                            .text,
                                  ));
                              log('before navigating to selfie screen');
                              Navigator.of(context).push(
                                fadePageRoute(const SelfieTextFields()),
                              );
                            }
                          },
                        ),
                        adjustHieght(20)
                      ],
                    ),
                  ),
                )
              ],
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
          leading: adjustWidth(0),
          title: const Text(
            'Make QR Card',
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
              Navigator.pop(context);
              context
                  .read<CardSecondBloc>()
                  .add(const CardSecondEvent.cardFeildClearing());
              // Navigator.of(context).pushAndRemoveUntil(
              //     fadePageRoute(
              //       const BizkitBottomNavigationBar(),
              //     ),
              //     (route) => false);
              // GoRouter.of(context).pushReplacementNamed(Routes.homePage);
              showSnackbar(context, message: 'Card created successfully');
            }
          },
          builder: (context, state) {
            return ListView(
              children: [
                state.selfieImageModel == null
                    ? ContainerPickImage(
                        onPressedGallery: () =>
                            context.read<CardSecondBloc>().add(
                                  const CardSecondEvent.selfieImage(
                                    isCam: false,
                                    cameraDeviceFront: false,
                                  ),
                                ),
                        onPressedCam: () => context.read<CardSecondBloc>().add(
                              const CardSecondEvent.selfieImage(
                                isCam: true,
                                cameraDeviceFront: true,
                              ),
                            ),
                        heading: 'Take Selfie',
                      )
                    : Stack(
                        children: [
                          Container(
                            height: kwidth * 0.60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: FileImage(
                                    state.selfieImageModel!.fileImage),
                                fit: BoxFit.cover,
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
                                    customDailogue(
                                      context: context,
                                      onPressCam: () {
                                        context.read<CardSecondBloc>().add(
                                            const CardSecondEvent.selfieImage(
                                                cameraDeviceFront: true,
                                                isCam: true));
                                      },
                                      onPressGallery: () {
                                        context.read<CardSecondBloc>().add(
                                            const CardSecondEvent.selfieImage(
                                                cameraDeviceFront: false,
                                                isCam: false));
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
                      ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Form(
                    key: meetingDataKey,
                    child: Column(
                      children: [
                        adjustHieght(khieght * 0.008),
                        TTextFormField(
                          textCapitalization: TextCapitalization.words,
                          validate: Validate.notNull,
                          text: 'Occasion',
                          controller:
                              context.read<CardSecondBloc>().occationController,
                          inputType: TextInputType.name,
                        ),
                        TTextFormField(
                          textCapitalization: TextCapitalization.words,
                          validate: Validate.notNull,
                          text: 'Location',
                          controller:
                              context.read<CardSecondBloc>().locatioNController,
                          inputType: TextInputType.name,
                        ),
                        TTextFormField(
                          textCapitalization: TextCapitalization.words,
                          validate: Validate.notNull,
                          text: 'Occupation',
                          controller: context
                              .read<CardSecondBloc>()
                              .occupationController,
                          inputType: TextInputType.name,
                        ),
                        TTextFormField(
                          textCapitalization: TextCapitalization.words,
                          validate: Validate.notNull,
                          maxLines: 3,
                          text: 'Notes',
                          controller:
                              context.read<CardSecondBloc>().notesController,
                          inputType: TextInputType.name,
                        ),
                        adjustHieght(khieght * .02),
                        state.isLoading
                            ? const LoadingAnimation()
                            : LastSkipContinueButtons(
                                onTap: () {
                                  if (meetingDataKey.currentState!.validate()) {
                                    context
                                        .read<CardSecondBloc>()
                                        .add(CardSecondEvent.meetingRelatedInfo(
                                          selfieImage:
                                              state.selfieImageModel?.base64 ??
                                                  '',
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
                                        ));
                                  }
                                },
                              ),
                        adjustHieght(khieght * .02),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
