import 'package:bizkit/application/business_logic/card_second/card_second_bloc.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/routes/routes.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/last_skip_and_continue.dart';
import 'package:bizkit/application/presentation/screens/selfie_card/selfie_screen.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:bizkit/application/presentation/utils/text_field/auto_fill_text_field.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CardSecondScannedDatas extends StatelessWidget {
  const CardSecondScannedDatas({super.key});

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
            'Make a Bizkit Card',
            style: TextStyle(
                fontFamily: 'Euclid',
                fontWeight: FontWeight.bold,
                color: kwhite),
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
                            state.scannedImagesSecondCardCreation.first
                                .fileImage,
                          ),
                          fit: BoxFit.cover)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Form(
                    key: context.read<CardSecondBloc>().autoFillDataKey,
                    child: Column(
                      children: [
                        adjustHieght(khieght * 0.008),
                        AutocompleteTextField(
                            autocompleteItems:
                                state.scannedImageDatasModel?.names ?? [],
                            validate: Validate.notNull,
                            label: 'Name',
                            controller:
                                context.read<CardSecondBloc>().nameController,
                            inputType: TextInputType.name),
                        AutocompleteTextField(
                          autocompleteItems:
                              state.scannedImageDatasModel?.names ?? [],
                          validate: Validate.notNull,
                          label: 'Company',
                          controller:
                              context.read<CardSecondBloc>().copanyController,
                          inputType: TextInputType.emailAddress,
                        ),
                        AutocompleteTextField(
                            autocompleteItems:
                                state.scannedImageDatasModel?.emails ?? [],
                            validate: Validate.email,
                            label: 'Email',
                            controller:
                                context.read<CardSecondBloc>().emailController,
                            inputType: TextInputType.emailAddress),
                        AutocompleteTextField(
                            maxLength: 10,
                            autocompleteItems:
                                state.scannedImageDatasModel?.phone ?? [],
                            validate: Validate.phone,
                            label: 'Phone number',
                            controller:
                                context.read<CardSecondBloc>().phoneController,
                            inputType: TextInputType.number),
                        AutocompleteTextField(
                          autocompleteItems:
                              state.scannedImageDatasModel?.websites ?? [],
                          validate: Validate.website,
                          label: 'Website',
                          controller:
                              context.read<CardSecondBloc>().webSiteController,
                          inputType: TextInputType.url,
                        ),
                        AutocompleteTextField(
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
                            if (context
                                .read<CardSecondBloc>()
                                .autoFillDataKey
                                .currentState!
                                .validate()) {
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
                              Navigator.of(context).push(
                                  fadePageRoute(const SelfieTextFields()));
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
            'Make a Bizkit Card',
            style: TextStyle(
                fontFamily: 'Euclid',
                fontWeight: FontWeight.bold,
                color: kwhite),
          ),
          backgroundColor: knill,
        ),
        body: BlocConsumer<CardSecondBloc, CardSecondState>(
          listener: (context, state) {
            if (state.cardSecondResponseModel != null) {
              GoRouter.of(context).pushReplacement(
                Routes.homePage,
              );
              showSnackbar(context, message: 'Qr Card created successfully');
            }
          },
          builder: (context, state) {
            return ListView(
              children: [
                state.selfieImageModel == null
                    ? ContainerPickImage(
                        onPressed: () => context.read<CardSecondBloc>().add(
                              const CardSecondEvent.selfieImage(
                                cameraDeviceFront: true,
                              ),
                            ),
                        isBoth: false,
                        heading: 'Take Selfie',
                      )
                    : Container(
                        height: kwidth * 0.60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FileImage(state.selfieImageModel!.fileImage),
                            fit: BoxFit.cover,
                          ),
                        ),
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
                            validate: Validate.notNull,
                            text: 'Occation',
                            controller: context
                                .read<CardSecondBloc>()
                                .occationController,
                            inputType: TextInputType.name),
                        TTextFormField(
                            validate: Validate.notNull,
                            text: 'Location',
                            controller: context
                                .read<CardSecondBloc>()
                                .locatioNController,
                            inputType: TextInputType.name),
                        TTextFormField(
                            validate: Validate.notNull,
                            text: 'Occupation',
                            controller: context
                                .read<CardSecondBloc>()
                                .occupationController,
                            inputType: TextInputType.name),

                        TTextFormField(
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

                                    context.read<CardSecondBloc>().add(
                                          const CardSecondEvent
                                              .secondCardCreation(),
                                        );
                                  }
                                },
                              ),
                        // const CustomButtonSelfie(
                        //   navigate:
                        //       HomeFirstViewAllContactTileDetailView(userId: null),
                        // ), //should give next navigation here i add SelfieScreen For demo
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
