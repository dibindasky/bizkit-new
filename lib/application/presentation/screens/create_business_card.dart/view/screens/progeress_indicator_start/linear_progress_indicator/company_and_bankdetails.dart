import 'package:animate_do/animate_do.dart';
import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/business_card_preview/view/screen/preview_main_screen.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/last_skip_and_continue.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              text: 'company banking name',
              controller:
                  context.read<BusinessDataBloc>().nameOfCompanyController,
            ),
            // banking details accound number
            TTextFormField(
              text: 'Account Number',
              inputType: TextInputType.number,
              controller:
                  context.read<BusinessDataBloc>().accountNumberController,
            ),
            // banking details accound number
            TTextFormField(
              text: 'IFSC',
              inputType: TextInputType.name,
              controller: context.read<BusinessDataBloc>().ifscController,
            ),
            // upi details
            TTextFormField(
              text: 'UPI Details',
              controller: context.read<BusinessDataBloc>().upiDetailController,
            ),
            // gst number
            TTextFormField(
              text: 'GST Number',
              controller: context.read<BusinessDataBloc>().gstNumberController,
            ),
            adjustHieght(khieght * .05),
            BlocConsumer<BusinessDataBloc, BusinessDataState>(
              listenWhen: (previous, current) =>
                  previous.bankDetailsCreateId != current.bankDetailsCreateId,
              listener: (context, state) {
                if (state.bankDetailsCreateId != null) {
                  Navigator.push(context,
                      fadePageRoute(const BusinessCardCreationPreviewScreen()));
                }
              },
              builder: (context, state) {
                if (state.isLoading) {
                  return const LoadingAnimation();
                }
                return LastSkipContinueButtons(
                  onTap: () {
                    context
                        .read<BusinessDataBloc>()
                        .add(const BusinessDataEvent.createBankingData());
                  },
                );
              },
            ),
            adjustHieght(khieght * .02),
          ],
        ),
      ),
    );
  }
}
