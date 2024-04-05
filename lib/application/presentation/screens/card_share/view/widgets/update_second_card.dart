import 'package:bizkit/application/business_logic/card_second/card_second_bloc.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/last_skip_and_continue.dart';
import 'package:bizkit/application/presentation/screens/selfie_card/selfie_screen.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/text_field/auto_fill_text_field.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/domain/model/card_second/update_pass_data/update_data_pass.dart';
import 'package:bizkit/domain/model/card_second/update_second_card_model/update_second_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondCardUpdation extends StatefulWidget {
  const SecondCardUpdation({super.key, required this.updateDataPass});
  final UpdateDataPass updateDataPass;

  @override
  State<SecondCardUpdation> createState() => _SecondCardUpdationState();
}

class _SecondCardUpdationState extends State<SecondCardUpdation> {
  @override
  void initState() {
    context.read<CardSecondBloc>().updateNameController.text =
        widget.updateDataPass.name;
    context.read<CardSecondBloc>().updateCompanyController.text =
        widget.updateDataPass.company;
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
          listener: (context, state) {},
          builder: (context, state) {
            return ListView(
              children: [
                widget.updateDataPass.selfie != null
                    ? Container(
                        height: kwidth * 0.60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(widget.updateDataPass.selfie!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : ContainerPickImage(
                        onPressed: () => context.read<CardSecondBloc>().add(
                              const CardSecondEvent.selfieImage(
                                cameraDeviceFront: true,
                              ),
                            ),
                        isBoth: false,
                        heading: 'Take Selfie',
                      ),
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
                                    UpdateSecondCardModel
                                        updateSecondCardModel =
                                        UpdateSecondCardModel(
                                      company: context
                                          .read<CardSecondBloc>()
                                          .updateCompanyController
                                          .text,
                                      name: context
                                          .read<CardSecondBloc>()
                                          .updateNameController
                                          .text,
                                      selfie:
                                          state.selfieImageModel?.base64 ?? '',
                                    );

                                    context.read<CardSecondBloc>().add(
                                        CardSecondEvent.updateCardSecond(
                                            updateSecondCardModel:
                                                updateSecondCardModel,
                                            id: widget.updateDataPass.id
                                                .toString()));
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
