import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/card/business_details.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create_update/card_details_create_or_update/personal_info/card_detail_update_personal_info.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create_update/widgets/card_detail_update_button_container.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create_update/widgets/skip_or_continue_button.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/branch_office.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/debouncer/debouncer.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/utils/text_field/auto_fill_text_field.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:bizkit/utils/widgets/image_or_text_preview_under_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class CardUpdateBusinesstDetails extends StatelessWidget {
  CardUpdateBusinesstDetails({super.key});

  final Debouncer debouncer = Debouncer(milliseconds: 300);
  final GlobalKey<FormState> businessFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> businessDataPhoneNumber = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final businessController = Get.find<BusinesDetailsController>();
    final cardController = Get.find<CardController>();
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
          key: businessFormKey,
          child: ListView(
            children: [
              kHeight20,
              // Business category mail id
              AutocompleteTextField(
                doAutoFill: false,
                validate: Validate.notNull,
                label: 'Business Category',
                inputType: TextInputType.emailAddress,
                controller: businessController.businessCategory,
                autocompleteItems: const [],
              ),
              // Business name
              CustomTextFormField(
                  labelText: 'Business Name',
                  validate: Validate.notNull,
                  textCapitalization: TextCapitalization.words,
                  controller: businessController.businessName),
              // company name
              AutocompleteTextField(
                validate: Validate.notNull,
                showDropdown: true,
                autocompleteItems: const [],
                onChanged: (value) {},
                onDropDownSelection: (value) {},
                label: 'Company Name',
                textCapitalization: TextCapitalization.words,
                controller: businessController.commpanyName,
              ),
              // designation
              AutocompleteTextField(
                label: 'Designation',
                doAutoFill: false,
                validate: Validate.notNull,
                maxLength: 10,
                controller: businessController.companyDesignation,
                autocompleteItems: const [],
              ),
              // compnay mail
              AutocompleteTextField(
                inputType: TextInputType.emailAddress,
                label: 'Company Mail',
                validate: Validate.email,
                doAutoFill: false,
                controller: businessController.companyEmail,
                autocompleteItems: const [],
              ),
              // Company Number
              Form(
                key: businessDataPhoneNumber,
                child: GetBuilder<BusinesDetailsController>(
                    id: 'businessPhoneNumber',
                    builder: (controller) => ImageOrTextPreviewUnderWidget(
                          removeItem: (index) {
                            businessController.deleteBusinessPhoneNumber(index);
                          },
                          listString: businessController.businessPhoneNumbers,
                          child: AutocompleteTextField(
                            suffixIcon: InkWell(
                                onTap: () {
                                  if (businessDataPhoneNumber.currentState!
                                      .validate()) {
                                    FocusScopeNode().unfocus();
                                    businessController.addBusinessPhoneNumber(
                                        context,
                                        businessController.companyNumber.text);
                                  }
                                },
                                child: const Icon(Icons.add)),
                            maxLength: 12,
                            validate: Validate.mobOrLandline,
                            inputType: TextInputType.phone,
                            label: 'Company Number',
                            doAutoFill: false,
                            controller: businessController.companyNumber,
                            autocompleteItems: const [],
                          ),
                        )),
              ),
              // website link business
              AutocompleteTextField(
                inputType: TextInputType.url,
                label: 'Company Website link',
                doAutoFill: false,
                controller: businessController.companyWebsiteLink,
                autocompleteItems: const [],
              ),
              // company story
              CustomTextFormField(
                validate: Validate.none,
                labelText: 'Company Story',
                maxLines: 5,
                controller: businessController.companyStoryController,
              ),
              // Business Achivements
              Obx(
                () => ImageOrTextPreviewUnderWidget(
                  ontap: () async {
                    await GoRouter.of(context)
                        .pushNamed(Routes.cardAchivementCreateUpdate, extra: {
                      'fromBusiness': true,
                    }).then((_) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    });
                  },
                  onItemTap: (value, index) {
                    GoRouter.of(context)
                        .pushNamed(Routes.cardAchivementCreateUpdate, extra: {
                      'fromBusiness': true,
                      'achivement': cardController.bizcardDetail.value
                          .businessDetails?.businessAchievements?[index]
                    });
                  },
                  removeItem: (index) {
                    showCustomConfirmationDialogue(
                      context: context,
                      title: 'Are you sure you want to delete ?',
                      buttonText: 'Delete',
                      onTap: () {
                        businessController.achievementDeleting(
                            fromInner: false, index: index, context: context);
                      },
                    );
                  },
                  list: cardController.bizcardDetail.value.businessDetails
                          ?.businessAchievements
                          ?.map((e) => (e.images?.isEmpty) ?? true
                              ? ''
                              : e.images?[0] ?? '')
                          .toList() ??
                      [],
                  child: const CardDetailEditingButtonContainer(
                      text: 'Company Achievements'),
                ),
              ),
              kHeight10,
              // social media handles
              Obx(() => ImageOrTextPreviewUnderWidget(
                    onItemTap: (value, index) {
                      final data = cardController.bizcardDetail.value
                          .businessDetails?.businessSocialMedia?[index];
                      showDailoges(context,
                          heading: 'Social Media',
                          tittle: "Name : ${data?.label ?? ''}",
                          desc: 'Link : ${data?.link ?? ''}');
                    },
                    listString: cardController.bizcardDetail.value
                            .businessDetails?.businessSocialMedia
                            ?.map((e) => e.label ?? '')
                            .toList() ??
                        [],
                    removeItem: (index) {
                      showCustomConfirmationDialogue(
                        context: context,
                        title: 'Are you sure you want to delete ?',
                        buttonText: 'Delete',
                        onTap: () {
                          businessController.socialMediaDelete(
                              fromInner: false, index: index, context: context);
                        },
                      );
                    },
                    ontap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      GoRouter.of(context).pushNamed(
                          Routes.cardSocialMediaCreateUpdate,
                          extra: {'fromBusiness': true});
                    },
                    child: const CardDetailEditingButtonContainer(
                        text: 'Company Social Media Handles'),
                  )),
              kHeight10,
              // Company branch adding section
              Obx(
                () => ImageOrTextPreviewUnderWidget(
                  ontap: () {
                    businessController.branchDataClear();
                    showBranchDialoge(context, null, null);
                  },
                  removeItem: (index) {
                    showCustomConfirmationDialogue(
                      context: context,
                      title: 'Are you sure want to delete?',
                      buttonText: 'Delete',
                      onTap: () {
                        businessController.branchDelete(
                            frominner: false, index: index, context: context);
                      },
                    );
                  },
                  onItemTap: (value, index) {
                    final BranchOffice? data = cardController.bizcardDetail
                        .value.businessDetails?.branchOffices?[index];
                    businessController.businessBranchOfficesAddress.text =
                        data?.branchAddress ?? '';
                    businessController.businessBranchOfficeName.text =
                        data?.branchLocation ?? '';
                    businessController.businessBranchOfficesPersonNumber.text =
                        data?.branchContactNumber ?? '';
                    businessController.businessBranchOfficesPersonName.text =
                        data?.branchContactPerson ?? '';
                    showBranchDialoge(
                        context,
                        cardController
                            .bizcardDetail.value.businessDetails?.branchOffices
                            ?.firstWhere(
                                (element) => element.branchAddress == value)
                            .id,
                        index);
                  },
                  listString: cardController
                          .bizcardDetail.value.businessDetails?.branchOffices
                          ?.map((e) => e.branchAddress ?? '')
                          .toList() ??
                      [],
                  child: const CustomTextFormField(
                    enabled: false,
                    labelText: 'Branch Offices',
                    textCapitalization: TextCapitalization.words,
                    suffixIcon: Icon(Icons.keyboard_arrow_right_outlined),
                  ),
                ),
              ),
              kHeight10,
              // continue button
              Obx(
                () => businessController.isLoading.value
                    ? const LoadingAnimation()
                    : SkipOrContinueButtons(
                        continueText: 'Update',
                        onTap: () {
                          if (businessFormKey.currentState!.validate()) {
                            businessController.bussinessDetailsInitail(
                                context: context);
                          }
                        },
                      ),
              ),
              kHeight30
            ],
          ),
        ),
      ),
    );
  }
}

