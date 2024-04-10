import 'package:animate_do/animate_do.dart';
import 'package:bizkit/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart';
import 'package:bizkit/application/business_logic/card/create/user_data/user_data_bloc.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/screens/business_card_preview/preview_main_screen.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/accolades/accolades_screen.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/social_media_handles/social_media_handles.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/image_preview_under_textfield.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/last_skip_and_continue.dart';
import 'package:bizkit/application/presentation/utils/debouncer/debouncer.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/application/presentation/utils/text_field/auto_fill_text_field.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/widgets/image_preview.dart';
import 'package:bizkit/domain/model/search_query/search_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final GlobalKey<FormState> businessFormKey = GlobalKey<FormState>();

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
        child: BlocConsumer<BusinessDataBloc, BusinessDataState>(
          listenWhen: (previous, current) =>
              previous.loadCompanyData != current.loadCompanyData,
          listener: (context, state) {
            if (state.gotCompanyData) {
              Navigator.push(context,
                  fadePageRoute(const BusinessCardCreationPreviewScreen()));
            }
          },
          buildWhen: (previous, current) =>
              previous.loadCompanyData != current.loadCompanyData,
          builder: (context, state) {
            if (state.loadCompanyData) {
              return const Center(child: CircularProgressIndicator());
            }
            return Form(
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
                  BlocBuilder<BusinessDataBloc, BusinessDataState>(
                    builder: (context, state) {
                      return AutocompleteTextField(
                        validate: Validate.notNull,
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
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              child: CompanyAddingPopUp(
                                  id: state.companiesList
                                      .firstWhere(
                                          (element) => element.company == value)
                                      .id!),
                            ),
                          );
                        },
                        label: 'Company *',
                        textCapitalization: TextCapitalization.words,
                        controller:
                            context.read<BusinessDataBloc>().companyController,
                      );
                    },
                  ),
                  // business name
                  TTextFormField(
                    text: 'Business Name *',
                    validate: Validate.notNull,
                    textCapitalization: TextCapitalization.words,
                    controller:
                        context.read<BusinessDataBloc>().businessNameController,
                  ),
                  // company mail id
                  BlocBuilder<UserDataBloc, UserDataState>(
                    builder: (context, state) {
                      return AutocompleteTextField(
                        validate: Validate.email,
                        label: 'Mail ID *',
                        inputType: TextInputType.emailAddress,
                        controller:
                            context.read<BusinessDataBloc>().mailController,
                        autocompleteItems:
                            state.scannedImageDatasModel?.emails ?? [],
                      );
                    },
                  ),
                  // mobile number business
                  BlocBuilder<UserDataBloc, UserDataState>(
                    builder: (context, state) {
                      return AutocompleteTextField(
                        label: 'Mobile number *',
                        validate: Validate.phone,
                        maxLength: 10,
                        controller:
                            context.read<BusinessDataBloc>().mobileController,
                        inputType: TextInputType.number,
                        autocompleteItems:
                            state.scannedImageDatasModel?.phone ?? [],
                      );
                    },
                  ),
                  adjustHieght(10),
                  // address field
                  BlocBuilder<UserDataBloc, UserDataState>(
                    builder: (context, state) {
                      return AutocompleteTextField(
                        maxLines: 4,
                        // maxlegth: 250,
                        maxLength: 250,
                        label: 'Address',
                        textCapitalization: TextCapitalization.words,
                        controller:
                            context.read<BusinessDataBloc>().addressController,
                        autocompleteItems:
                            state.scannedImageDatasModel?.unknown ?? [],
                      );
                    },
                  ),
                  // website link business
                  BlocBuilder<UserDataBloc, UserDataState>(
                    builder: (context, state) {
                      return AutocompleteTextField(
                        inputType: TextInputType.url,
                        label: 'Website link',
                        controller: context
                            .read<BusinessDataBloc>()
                            .websiteLinkController,
                        autocompleteItems:
                            state.scannedImageDatasModel?.websites ?? [],
                      );
                    },
                  ),
                  // social media handles
                  BlocBuilder<BusinessDataBloc, BusinessDataState>(
                    builder: (context, state) {
                      return ImagePreviewUnderTextField(
                        listString: state.socialMedias
                            .map((e) => e.socialMedia ?? 'Social Media')
                            .toList(),
                        removeItem: (index) {
                          showCustomConfirmationDialoge(
                              context: context,
                              title: 'are you sure want to delete ?',
                              buttonText: 'Delete',
                              onTap: () {
                                context.read<BusinessDataBloc>().add(
                                    BusinessDataEvent.removeSocialMedia(
                                        id: state.socialMedias[index].id!));
                              });
                        },
                        ontap: () => Navigator.of(context).push(fadePageRoute(
                            SocialMediahandlesScreen(
                                cardId: state.currentCard!.id!,
                                fromBusiness: true))),
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
                                style:
                                    custumText(colr: klightgrey, fontSize: 17),
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
                                    child: BlocConsumer<BusinessDataBloc,
                                        BusinessDataState>(
                                      listener: (context, state) {
                                        if (state.branchAdded) {
                                          Navigator.pop(context);
                                        }
                                      },
                                      builder: (context, state) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: state.branchLoading
                                              ? [const LoadingAnimation()]
                                              : [
                                                  const Text(
                                                      'Enter Branch Office'),
                                                  adjustHieght(10),
                                                  TTextFormField(
                                                      text: 'Branch',
                                                      maxLines: 4,
                                                      maxlegth: 250,
                                                      textCapitalization:
                                                          TextCapitalization
                                                              .words,
                                                      controller: context
                                                          .read<
                                                              BusinessDataBloc>()
                                                          .branchOfficeController),
                                                  adjustHieght(10),
                                                  AuthButton(
                                                      text: 'Add',
                                                      onTap: () {
                                                        if (context
                                                                .read<
                                                                    BusinessDataBloc>()
                                                                .branchOfficeController
                                                                .text !=
                                                            '') {
                                                          context
                                                              .read<
                                                                  BusinessDataBloc>()
                                                              .add(
                                                                BusinessDataEvent.addBranch(
                                                                    branch: context
                                                                        .read<
                                                                            BusinessDataBloc>()
                                                                        .branchOfficeController
                                                                        .text),
                                                              );
                                                        }
                                                        context
                                                            .read<
                                                                BusinessDataBloc>()
                                                            .branchOfficeController
                                                            .text = '';
                                                      })
                                                ],
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        removeItem: (index) {
                          showCustomConfirmationDialoge(
                              context: context,
                              title: 'are you sure want to delete ?',
                              buttonText: 'Delete',
                              onTap: () {
                                context.read<BusinessDataBloc>().add(
                                    BusinessDataEvent.removeBranch(
                                        id: state.branchOffices[index].id!));
                              });
                        },
                        listString:
                            state.branchOffices.map((e) => e.branch!).toList(),
                        child: const TTextFormField(
                          enabled: false,
                          text: 'Branch Offices',
                          textCapitalization: TextCapitalization.words,
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
                          fadePageRoute(AccolodesScreen(
                              accolade: false, cardId: state.currentCard!.id!)),
                        ),
                        onItemTap: (value) => Navigator.push(
                            context,
                            fadePageRoute(ScreenImagePreview(
                                image: value, isFileIamge: false))),
                        removeItem: (index) {
                          showCustomConfirmationDialoge(
                              context: context,
                              title: 'are you sure want to delete ?',
                              buttonText: 'Delete',
                              onTap: () {
                                context.read<BusinessDataBloc>().add(
                                    BusinessDataEvent.removeAccredition(
                                        id: state.accreditions[index].id!));
                              });
                        },
                        list: state.accreditions
                            .map((e) => e.image as String)
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Accredition Details',
                                style:
                                    custumText(colr: klightgrey, fontSize: 17),
                              ),
                              const Icon(
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
                  BlocConsumer<BusinessDataBloc, BusinessDataState>(
                    listener: (context, state) {
                      if (state.businessAdded) {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        context.read<CardBloc>().add(CardEvent.getCardyCardId(
                            id: state.currentCard!.id!));
                      }
                    },
                    buildWhen: (previous, current) =>
                        previous.businessLoading != current.businessLoading,
                    builder: (context, state) {
                      if (state.businessLoading) {
                        return const LoadingAnimation();
                      }
                      return LastSkipContinueButtons(
                        onTap: () {
                          if (businessFormKey.currentState!.validate()) {
                            //   pageController.nextPage(
                            //     duration: const Duration(milliseconds: 300),
                            //     curve: Curves.ease,
                            //   );
                            context.read<BusinessDataBloc>().add(
                                const BusinessDataEvent.createBusinessData());
                          }
                        },
                      );
                    },
                  ),
                  adjustHieght(khieght * .04),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class CompanyAddingPopUp extends StatelessWidget {
  const CompanyAddingPopUp({
    super.key,
    required this.id,
  });
  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: neonShade),
      ),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const Text(
            """Are you sure to add this company details to your profile? you will be part of the organisation once the verification is completed?"""),
        adjustHieght(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            adjustWidth(20),
            Expanded(
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: neonShade),
                  ),
                  child: const Center(
                    child: Text('Cancel'),
                  ),
                ),
              ),
            ),
            adjustWidth(20),
            Expanded(
                child: InkWell(
              onTap: () {
                context.read<BusinessDataBloc>().add(
                      BusinessDataEvent.getCompnayDetails(id: id),
                    );
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: neonShade,
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  border: Border.all(color: neonShade),
                ),
                child: const Center(
                  child: Text('Continue'),
                ),
              ),
            )),
            adjustWidth(20),
          ],
        )
      ]),
    );
  }
}
