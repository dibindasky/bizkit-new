import 'package:animate_do/animate_do.dart';
import 'package:bizkit/application/business_logic/card/business_data/business_data_bloc.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/accolades/accolades_screen.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/image_preview_under_textfield.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/last_skip_and_continue.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/domain/model/image/image_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyAndBankingDetails extends StatelessWidget {
  const CompanyAndBankingDetails({super.key, required this.pageController});

  final PageController pageController;

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
              'Company & Banking Details',
              style: TextStyle(fontSize: 20),
            ),
            adjustHieght(khieght * .02),
            TTextFormField(
              text: 'Name of the company',
              controller:
                  context.read<BusinessDataBloc>().nameOfCompanyController,
              inputType: TextInputType.name,
            ),
            InkWell(
              onTap: () => showDialog(
                context: context,
                builder: (context) {
                  String? account, ifsc;
                  return Dialog(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        adjustHieght(20),
                        Text('Enter Your Banking Details',
                            style: textHeadStyle1),
                        TTextFormField(
                            text: 'Account Number',
                            onChanaged: (value) => account = value),
                        adjustHieght(10),
                        TTextFormField(
                            text: 'IFSC code',
                            onChanaged: (value) => ifsc = value),
                        adjustHieght(10),
                        AuthButton(
                            text: 'Add',
                            onTap: () {
                              context.read<BusinessDataBloc>().ifsc = ifsc;
                              context.read<BusinessDataBloc>().accountNumber =
                                  account;
                              Navigator.pop(context);
                            }),
                        adjustHieght(20)
                      ],
                    ),
                  ));
                },
              ),
              child: const TTextFormField(
                enabled: false,
                text: 'Bank Details',
                inputType: TextInputType.name,
              ),
            ),
            TTextFormField(
              text: 'UPI Details',
              controller: context.read<BusinessDataBloc>().upiDetailController,
              inputType: TextInputType.name,
            ),
            TTextFormField(
              text: 'GST Number',
              controller: context.read<BusinessDataBloc>().gstNumberController,
              inputType: TextInputType.name,
            ),
            adjustHieght(10),
            BlocBuilder<BusinessDataBloc, BusinessDataState>(
              builder: (context, state) {
                return ImagePreviewUnderTextField(
                  ontap: () => Navigator.of(context).push(
                    fadePageRoute(const AccolodesScreen(accolade: false)),
                  ),
                  list: state.accreditions
                      .map((e) => e.image as ImageModel)
                      .toList(),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: textFieldFillColr,
                      boxShadow: [
                        BoxShadow(
                          color: textFieldFillColr,
                          spreadRadius: 0.4,
                          blurRadius: 4,
                          offset: Offset(0.4, .2),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    height: 48.0,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Accredition Details',
                          style: TextStyle(color: klightgrey),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                          color: klightgrey,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            adjustHieght(10),
            TTextFormField(
              text: 'Branch Offices',
              controller:
                  context.read<BusinessDataBloc>().branchOfficeController,
              inputType: TextInputType.name,
            ),
            adjustHieght(khieght * .05),
            LastSkipContinueButtons(
              onTap: () => pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              ),
            ),
            adjustHieght(khieght * .02),
          ],
        ),
      ),
    );
  }
}
