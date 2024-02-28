import 'package:animate_do/animate_do.dart';
import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/accolades/accolades_screen.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/social_media_handles/social_media_handles.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/image_preview_under_textfield.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/last_skip_and_continue.dart';
import 'package:bizkit/application/presentation/utils/debouncer/debouncer.dart';
import 'package:bizkit/application/presentation/utils/text_field/auto_fill_text_field.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/widgets/image_preview.dart';
import 'package:bizkit/domain/model/image/image_model.dart';
import 'package:bizkit/domain/model/search_query/search_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessDetailsScreen extends StatelessWidget {
  BusinessDetailsScreen({super.key, required this.pageController});

  final PageController pageController;
  final Debouncer debouncer = Debouncer();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<BusinessDataBloc>()
          .add(const BusinessDataEvent.getCompnayList(search: null));
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
        child: ListView(
          children: [
            adjustHieght(khieght * .03),
            const Text(
              'Business Details',
              style: TextStyle(fontSize: 20),
            ),
            adjustHieght(khieght * .02),
            // company name
            BlocBuilder<BusinessDataBloc, BusinessDataState>(
              builder: (context, state) {
                return AutocompleteTextField(
                  showDropdown: true,
                  autocompleteItems:
                      state.companiesList.map((e) => e.company!).toList(),
                  onChanged: (value) {
                    // call company api and fetch companys to dropdown
                    context.read<BusinessDataBloc>().add(
                        BusinessDataEvent.getCompnayList(
                            search: SearchQuery(search: value)));
                  },
                  onDropDownSelection: (value) {
                    // call for company details with the selected value
                  },
                  label: 'Company',
                  controller:
                      context.read<BusinessDataBloc>().companyController,
                );
              },
            ),
            // business name
            TTextFormField(
              text: 'Business Name',
              controller:
                  context.read<BusinessDataBloc>().businessNameController,
            ),
            // company mail id
            TTextFormField(
              text: 'Mail ID',
              inputType: TextInputType.emailAddress,
              controller: context.read<BusinessDataBloc>().mailController,
            ),
            // mobile number business
            TTextFormField(
              text: 'Mobile number',
              maxlegth: 10,
              controller: context.read<BusinessDataBloc>().mobileController,
              inputType: TextInputType.number,
            ),
            adjustHieght(10),
            // social media handles
            BlocBuilder<BusinessDataBloc, BusinessDataState>(
              builder: (context, state) {
                return ImagePreviewUnderTextField(
                  listString: state.socialMedias
                      .map((e) => e.socialMedia ?? 'Social Media')
                      .toList(),
                  removeItem: (index) => context
                      .read<BusinessDataBloc>()
                      .add(BusinessDataEvent.removeSocialMedia(index: index)),
                  ontap: () => Navigator.of(context).push(fadePageRoute(
                      const SocialMediahandlesScreen(fromBusiness: true))),
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
                          'Social Media Handles',
                          style: TextStyle(
                              color: state.socialMedias.isNotEmpty
                                  ? kwhite
                                  : klightgrey),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                          color: klightgrey,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            adjustHieght(10),
            // address field
            TTextFormField(
              maxLines: 4,
              maxlegth: 250,
              text: 'Address',
              controller: context.read<BusinessDataBloc>().addressController,
            ),
            // website link business
            TTextFormField(
              inputType: TextInputType.url,
              text: 'Website link',
              controller:
                  context.read<BusinessDataBloc>().websiteLinkController,
            ), // company branchs adding section
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
                  listString:
                      state.branchOffices.map((e) => e.branch!).toList(),
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
            adjustHieght(khieght * .02),
            LastSkipContinueButtons(
              onTap: () {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
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
