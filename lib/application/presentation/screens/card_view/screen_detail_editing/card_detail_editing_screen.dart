import 'package:bizkit/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/screens/card_view/screen_detail_editing/widgets/company_banking_tiles.dart';
import 'package:bizkit/application/presentation/screens/card_view/screen_detail_editing/widgets/company_search_add_popup.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/progress_indicator_start.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/application/presentation/utils/text_field/auto_fill_text_field.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/domain/model/search_query/search_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

ValueNotifier<int> companySearchNotifier = ValueNotifier<int>(2);

class ScreenCardDetailEditingList extends StatelessWidget {
  const ScreenCardDetailEditingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        backgroundColor: backgroundColour,
        title: const Text('Bizkit Details '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<CardBloc, CardState>(
          builder: (context, state) {
            return BlocConsumer<BusinessDataBloc, BusinessDataState>(
              listener: (context, state) {
                if (state.companyDataRemoved) {
                  context.read<CardBloc>().add(
                      CardEvent.getCardyCardId(id: state.currentCard!.id!));
                }
              },
              builder: (context, business) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      DetailCustomTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const LinearProgressIndicatorStarting(
                                          index: 0),
                                ));
                          },
                          title: 'Personal Details',
                          subTitle: ''),
                      adjustHieght(10),
                      state.businessUser
                          ? kempty
                          : state.anotherCard?.isCompanyAutofilled ?? false
                              ? Column(
                                  children: [
                                    business.loadCompanyData
                                        ? const LoadingAnimation(
                                            colors: [kred, kred, kred],
                                          )
                                        : InkWell(
                                            onTap: () {
                                              showCustomConfirmationDialogue(
                                                context: context,
                                                title:
                                                    'Remove company ${state.anotherCard?.requestedCompany ?? ''} form card ?',
                                                buttonText: 'Remove',
                                                onTap: () {
                                                  context
                                                      .read<BusinessDataBloc>()
                                                      .add(const BusinessDataEvent
                                                          .removeBusinessData());
                                                  companySearchNotifier.value =
                                                      0;
                                                  companySearchNotifier
                                                      .notifyListeners();
                                                },
                                              );
                                            },
                                            child: Material(
                                              elevation: 3,
                                              shadowColor: kwhite,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: const ColoredBox(
                                                color: kred,
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Text('Remove company'),
                                                ),
                                              ),
                                            ),
                                          ),
                                    const Text(
                                        'You can remove the existing company details and then you can search and request for your new organisation details.')
                                  ],
                                )
                              : ValueListenableBuilder(
                                  valueListenable: companySearchNotifier,
                                  builder: (context, value, _) {
                                    value;
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        BlocBuilder<CardBloc, CardState>(
                                          builder: (context, state) {
                                            return AuthButton(
                                              text: state.anotherCard
                                                          ?.isCompanyAutofilled ??
                                                      false
                                                  ? 'Remove Company'
                                                  : state.anotherCard
                                                              ?.isCompanyRequested ??
                                                          false
                                                      ? 'Remove Request'
                                                      : 'Add Company',
                                              onTap: () {
                                                if (state.anotherCard
                                                        ?.isCompanyRequested ==
                                                    true) {
                                                  // cancel request call
                                                  showCustomConfirmationDialogue(
                                                    context: context,
                                                    title:
                                                        'Remove compnay request ?',
                                                    buttonText: 'Remove',
                                                    onTap: () {
                                                      context
                                                          .read<CardBloc>()
                                                          .add(CardEvent
                                                              .removeCompanyRequest(
                                                                  id: state
                                                                      .anotherCard!
                                                                      .id!));
                                                    },
                                                  );

                                                  return;
                                                } else if (state.anotherCard
                                                        ?.isCompanyAutofilled ==
                                                    true) {
                                                  showCustomConfirmationDialogue(
                                                    context: context,
                                                    title:
                                                        'Remove compnay form card ?',
                                                    buttonText: 'Remove',
                                                    onTap: () {
                                                      context
                                                          .read<
                                                              BusinessDataBloc>()
                                                          .add(const BusinessDataEvent
                                                              .removeBusinessData());
                                                      companySearchNotifier
                                                          .value = 0;
                                                      companySearchNotifier
                                                          .notifyListeners();
                                                    },
                                                  );
                                                } else {
                                                  companySearchNotifier.value =
                                                      0;
                                                  companySearchNotifier
                                                      .notifyListeners();
                                                }
                                              },
                                              color: value == 0
                                                  ? null
                                                  : const LinearGradient(
                                                      colors: [
                                                        smallBigGrey,
                                                        kgrey,
                                                        smallBigGrey
                                                      ],
                                                    ),
                                            );
                                          },
                                        ),
                                        AuthButton(
                                          text: 'Search Company',
                                          onTap: () {
                                            companySearchNotifier.value = 1;
                                            companySearchNotifier
                                                .notifyListeners();
                                          },
                                          color: value == 1
                                              ? null
                                              : const LinearGradient(
                                                  colors: [
                                                    smallBigGrey,
                                                    kgrey,
                                                    smallBigGrey
                                                  ],
                                                ),
                                        )
                                      ],
                                    );
                                  },
                                ),
                      state.businessUser ? kempty : adjustHieght(10),
                      state.businessUser
                          ? kempty
                          : ValueListenableBuilder(
                              valueListenable: companySearchNotifier,
                              builder: (context, value, _) {
                                if (value > 1) {
                                  return Text(state.anotherCard
                                              ?.isCompanyRequested ??
                                          false
                                      ? 'You can search for a new company, or you can cancel the request and add your own company to the card.'
                                      : 'You have the option to either create a new company profile or search and select your existing company profile to associate with your account.');
                                } else if (value == 0) {
                                  return const BusinessAndBankingDetailsAddingTiles();
                                } else if (state
                                        .anotherCard?.isCompanyAutofilled ??
                                    false) {
                                  return const SizedBox();
                                } else {
                                  return BlocBuilder<BusinessDataBloc,
                                      BusinessDataState>(
                                    builder: (context, state) {
                                      return AutocompleteTextField(
                                        validate: Validate.notNull,
                                        showDropdown: true,
                                        autocompleteItems: state.companiesList
                                            .map((e) => e.company!)
                                            .toList(),
                                        onChanged: (value) {
                                          // call company api and fetch companys to dropdown
                                          context.read<BusinessDataBloc>().add(
                                              BusinessDataEvent.getCompnayList(
                                                  search: SearchQuery(
                                                      search: value)));
                                        },
                                        onDropDownSelection: (value) {
                                          showDialog(
                                            context: context,
                                            builder: (context) => Dialog(
                                              child: CompanyAddingPopUp(
                                                  id: state.companiesList
                                                      .firstWhere((element) =>
                                                          element.company ==
                                                          value)
                                                      .id!),
                                            ),
                                          );
                                          // }
                                        },
                                        label: 'Company',
                                        textCapitalization:
                                            TextCapitalization.words,
                                        controller: context
                                            .read<BusinessDataBloc>()
                                            .companyController,
                                      );
                                    },
                                  );
                                }
                              },
                            ),
                      state.businessUser
                          ? const BusinessAndBankingDetailsAddingTiles()
                          : kempty,
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
