import 'dart:convert';
import 'dart:developer';

import 'package:bizkit/application/business_logic/card_second/card_second_bloc.dart';
import 'package:bizkit/application/presentation/routes/routes.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/last_skip_and_continue.dart';
import 'package:bizkit/application/presentation/screens/selfie_card/selfie_screen.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/text_field/auto_fill_text_field.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/domain/model/card_second/gate_all_card_second_model/second_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SecondCardUpdation extends StatefulWidget {
  const SecondCardUpdation({super.key, required this.secondCard});
  final SecondCard secondCard;

  @override
  State<SecondCardUpdation> createState() => _SecondCardUpdationState();
}

class _SecondCardUpdationState extends State<SecondCardUpdation> {
  String? base64image;
  @override
  void initState() {
    if (widget.secondCard.selfie != null) {
      base64image = widget.secondCard.selfie ?? "";
      base64image =
          base64image!.replaceFirst(RegExp(r'data:image/jpg;base64,'), '');
      //log('widget.secondCard.selfie ${widget.secondCard.selfie}');
    }
    context.read<CardSecondBloc>().updateNameController.text =
        widget.secondCard.name!;
    context.read<CardSecondBloc>().updateCompanyController.text =
        widget.secondCard.company!;
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
              context.read<CardSecondBloc>().state.selfieImageModel == null;
              Navigator.pop(context);
            },
            icon: const Icon(Icons.keyboard_arrow_left_outlined),
          ),
          title: const Text(
            'Update QR Connections',
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
              state.selfieImageModel == null;
              GoRouter.of(context).pushNamed(
                Routes.cardListing,
              );
              // Navigator.of(context).pop();
            }
          },
          builder: (context, state) {
            return ListView(
              children: [
                widget.secondCard.selfie != null
                    ? Stack(
                        children: [
                          SizedBox(
                            height: kwidth * 0.60,
                            width: double.infinity,
                            child: Image.memory(
                              base64.decode(base64image!.startsWith('data')
                                  ? base64image!.substring(22)
                                  : base64image!),
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
                                    context
                                        .read<CardSecondBloc>()
                                        .add(const CardSecondEvent.selfieImage(
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
                    : state.selfieImageModel != null
                        ? SizedBox(
                            height: kwidth * 0.60,
                            width: double.infinity,
                            child: Image.file(
                              state.selfieImageModel!.fileImage,
                            ),
                          )
                        : ContainerPickImage(
                            onPressed: () => context.read<CardSecondBloc>().add(
                                  const CardSecondEvent.selfieImage(
                                    cameraDeviceFront: true,
                                  ),
                                ),
                            heading: 'Take Selfie',
                          ),
                // Show container to pick image
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Form(
                    key: context.read<CardSecondBloc>().cardUpdateKey,
                    child: Column(
                      children: [
                        adjustHieght(khieght * 0.008),
                        AutocompleteTextField(
                          autocompleteItems:
                              state.scannedImageDatasModel?.names ?? [],
                          validate: Validate.notNull,
                          label: 'Name',
                          controller: context
                              .read<CardSecondBloc>()
                              .updateNameController,
                          inputType: TextInputType.name,
                        ),
                        AutocompleteTextField(
                          autocompleteItems:
                              state.scannedImageDatasModel?.names ?? [],
                          validate: Validate.notNull,
                          label: 'Company',
                          controller: context
                              .read<CardSecondBloc>()
                              .updateCompanyController,
                          inputType: TextInputType.name,
                        ),
                        adjustHieght(khieght * .2),
                        !state.isLoading
                            ? LastSkipContinueButtons(
                                onTap: () {
                                  if (context
                                      .read<CardSecondBloc>()
                                      .cardUpdateKey
                                      .currentState!
                                      .validate()) {
                                    SecondCard secondCard = SecondCard(
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
                                          : widget.secondCard.image,
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
