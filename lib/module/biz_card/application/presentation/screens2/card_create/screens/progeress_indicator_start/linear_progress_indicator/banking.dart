import 'package:animate_do/animate_do.dart';
import 'package:bizkit/module/biz_card/application/controller/card/business_details.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/card_create/widgets/last_skip_and_continue.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

GlobalKey<FormState> bankingCardCreationKey = GlobalKey<FormState>();

class ScreenCardBankingDetails extends StatelessWidget {
  const ScreenCardBankingDetails({super.key, required this.fromBusiness});

  final bool fromBusiness;

  @override
  Widget build(BuildContext context) {
    final businessController = Get.find<BusinesDetailsController>();
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
              const Text('Banking Details', style: TextStyle(fontSize: 20)),
              adjustHieght(khieght * .02),
              // company banking name
              CustomTextFormField(
                  labelText: 'Company Banking Name',
                  validate: Validate.notNull,
                  textCapitalization: TextCapitalization.sentences,
                  controller: businessController.companyBankingName),
              // banking details accound number
              CustomTextFormField(
                  labelText: 'Account Number',
                  validate: Validate.notNull,
                  inputType: TextInputType.number,
                  maxlegth: 16,
                  controller: businessController.accountNumberController),
              // banking details accound number
              CustomTextFormField(
                labelText: 'IFSC',
                maxlegth: 11,
                textCapitalization: TextCapitalization.characters,
                validate: Validate.ifsc,
                inputType: TextInputType.name,
                controller: businessController.iFSCController,
              ),
              // upi details
              CustomTextFormField(
                  labelText: 'UPI ID',
                  validate: Validate.upi,
                  controller: businessController.uPIIDController),
              // gst number
              CustomTextFormField(
                  labelText: 'GST Number',
                  validate: Validate.gst,
                  maxlegth: 15,
                  controller: businessController.gSTNumberController),
              adjustHieght(khieght * .05),
              Obx(
                () => businessController.isLoading.value
                    ? const LoadingAnimation()
                    : CardLastSkipContinueButtons(
                        onTap: () {
                          if (bankingCardCreationKey.currentState!.validate()) {
                            businessController.bankingDetailsAdding(context);
                          }
                        },
                      ),
              ),
              adjustHieght(khieght * .02),
            ],
          ),
        ),
      ),
    );
  }
}
