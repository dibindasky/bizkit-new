import 'dart:convert';
import 'dart:developer';
import 'package:bizkit/application/business_logic/card_second/card_second_bloc.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/last_skip_and_continue.dart';
import 'package:bizkit/application/presentation/screens/selfie_card/selfie_screen.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/show_dialogue/show_dailogue.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/domain/model/card_second/gate_all_card_second_model/second_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondCardUpdation extends StatefulWidget {
  const SecondCardUpdation({super.key, required this.secondCard});
  final SecondCard secondCard;

  @override
  State<SecondCardUpdation> createState() => _SecondCardUpdationState();
}

class _SecondCardUpdationState extends State<SecondCardUpdation> {
  String? base64imageSelfie;
  String? base64imagecard;
  @override
  void initState() {
    if (widget.secondCard.selfie != null) {
      base64imageSelfie = widget.secondCard.selfie ?? "";
      base64imageSelfie = base64imageSelfie!
          .replaceFirst(RegExp(r'data:image/jpg;base64,'), '');
    }
    if (widget.secondCard.image != null) {
      base64imagecard = widget.secondCard.image ?? "";
      base64imagecard =
          base64imagecard!.replaceFirst(RegExp(r'data:image/jpg;base64,'), '');
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
    log('id ${widget.secondCard.id}');
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
            icon: const Icon(Icons.keyboard_arrow_left_outlined),
          ),
          title: const Text(
            'Update selfie connection',
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
              // GoRouter.of(context).pushNamed(
              //   Routes.homePage,
              // );
              // Navigator.of(context).pushAndRemoveUntil(
              //     fadePageRoute(const BizkitBottomNavigationBar()),
              //     (route) => false);
              showSnackbar(context, message: 'Card updated Successfully');
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  adjustHieght(20),
                  const Text('Scanned card image'),
                  adjustHieght(20),
                  state.scannedImagesSecondCardCreation.isNotEmpty
                      ? Stack(
                          children: [
                            Container(
                              height: kwidth * 0.60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: FileImage(
                                      state.scannedImagesSecondCardCreation.last
                                          .fileImage,
                                    ),
                                    fit: BoxFit.fitWidth),
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
                                              const CardSecondEvent.scanImage(
                                                  isCam: true));
                                        },
                                        onPressGallery: () {
                                          context.read<CardSecondBloc>().add(
                                              const CardSecondEvent.scanImage(
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
                        )
                      : Stack(
                          children: [
                            SizedBox(
                              height: kwidth * 0.60,
                              width: double.infinity,
                              child: Image.memory(
                                base64.decode(
                                    base64imagecard!.startsWith('data')
                                        ? base64imagecard!.substring(22)
                                        : base64imagecard!),
                                fit: BoxFit.cover,
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
                                              const CardSecondEvent.scanImage(
                                                  isCam: true));
                                        },
                                        onPressGallery: () {
                                          context.read<CardSecondBloc>().add(
                                              const CardSecondEvent.scanImage(
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
                  adjustHieght(20),
                  widget.secondCard.selfie != null
                      ? const Text('Selfie Image')
                      : const SizedBox(),
                  adjustHieght(20),
                  state.selfieImageModel != null
                      ? Stack(
                          children: [
                            SizedBox(
                              height: kwidth * 0.60,
                              width: double.infinity,
                              child: Image.file(
                                state.selfieImageModel!.fileImage,
                                fit: BoxFit.cover,
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
                                      context.read<CardSecondBloc>().add(
                                              const CardSecondEvent.selfieImage(
                                            isCam: true,
                                            cameraDeviceFront: true,
                                          ));
                                    },
                                    icon: const Icon(
                                      size: 30,
                                      color: kwhite,
                                      Icons.camera,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : widget.secondCard.selfie != null
                          ? Stack(
                              children: [
                                SizedBox(
                                  height: kwidth * 0.60,
                                  width: double.infinity,
                                  child: Image.memory(
                                    base64.decode(
                                        base64imageSelfie!.startsWith('data')
                                            ? base64imageSelfie!.substring(22)
                                            : base64imageSelfie!),
                                    fit: BoxFit.cover,
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
                                              context
                                                  .read<CardSecondBloc>()
                                                  .add(const CardSecondEvent
                                                      .selfieImage(
                                                    isCam: true,
                                                    cameraDeviceFront: true,
                                                  ));
                                            },
                                            onPressGallery: () {
                                              context
                                                  .read<CardSecondBloc>()
                                                  .add(const CardSecondEvent
                                                      .selfieImage(
                                                    isCam: false,
                                                    cameraDeviceFront: false,
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
                                ),
                              ],
                            )
                          : ContainerPickImage(
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
                            ),
                  // Show container to pick image
                  Form(
                    key: context.read<CardSecondBloc>().cardUpdateKey,
                    child: Column(
                      children: [
                        adjustHieght(khieght * 0.008),
                        TTextFormField(
                          validate: Validate.notNull,
                          text: 'Name',
                          controller: context
                              .read<CardSecondBloc>()
                              .updateNameController,
                          inputType: TextInputType.name,
                        ),
                        TTextFormField(
                          validate: Validate.notNull,
                          text: 'Company',
                          controller: context
                              .read<CardSecondBloc>()
                              .updateCompanyController,
                          inputType: TextInputType.name,
                        ),
                        TTextFormField(
                          validate: Validate.notNull,
                          text: 'Email',
                          controller: context
                              .read<CardSecondBloc>()
                              .updateEmailController,
                          inputType: TextInputType.emailAddress,
                        ),
                        TTextFormField(
                          validate: Validate.notNull,
                          text: 'Phone number',
                          controller: context
                              .read<CardSecondBloc>()
                              .updatephoneController,
                          inputType: TextInputType.number,
                        ),
                        TTextFormField(
                          validate: Validate.notNull,
                          text: 'website',
                          controller: context
                              .read<CardSecondBloc>()
                              .updatewebSiteController,
                          inputType: TextInputType.emailAddress,
                        ),
                        TTextFormField(
                          validate: Validate.notNull,
                          text: 'Designation',
                          controller: context
                              .read<CardSecondBloc>()
                              .updatedesignationController,
                          inputType: TextInputType.name,
                        ),
                        // AutocompleteTextField(
                        //   autocompleteItems:
                        //       state.scannedImageDatasModel?.names ?? [],
                        //   validate: Validate.notNull,
                        //   label: 'Company',
                        //   controller: context
                        //       .read<CardSecondBloc>()
                        //       .updateCompanyController,
                        //   inputType: TextInputType.name,
                        // ),
                        TTextFormField(
                          validate: Validate.notNull,
                          text: 'Location',
                          controller: context
                              .read<CardSecondBloc>()
                              .updatelocatioNController,
                          inputType: TextInputType.name,
                        ),
                        TTextFormField(
                          validate: Validate.notNull,
                          text: 'Occation',
                          controller: context
                              .read<CardSecondBloc>()
                              .updateoccationController,
                          inputType: TextInputType.name,
                        ),
                        TTextFormField(
                          validate: Validate.notNull,
                          text: 'Occupation',
                          controller: context
                              .read<CardSecondBloc>()
                              .updateoccupationController,
                          inputType: TextInputType.name,
                        ),

                        TTextFormField(
                          validate: Validate.notNull,
                          text: 'Notes',
                          controller: context
                              .read<CardSecondBloc>()
                              .updatenotesController,
                          inputType: TextInputType.name,
                        ),
                        adjustHieght(20),
                        !state.isLoading
                            ? LastSkipContinueButtons(
                                continueText: 'Save',
                                onTap: () {
                                  if (context
                                      .read<CardSecondBloc>()
                                      .cardUpdateKey
                                      .currentState!
                                      .validate()) {
                                    SecondCard secondCard = SecondCard(
                                      whereWeMet: context
                                          .read<CardSecondBloc>()
                                          .occationController
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
                                      selfie: state.selfieImageModel != null
                                          ? state.selfieImageModel!.base64
                                          : widget.secondCard.selfie,
                                    );
                                    context.read<CardSecondBloc>().add(
                                          CardSecondEvent.updateCardSecond(
                                            secondCard: secondCard,
                                            id: widget.secondCard.id.toString(),
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
            );
          },
        ),
      ),
    );
  }
}
