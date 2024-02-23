import 'package:animate_do/animate_do.dart';
import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/screens/business_card_preview/view/screen/preview_main_screen.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/accolades/accolades_screen.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/image_preview_under_textfield.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/last_skip_and_continue.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/widgets/image_preview.dart';
import 'package:bizkit/domain/model/image/image_model.dart';
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
              'Company & Banking Details',
              style: TextStyle(fontSize: 20),
            ),
            // company branchs adding section
            BlocBuilder<BusinessDataBloc, BusinessDataState>(
              builder: (context, state) {
                return ImagePreviewUnderTextField(
                  ontap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          child: ColoredBox(
                            color: kblack,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text('Enter Branch Office'),
                                  adjustHieght(10),
                                  TTextFormField(
                                      text: 'Branch',
                                      controller: context
                                          .read<BusinessDataBloc>()
                                          .branchOfficeController),
                                  adjustHieght(10),
                                  AuthButton(
                                      text: 'Add',
                                      onTap: () {
                                        if (context
                                                .read<BusinessDataBloc>()
                                                .branchOfficeController
                                                .text !=
                                            '') {
                                          context.read<BusinessDataBloc>().add(
                                                BusinessDataEvent.addBranch(
                                                    branch: context
                                                        .read<
                                                            BusinessDataBloc>()
                                                        .branchOfficeController
                                                        .text),
                                              );
                                        }
                                        context
                                            .read<BusinessDataBloc>()
                                            .branchOfficeController
                                            .text = '';
                                        Navigator.pop(context);
                                      })
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  removeItem: (index) => context
                      .read<BusinessDataBloc>()
                      .add(BusinessDataEvent.removeBranch(index: index)),
                  listString: state.branchOffices,
                  child: const TTextFormField(
                    enabled: false,
                    text: 'Branch Offices',
                    suffix: Icon(Icons.keyboard_arrow_right_outlined),
                  ),
                );
              },
            ),
            adjustHieght(10),
            // accredition data
            BlocBuilder<BusinessDataBloc, BusinessDataState>(
              builder: (context, state) {
                return ImagePreviewUnderTextField(
                  ontap: () => Navigator.of(context).push(
                    fadePageRoute(const AccolodesScreen(accolade: false)),
                  ),
                  onItemTap: (value) => Navigator.push(
                      context,
                      fadePageRoute(
                          ScreenImagePreview(image: value, isFileIamge: true))),
                  removeItem: (index) => context
                      .read<BusinessDataBloc>()
                      .add(BusinessDataEvent.removeAccredition(index: index)),
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
            adjustHieght(khieght * .03),
            const Text('Banking details'),
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
            adjustHieght(10),
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
