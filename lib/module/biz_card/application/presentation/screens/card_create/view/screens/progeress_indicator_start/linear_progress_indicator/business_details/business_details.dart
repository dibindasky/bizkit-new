import 'package:animate_do/animate_do.dart';
import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/module/biz_card/application/controller/card/business_details.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/achevements/achievements_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/achevements/create_achievement_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/personal_detail_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/social_media_handles/social_media_handles.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create/view/widgets/image_preview_under_textfield.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create/view/widgets/last_skip_and_continue.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/branch_office.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/debouncer/debouncer.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/utils/text_field/auto_fill_text_field.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final GlobalKey<FormState> businessFormKey = GlobalKey<FormState>();

class BusinessDetailsScreen extends StatelessWidget {
  BusinessDetailsScreen(
      {super.key, required this.pageController, required this.fromBusiness});

  final bool fromBusiness;
  final PageController pageController;
  final Debouncer debouncer = Debouncer();

  @override
  Widget build(BuildContext context) {
    final businessController = Get.find<BusinesDetailsController>();
    final cardController = Get.find<CardController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // context
      //     .read<BusinessDataBloc>()
      //     .add(const BusinessDataEvent.getCompnayList(search: null));
    });
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
          key: businessFormKey,
          child: ListView(
            children: [
              adjustHieght(khieght * .03),
              const Text(
                'Business Details',
                style: TextStyle(fontSize: 20),
              ),
              adjustHieght(khieght * .02),
              // Business category mail id
              AutocompleteTextField(
                doAutoFill: false,
                validate: Validate.notNull,
                label: 'Business Category',
                inputType: TextInputType.emailAddress,
                controller: businessController.businessCategory,
                autocompleteItems: const [],
              ),
              //Business name
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
              // business name

              // mobile number business
              AutocompleteTextField(
                label: 'Designation',
                doAutoFill: false,
                validate: Validate.notNull,
                maxLength: 10,
                controller: businessController.companyDesignation,
                inputType: TextInputType.number,
                autocompleteItems: const [],
              ),
              //
              AutocompleteTextField(
                inputType: TextInputType.emailAddress,
                label: 'Combany Mail',
                validate: Validate.email,
                doAutoFill: false,
                controller: businessController.companyEmail,
                autocompleteItems: const [],
              ),
              // Company Number
              AutocompleteTextField(
                maxLength: 10,
                validate: Validate.phone,
                inputType: TextInputType.phone,
                label: 'Company Number',
                doAutoFill: false,
                controller: businessController.companyNumber,
                autocompleteItems: const [],
              ),
              // website link business
              AutocompleteTextField(
                inputType: TextInputType.url,
                label: 'Company Website link',
                doAutoFill: false,
                controller: businessController.companyWebsiteLink,
                autocompleteItems: const [],
              ),
              // Accredition data
              Obx(
                () => ImagePreviewUnderTextField(
                  ontap: () {
                    FocusScope.of(context).unfocus();
                    Navigator.of(context).push(cardFadePageRoute(
                        const CardScreenAchievements(fromBusiness: true)));
                  },
                  onItemTap: (value, index) {
                    return Navigator.push(
                        context,
                        cardFadePageRoute(CardScreenAchievementsCreate(
                          fromBusiness: true,
                          achievement: cardController.bizcardDetail.value
                              .businessDetails?.businessAchievements?[index],
                        )));
                  },
                  removeItem: (index) {
                    showCustomConfirmationDialogue(
                      context: context,
                      title: 'Are you sure want to delete ?',
                      buttonText: 'Delete',
                      onTap: () {
                        businessController.achievementDeleting(index: index);
                      },
                    );
                  },
                  list: cardController.bizcardDetail.value.businessDetails
                          ?.businessAchievements
                          ?.map((e) => (e.images?.isEmpty) ?? true
                              ? ''
                              : e.images?[0].image ?? '')
                          .toList() ??
                      [],
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Company Achievements',
                          style: custumText(colr: klightgrey, fontSize: 17),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                          color: klightgrey,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              kHeight5,
              // social media handles
              ImagePreviewUnderTextField(
                onItemTap: (value, index) {
                  final data = cardController.bizcardDetail.value
                      .businessDetails?.businessSocialMedia?[index];
                  showDailoges(context,
                      heading: 'Social Media',
                      tittle: "Name : ${data?.label ?? ''}",
                      desc: 'Link : ${data?.link ?? ''}');
                },
                listString: cardController.bizcardDetail.value.businessDetails
                        ?.businessSocialMedia
                        ?.map((e) => e.label ?? '')
                        .toList() ??
                    [],
                removeItem: (index) {
                  showCustomConfirmationDialogue(
                    context: context,
                    title: 'are you sure want to delete ?',
                    buttonText: 'Delete',
                    onTap: () {
                      businessController.socialMediaDelete(index: index);
                    },
                  );
                },
                ontap: () {
                  FocusScope.of(context).unfocus();
                  Navigator.of(context).push(cardFadePageRoute(
                      const SocialMediahandlesScreen(fromBusiness: true)));
                },
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Company Social Media Handles',
                        style: custumText(colr: klightgrey, fontSize: 17),
                      ),
                      const Icon(Icons.arrow_forward_ios_rounded,
                          size: 16, color: klightgrey)
                    ],
                  ),
                ),
              ),
              kHeight10,
              // Company branch adding section
              Obx(
                () => ImagePreviewUnderTextField(
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
                        businessController.branchDelete(index);
                        // context.read<BusinessDataBloc>().add(
                        //     BusinessDataEvent.removeBranch(
                        //         id: state.branchOffices[index].id!));
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
              adjustHieght(7),

              // continue button
              Obx(
                () => businessController.isLoading.value
                    ? const LoadingAnimation()
                    : CardLastSkipContinueButtons(
                        onTap: () {
                          if (businessFormKey.currentState!.validate()) {
                            businessController.bussinessDetailsInitail();
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
            color: kblack,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                        '${id != null ? 'Update' : 'Enter'} Branch Office Details'),
                    kHeight10,
                    CustomTextFormField(
                        labelText: 'Branch name',
                        textCapitalization: TextCapitalization.sentences,
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
                          textCapitalization: TextCapitalization.sentences,
                          controller:
                              businessController.businessBranchOfficesAddress),
                    ),
                    kHeight10,
                    CustomTextFormField(
                        labelText: 'Contact Person',
                        textCapitalization: TextCapitalization.sentences,
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
                                // if (context
                                //         .read<BusinessDataBloc>()
                                //         .branchOfficeController
                                //         .text !=
                                //     '') {
                                //   if (id == null) {
                                //     context.read<BusinessDataBloc>().add(
                                //           BusinessDataEvent.addBranch(
                                //               branch: BranchOffice(
                                //                   branch: context
                                //                       .read<BusinessDataBloc>()
                                //                       .branchOfficeController
                                //                       .text,
                                //                   name: context
                                //                       .read<BusinessDataBloc>()
                                //                       .branchOfficeNameController
                                //                       .text,
                                //                   phoneNumber: context
                                //                       .read<BusinessDataBloc>()
                                //                       .branchOfficePhoneController
                                //                       .text,
                                //                   cardId: state.currentCard!.id!)),
                                //         );
                                //   } else {
                                //     context.read<BusinessDataBloc>().add(
                                //           BusinessDataEvent.updateBranch(
                                //               branch: BranchOffice(
                                //                   branch: context
                                //                       .read<BusinessDataBloc>()
                                //                       .branchOfficeController
                                //                       .text,
                                //                   name: context
                                //                       .read<BusinessDataBloc>()
                                //                       .branchOfficeNameController
                                //                       .text,
                                //                   phoneNumber: context
                                //                       .read<BusinessDataBloc>()
                                //                       .branchOfficePhoneController
                                //                       .text,
                                //                   cardId: state.currentCard!.id!,
                                //                   id: id),
                                //               id: id),
                                //         );
                                //   }
                                // }
                                // context
                                //     .read<BusinessDataBloc>()
                                //     .branchOfficeController
                                //     .text = '';
                                // context
                                //     .read<BusinessDataBloc>()
                                //     .branchOfficeNameController
                                //     .text = '';
                                // context
                                //     .read<BusinessDataBloc>()
                                //     .branchOfficePhoneController
                                //     .text = '';
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