import 'package:animate_do/animate_do.dart';
import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/business_card_preview/preview_main_screen.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/last_skip_and_continue.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

GlobalKey<FormState> bankingCardCreationKey = GlobalKey<FormState>();

class CompanyAndBankingDetails extends StatelessWidget {
  const CompanyAndBankingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 900),
      delay: const Duration(milliseconds: 600),
      child: GestureDetector(
        onTap: () {
          FocusScopeNode focusScope = FocusScope.of(context);
          if (!focusScope.hasPrimaryFocus) {
            focusScope.unfocus();
          }
        },
        child: Form(
          key: bankingCardCreationKey,
          child: ListView(
            children: [
              adjustHieght(khieght * .04),
              const Text(
                'Banking Details',
                style: TextStyle(fontSize: 20),
              ),
              adjustHieght(khieght * .02),
              // company banking name
              TTextFormField(
                text: 'Company Banking Name',
                validate: Validate.notNull,
                textCapitalization: TextCapitalization.words,
                controller:
                    context.read<BusinessDataBloc>().nameOfCompanyController,
              ),
              // banking details accound number
              TTextFormField(
                text: 'Account Number',
                validate: Validate.notNull,
                inputType: TextInputType.number,
                maxlegth: 16,
                controller:
                    context.read<BusinessDataBloc>().accountNumberController,
              ),
              // banking details accound number
              TTextFormField(
                text: 'IFSC',
                maxlegth: 11,
                textCapitalization: TextCapitalization.characters,
                validate: Validate.ifsc,
                inputType: TextInputType.name,
                controller: context.read<BusinessDataBloc>().ifscController,
              ),
              // upi details
              TTextFormField(
                text: 'UPI ID',
                validate: Validate.upi,
                controller:
                    context.read<BusinessDataBloc>().upiDetailController,
              ),
              // gst number
              TTextFormField(
                text: 'GST Number',
                validate: Validate.gst,
                maxlegth: 15,
                controller:
                    context.read<BusinessDataBloc>().gstNumberController,
              ),
              adjustHieght(khieght * .05),
              BlocConsumer<BusinessDataBloc, BusinessDataState>(
                listenWhen: (previous, current) =>
                    previous.businessData != current.businessData,
                listener: (context, state) {
                  if (state.message != null && state.hasError) {
                    showSnackbar(context,
                        message: state.message!, backgroundColor: kred);
                  }
                  if (state.businessData != null) {
                    Navigator.push(
                        context,
                        fadePageRoute(
                            const BusinessCardCreationPreviewScreen()));
                    // GoRouter.of(context).pushReplacementNamed(Routes.cardCreationPreview);
                  }
                },
                builder: (context, state) {
                  if (state.isLoading) {
                    return const LoadingAnimation();
                  }
                  return LastSkipContinueButtons(
                    onSkipTap: state.isBusiness
                        ? null
                        : () {
                            context
                                .read<BusinessDataBloc>()
                                .nameOfCompanyController
                                .text = '';
                            context
                                .read<BusinessDataBloc>()
                                .accountNumberController
                                .text = '';
                            context
                                .read<BusinessDataBloc>()
                                .ifscController
                                .text = '';
                            context
                                .read<BusinessDataBloc>()
                                .upiDetailController
                                .text = '';
                            context
                                .read<BusinessDataBloc>()
                                .gstNumberController
                                .text = '';
                            context.read<BusinessDataBloc>().add(
                                const BusinessDataEvent.createBankingData());
                          },
                    onTap: () {
                      // if (bankingCardCreationKey.currentState!.validate()) {
                      //   context
                      //       .read<BusinessDataBloc>()
                      //       .add(const BusinessDataEvent.createBankingData());
                      // }
                      // if (context
                      //             .read<BusinessDataBloc>()
                      //             .nameOfCompanyController
                      //             .text !=
                      //         '' ||
                      //     context
                      //             .read<BusinessDataBloc>()
                      //             .accountNumberController
                      //             .text !=
                      //         '' ||
                      //     context
                      //             .read<BusinessDataBloc>()
                      //             .ifscController
                      //             .text !=
                      //         '' ||
                      //     context
                      //             .read<BusinessDataBloc>()
                      //             .upiDetailController
                      //             .text !=
                      //         '' ||
                      //     context
                      //             .read<BusinessDataBloc>()
                      //             .gstNumberController
                      //             .text !=
                      //         '') {
                      //   if (bankingCardCreationKey.currentState!.validate()) {
                      //     context
                      //         .read<BusinessDataBloc>()
                      //         .add(const BusinessDataEvent.createBankingData());
                      //   }
                      // } else {
                      //   context
                      //       .read<BusinessDataBloc>()
                      //       .add(const BusinessDataEvent.createBankingData());
                      // }
                    },
                  );
                },
              ),
              adjustHieght(khieght * .02),
            ],
          ),
        ),
      ),
    );
  }
}
