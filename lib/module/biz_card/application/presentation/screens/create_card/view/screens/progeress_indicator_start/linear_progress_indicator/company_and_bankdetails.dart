import 'package:animate_do/animate_do.dart';
import 'package:bizkit/module/biz_card/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/module/biz_card/application/business_logic/card/create/business_data/business_data_bloc.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/create_card/view/widgets/last_skip_and_continue.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:bizkit/utils/constants/colors.dart';
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
              CustomTextFormField(
                labelText: 'Company Banking Name',
                validate: Validate.none,
                textCapitalization: TextCapitalization.words,
                controller:
                    context.read<BusinessDataBloc>().nameOfCompanyController,
              ),
              // banking details accound number
              CustomTextFormField(
                labelText: 'Account Number',
                validate: Validate.none,
                inputType: TextInputType.number,
                maxlegth: 16,
                controller:
                    context.read<BusinessDataBloc>().accountNumberController,
              ),
              // banking details accound number
              CustomTextFormField(
                labelText: 'IFSC',
                maxlegth: 11,
                textCapitalization: TextCapitalization.characters,
                validate: Validate.ifsc,
                inputType: TextInputType.name,
                controller: context.read<BusinessDataBloc>().ifscController,
              ),
              // upi details
              CustomTextFormField(
                labelText: 'UPI ID',
                validate: Validate.upi,
                controller:
                    context.read<BusinessDataBloc>().upiDetailController,
              ),
              // gst number
              CustomTextFormField(
                labelText: 'GST Number',
                validate: Validate.gst,
                maxlegth: 15,
                controller:
                    context.read<BusinessDataBloc>().gstNumberController,
              ),
              adjustHieght(khieght * .05),
              CardLastSkipContinueButtons(
                onTap: () {
                  Navigator.pop(context);
                  // if (bankingCardCreationKey.currentState!.validate()) {
                  //   context
                  //       .read<BusinessDataBloc>()
                  //       .add(const BusinessDataEvent.createBankingData());
                  // }
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