// branch office Dialoge box
showBranchDialoge(context, String? id, int? index) {
  showDialog(
    context: context,
    builder: (context) {
      final businessController = Get.find<BusinesDetailsController>();
      return Dialog(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: ColoredBox(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                        '${id != null ? 'Update' : 'Enter'} Branch Office Details',
                        style: Theme.of(context).textTheme.displayMedium),
                    kHeight10,
                    CustomTextFormField(
                        labelText: 'Branch name',
                        textCapitalization: TextCapitalization.words,
                        controller:
                            businessController.businessBranchOfficeName),
                    kHeight10,
                    Form(
                      key: businessController.branchFormKey,
                      child: CustomTextFormField(
                          validate: Validate.notNull,
                          labelText: 'Branch Address',
                          maxLines: 4,
                          maxlegth: 250,
                          textCapitalization: TextCapitalization.words,
                          controller:
                              businessController.businessBranchOfficesAddress),
                    ),
                    kHeight10,
                    CustomTextFormField(
                        labelText: 'Contact Person',
                        textCapitalization: TextCapitalization.words,
                        controller:
                            businessController.businessBranchOfficesPersonName),
                    kHeight10,
                    CustomTextFormField(
                      inputType: TextInputType.phone,
                      labelText: 'Contact Number',
                      controller:
                          businessController.businessBranchOfficesPersonNumber,
                    ),
                    kHeight10,
                    Obx(
                      () => businessController.branchLoading.value
                          ? const LoadingAnimation()
                          : EventButton(
                              text: id != null ? 'Update' : 'Add',
                              onTap: () {
                                if (businessController
                                    .branchFormKey.currentState!
                                    .validate()) {
                                  id == null
                                      ? businessController.branchAdding(
                                          context: context)
                                      : businessController.branchUpdate(
                                          context: context, index: index ?? 0);
                                }
                              },
                            ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
