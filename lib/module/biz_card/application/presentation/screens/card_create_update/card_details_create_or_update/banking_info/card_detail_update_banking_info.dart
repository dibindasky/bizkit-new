import 'package:bizkit/module/biz_card/application/controller/card/business_details.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create_update/widgets/skip_or_continue_button.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardUpdateBankingDetails extends StatelessWidget {
  CardUpdateBankingDetails({super.key});
  final GlobalKey<FormState> bankingCardCreationKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final businessController = Get.find<BusinesDetailsController>();

    return GestureDetector(
      onTap: () {
        FocusScopeNode focusScope = FocusScope.of(context);
        if (!focusScope.hasPrimaryFocus) {
          focusScope.unfocus();
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: bankingCardCreationKey,
          child: ListView(
            children: [
              kHeight20,
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
              kHeight10,
              Obx(
                () => businessController.isLoading.value
                    ? const LoadingAnimation()
                    : SkipOrContinueButtons(
                        continueText: 'Update',
                        onTap: () {
                          if (bankingCardCreationKey.currentState!.validate()) {
                            businessController.bankingDetailsAdding(context);
                          }
                        },
                      ),
              ),
              kHeight10,
            ],
          ),
        ),
      ),
    );
  }
}
