import 'package:animate_do/animate_do.dart';
import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/create_card/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/achevements/accolades_create_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/create_card/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/achevements/accolades_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/create_card/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/social_media_handles/social_media_handles.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/create_card/view/widgets/image_preview_under_textfield.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/debouncer/debouncer.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:bizkit/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/utils/text_field/auto_fill_text_field.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';

final GlobalKey<FormState> businessFormKey = GlobalKey<FormState>();

class BusinessDetailsScreen extends StatelessWidget {
  BusinessDetailsScreen(
      {super.key, required this.pageController, required this.fromBusiness});

  final bool fromBusiness;
  final PageController pageController;
  final Debouncer debouncer = Debouncer();

  @override
  Widget build(BuildContext context) {
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
              // company name
              AutocompleteTextField(
                validate: Validate.notNull,
                showDropdown: true,
                autocompleteItems: const [],
                onChanged: (value) {},
                onDropDownSelection: (value) {},
                label: 'Company',
                textCapitalization: TextCapitalization.words,
                //controller: context.read<BusinessDataBloc>().companyController,
              ),
              // business name
              const CustomTextFormField(
                labelText: 'Business Name',
                validate: Validate.notNull,
                textCapitalization: TextCapitalization.words,
                // controller:
                //     context.read<BusinessDataBloc>().businessNameController,
              ),
              // company mail id
              const AutocompleteTextField(
                doAutoFill: false,
                validate: Validate.email,
                label: 'Company Mail ID',
                inputType: TextInputType.emailAddress,
                //controller: context.read<BusinessDataBloc>().mailController,
                autocompleteItems: [],
              ),
              // mobile number business
              const AutocompleteTextField(
                label: 'Company Number',
                doAutoFill: false,
                // validate: Validate.phone,
                // maxLength: 10,
                //controller: context.read<BusinessDataBloc>().mobileController,
                inputType: TextInputType.number,
                autocompleteItems: [],
              ),
              adjustHieght(10),
              // address field
              const AutocompleteTextField(
                maxLines: 4, doAutoFill: false,
                // maxlegth: 250,
                maxLength: 250,
                label: 'Company Address',
                textCapitalization: TextCapitalization.words,
                //controller: context.read<BusinessDataBloc>().addressController,
                autocompleteItems: [],
              ),
              // website link business
              const AutocompleteTextField(
                inputType: TextInputType.url,
                label: 'Company Website link',
                doAutoFill: false,
                // controller:
                //     context.read<BusinessDataBloc>().websiteLinkController,
                autocompleteItems: [],
              ),
              // social media handles
              ImagePreviewUnderTextField(
                listString: const [],
                removeItem: (index) {
                  showCustomConfirmationDialogue(
                    context: context,
                    title: 'are you sure want to delete ?',
                    buttonText: 'Delete',
                    onTap: () {
                      // context.read<BusinessDataBloc>().add(
                      //     BusinessDataEvent.removeBusinessSocialMedia(
                      //         id: state.socialMedias[index].id!));
                    },
                  );
                },
                ontap: () {
                  FocusScope.of(context).unfocus();
                  Navigator.of(context)
                      .push(cardFadePageRoute(const SocialMediahandlesScreen(
                    fromBusiness: true,
                  )));
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
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16,
                        color: klightgrey,
                      )
                    ],
                  ),
                ),
              ),
              adjustHieght(10),
              // company branchs adding section
              ImagePreviewUnderTextField(
                ontap: () {
                  showBranchDialoge(context, null);
                },
                removeItem: (index) {
                  showCustomConfirmationDialogue(
                    context: context,
                    title: 'are you sure want to delete ?',
                    buttonText: 'Delete',
                    onTap: () {
                      // context.read<BusinessDataBloc>().add(
                      //     BusinessDataEvent.removeBranch(
                      //         id: state.branchOffices[index].id!));
                    },
                  );
                },
                onItemTap: (value, index) {
                  //final BranchOffice data = state.branchOffices[index];
                  // context
                  //     .read<BusinessDataBloc>()
                  //     .branchOfficeController
                  //     .text = data.branch ?? '';
                  // context
                  //     .read<BusinessDataBloc>()
                  //     .branchOfficePhoneController
                  //     .text = data.phoneNumber ?? '';
                  // context
                  //     .read<BusinessDataBloc>()
                  //     .branchOfficeNameController
                  //     .text = data.name ?? '';
                  // showBranchDialoge(
                  //     context,
                  //     state.branchOffices
                  //         .firstWhere(
                  //             (element) => element.branch == value)
                  //         .id);
                },
                listString: const [],
                child: const CustomTextFormField(
                  enabled: false,
                  labelText: 'Branch Offices',
                  textCapitalization: TextCapitalization.words,
                  suffixIcon: Icon(Icons.keyboard_arrow_right_outlined),
                ),
              ),
              adjustHieght(10),
              // accredition data
              ImagePreviewUnderTextField(
                ontap: () {
                  FocusScope.of(context).unfocus();
                  Navigator.of(context).push(cardFadePageRoute(
                      const CardScreenAccolodes(accolade: false)));
                },
                onItemTap: (value, index) {
                  // int index = state.accreditions
                  //     .indexWhere((e) => e.images![0].image == value);
                  return Navigator.push(context,
                      cardFadePageRoute(const CardScreenAccoladesAddCreate(

                          // accredition: [],
                          )));
                },
                removeItem: (index) {
                  showCustomConfirmationDialogue(
                    context: context,
                    title: 'are you sure want to delete ?',
                    buttonText: 'Delete',
                    onTap: () {
                      // context.read<BusinessDataBloc>().add(
                      //     BusinessDataEvent.removeAccredition(
                      //         id: state.accreditions[index].id!));
                    },
                  );
                },
                list: const [],
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
              adjustHieght(khieght * .03),
              // continue button
              // BlocConsumer<BusinessDataBloc, BusinessDataState>(
              //   listener: (context, state) {
              //     if (state.businessAdded) {
              //       context.read<CardBloc>().add(CardEvent.getCardyCardId(
              //           id: state.currentCard!.id!));
              //       if (state.isBusiness && fromBusiness) {
              //         pageController.nextPage(
              //           duration: const Duration(milliseconds: 500),
              //           curve: Curves.ease,
              //         );
              //       } else {
              //         Navigator.pop(context);
              //       }
              //     }
              //   },
              //   buildWhen: (previous, current) =>
              //       previous.businessLoading != current.businessLoading,
              //   builder: (context, state) {
              //     if (state.businessLoading) {
              //       return const LoadingAnimation();
              //     }
              //     return CardLastSkipContinueButtons(
              //       onTap: () {
              //         // if (businessFormKey.currentState!.validate()) {
              //         //   pageController.nextPage(
              //         //     duration: const Duration(milliseconds: 300),
              //         //     curve: Curves.ease,
              //         //   );
              //         context.read<BusinessDataBloc>().add(
              //             const BusinessDataEvent.createBusinessData());
              //         // }
              //       },
              //     );
              //   },
              // ),
              adjustHieght(khieght * .04),
            ],
          ),
        ),
      ),
    );
  }
}

// branch office Dialoge box
showBranchDialoge(context, int? id) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
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
                  const Text('Enter Branch Office Details'),
                  adjustHieght(10),
                  const CustomTextFormField(
                    labelText: 'Branch Address',
                    maxLines: 4,
                    maxlegth: 250,
                    textCapitalization: TextCapitalization.words,
                    // controller: context
                    //     .read<BusinessDataBloc>()
                    //     .branchOfficeController
                  ),
                  adjustHieght(10),
                  const CustomTextFormField(
                    labelText: 'Contact Person',
                    textCapitalization: TextCapitalization.words,
                    // controller: context
                    //     .read<BusinessDataBloc>()
                    //     .branchOfficeNameController
                  ),
                  adjustHieght(10),
                  const CustomTextFormField(
                    inputType: TextInputType.phone,
                    labelText: 'Contact Number',
                    // controller: context
                    //     .read<BusinessDataBloc>()
                    //     .branchOfficePhoneController
                  ),
                  adjustHieght(10),
                  EventButton(
                    text: id != null ? 'Update' : 'Add',
                    onTap: () {
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
