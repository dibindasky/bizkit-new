import 'package:bizkit/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/screens/card_view/screen_detail_editing/widgets/company_banking_tiles.dart';
import 'package:bizkit/application/presentation/screens/card_view/screen_detail_editing/widgets/company_search_add_popup.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/progress_indicator_start.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
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
            return Column(
              children: [
                DetailCustomTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const LinearProgressIndicatorStarting(index: 0),
                          ));
                    },
                    title: 'Personal Details',
                    subTitle: ''),
                adjustHieght(10),
                state.businessUser
                    ? kempty
                    : ValueListenableBuilder(
                        valueListenable: companySearchNotifier,
                        builder: (context, value, _) {
                          value;
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AuthButton(
                                text: 'Add Company',
                                onTap: () {
                                  if (state.anotherCard?.isCompanyAutofilled ==
                                      true) {
                                    showCustomConfirmationDialoge(
                                        context: context,
                                        title:
                                            'If you add your own company, Your added company will be deleted from your card',
                                        buttonText: 'Add Company',
                                        onTap: () {
                                          companySearchNotifier.value = 0;
                                          companySearchNotifier
                                              .notifyListeners();
                                        });
                                  } else {
                                    companySearchNotifier.value = 0;
                                    companySearchNotifier.notifyListeners();
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
                              ),
                              AuthButton(
                                text: 'Search Company',
                                onTap: () {
                                  companySearchNotifier.value = 1;
                                  companySearchNotifier.notifyListeners();
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
                            return const Text(
                                'You can add your own company or if you are part of a company then you can search and choose your compnay.');
                          } else if (value == 0) {
                            return const BusinessAndBankingDetailsAddingTiles();
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
                                            search:
                                                SearchQuery(search: value)));
                                  },
                                  onDropDownSelection: (value) {
                                    // call for company details with the selected value
                                    showDialog(
                                      context: context,
                                      builder: (context) => Dialog(
                                        child: CompanyAddingPopUp(
                                            id: state.companiesList
                                                .firstWhere((element) =>
                                                    element.company == value)
                                                .id!),
                                      ),
                                    );
                                  },
                                  label: 'Company',
                                  textCapitalization: TextCapitalization.words,
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
            );
          },
        ),
      ),
    );
  }
}
