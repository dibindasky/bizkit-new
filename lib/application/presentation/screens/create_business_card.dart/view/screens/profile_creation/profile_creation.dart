import 'dart:convert';

import 'package:bizkit/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/application/business_logic/card/create/user_data/user_data_bloc.dart';
import 'package:bizkit/application/presentation/routes/routes.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/application/presentation/utils/show_dialogue/show_dailogue.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:bizkit/application/presentation/utils/text_field/auto_fill_text_field.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/last_skip_and_continue.dart';
import 'package:bizkit/domain/model/card/card/image_card/image_card.dart';
import 'package:bizkit/domain/model/card_first/creation/card_first_creation_model/card_first_creation_model.dart';
import 'package:bizkit/domain/model/extracted_text_model/extracted_text_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileCreationScreen extends StatefulWidget {
  const ProfileCreationScreen({super.key});

  @override
  State<ProfileCreationScreen> createState() => _ProfileCreationScreenState();
}

class _ProfileCreationScreenState extends State<ProfileCreationScreen> {
  final GlobalKey<FormState> personalDataFirstFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final khieght = size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: kwhite,
        ),
        backgroundColor: knill,
        title: Text(
          'Make a Bizkit Card',
          style: textHeadStyle1,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: Column(
              children: [
                adjustHieght(khieght * .03),
                // pick user photo
                BlocBuilder<UserDataBloc, UserDataState>(
                  builder: (context, state) {
                    return Stack(
                      children: [
                        state.userPhotos == null
                            ? const CircleAvatar(
                                radius: 70,
                                backgroundColor: kblack,
                                backgroundImage: AssetImage(
                                  'asset/images/profileCircle.png',
                                ),
                              )
                            : CircleAvatar(
                                radius: 70,
                                backgroundColor: kblack,
                                backgroundImage: MemoryImage(base64.decode(
                                    getBase64(state.userPhotos![0].photo))),
                              ),
                        Positioned(
                          bottom: 17,
                          right: 3,
                          child: InkWell(
                            onTap: () {
                              if (state.userPhotos != null) {
                                showCustomConfirmationDialogue(
                                    context: context,
                                    title: 'Remove profile image ?',
                                    buttonText: 'Remove',
                                    onTap: () {
                                      context
                                          .read<UserDataBloc>()
                                          .add(UserDataEvent.removeUserPhoto());
                                    });
                              } else {
                                cameraAndGalleryPickImage(
                                    context: context,
                                    onPressCam: () {
                                      context.read<UserDataBloc>().add(
                                          UserDataEvent.pickUserPhotos(
                                              cam: true));
                                    },
                                    onPressGallery: () {
                                      context.read<UserDataBloc>().add(
                                          UserDataEvent.pickUserPhotos(
                                              cam: false));
                                    });
                              }
                            },
                            child: CircleAvatar(
                              radius: 13,
                              child: Icon(state.userPhotos != null
                                  ? Icons.close
                                  : Icons.add),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                adjustHieght(khieght * .04),
                // user data form
                BlocBuilder<UserDataBloc, UserDataState>(
                  builder: (context, state) {
                    return Form(
                      key: personalDataFirstFormKey,
                      child: Column(
                        children: [
                          // personal name field
                          AutocompleteTextField(
                            validate: Validate.notNull,
                            label: 'Name *',
                            controller:
                                context.read<UserDataBloc>().nameController,
                            inputType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            autocompleteItems:
                                state.scannedImageDatasModel?.names ?? [],
                          ),
                          // personal phone number
                          AutocompleteTextField(
                            validate: Validate.phone,
                            maxLength: 10,
                            label: 'Phone Number *',
                            controller:
                                context.read<UserDataBloc>().phoneController,
                            inputType: TextInputType.phone,
                            autocompleteItems:
                                state.scannedImageDatasModel?.phone ?? [],
                          ),
                          // personal email
                          AutocompleteTextField(
                            validate: Validate.email,
                            label: 'Email *',
                            controller:
                                context.read<UserDataBloc>().emailController,
                            inputType: TextInputType.emailAddress,
                            autocompleteItems:
                                state.scannedImageDatasModel?.emails ?? [],
                          ),
                          // business category
                          AutocompleteTextField(
                              onTap: () =>
                                  FocusManager.instance.primaryFocus?.unfocus(),
                              enabled: false,
                              validate: Validate.notNull,
                              label: 'Business Category *',
                              controller: context
                                  .read<UserDataBloc>()
                                  .businessCategoryController,
                              // inputType: TextInputType.name,
                              autocompleteItems: state.businessCategories
                                  .map((e) => e.category!)
                                  .toList()),
                          AutocompleteTextField(
                            showDropdownOnTap: true,
                            validate: Validate.notNull,
                            label: 'Designation *',
                            textCapitalization: TextCapitalization.words,
                            controller: context
                                .read<UserDataBloc>()
                                .designationController,
                            autocompleteItems:
                                state.scannedImageDatasModel?.designations ??
                                    <String>[],
                          ),
                          adjustHieght(khieght * .05),
                        ],
                      ),
                    );
                  },
                ),
                BlocConsumer<UserDataBloc, UserDataState>(
                  listener: (context, state) {
                    if (state.message != null) {
                      showSnackbar(context,
                          message: state.message!,
                          backgroundColor: state.hasError ? kred : neonShade);
                    }
                    if (state.cardAdded) {
                      context
                          .read<CardBloc>()
                          .add(const CardEvent.getCards(call: true));
                      // if (state.isBusiness) {
                      //   context.go(Routes.homePage);
                      //   Navigator.of(context)
                      //       .pushNamed(Routes.linerarProgressBar);
                      // } else {
                      // context.go(Routes.homePage);
                      while (GoRouter.of(context).canPop()) {
                        GoRouter.of(context).pop();
                      }
                      context.go(Routes.homePage);
                      // Navigator.pushNamedAndRemoveUntil(
                      //     context, Routes.homePage, (route) => false);
                      context.read<UserDataBloc>().add(UserDataEvent.clear());
                      // }
                    }
                  },
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const LoadingAnimation();
                    }
                    return LastSkipContinueButtons(
                      continueText: 'Create Card',
                      onTap: () {
                        if (personalDataFirstFormKey.currentState!.validate()) {
                          context.read<UserDataBloc>().add(UserDataEvent.createCard(
                              cardFirstCreationModel: CardFirstCreationModel(
                                  cardJson: state.scannedImageDatasModel == null
                                      ? null
                                      : ExtractedTextModel(
                                          designations: state
                                              .scannedImageDatasModel
                                              ?.designations,
                                          emails: state
                                              .scannedImageDatasModel?.emails,
                                          names: state
                                              .scannedImageDatasModel?.names,
                                          phoneNumbers: state
                                              .scannedImageDatasModel?.phone,
                                          websites: state.scannedImageDatasModel
                                              ?.websites),
                                  cardImage: state.scannedImagesCardCreation
                                      .map((e) => ImageCard(image: e.base64))
                                      .toList(),
                                  name: context
                                      .read<UserDataBloc>()
                                      .nameController
                                      .text
                                      .trim(),
                                  designation: context.read<UserDataBloc>().designationController.text.trim(),
                                  phoneNumber: context.read<UserDataBloc>().phoneController.text.trim(),
                                  email: context.read<UserDataBloc>().emailController.text.trim(),
                                  photos: state.userPhotos ?? [],
                                  businessCategoryId: state.businessCategories.firstWhere((element) => element.category == context.read<UserDataBloc>().businessCategoryController.text.trim()).id)));
                        }
                      },
                    );
                  },
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
