import 'package:animate_do/animate_do.dart';
import 'package:bizkit/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/last_skip_and_continue.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

GlobalKey<FormState> bankingCardCreationKey = GlobalKey<FormState>();

class CompanyAndBankingDetails extends StatelessWidget {
  const CompanyAndBankingDetails({super.key, required this.fromBusiness});

  final bool fromBusiness;

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
                validate: Validate.none,
                textCapitalization: TextCapitalization.words,
                controller:
                    context.read<BusinessDataBloc>().nameOfCompanyController,
              ),
              // banking details accound number
              TTextFormField(
                text: 'Account Number',
                validate: Validate.none,
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
                listenWhen: (previous, current) => current.bankingAdded,
                listener: (context, state) {
                  if (state.bankingAdded) {
                    // Navigator.pop(context);
                    context.read<CardBloc>().add(
                        CardEvent.getCardyCardId(id: state.currentCard!.id!));
                    Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  if (state.bankingLoading) {
                    return const LoadingAnimation();
                  }
                  return LastSkipContinueButtons(
                    onTap: () {
                      if (bankingCardCreationKey.currentState!.validate()) {
                        context
                            .read<BusinessDataBloc>()
                            .add(const BusinessDataEvent.createBankingData());
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
    );
  }
}
