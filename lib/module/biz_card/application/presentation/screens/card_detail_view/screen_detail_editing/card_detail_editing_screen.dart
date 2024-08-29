import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail_view/screen_detail_editing/widgets/company_banking_tiles.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create/view/screens/progeress_indicator_start/progress_indicator_start.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

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
        backgroundColor: knill,
        title: const Text('Bizkit Details '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
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
              // Column(
              //   children: [
              //     InkWell(
              //       onTap: () {
              //         showCustomConfirmationDialogue(
              //           context: context,
              //           title:
              //               'Remove company ${"state.anotherCard?.requestedCompany ??" ''} form card ?',
              //           buttonText: 'Remove',
              //           onTap: () {
              //             // context.read<BusinessDataBloc>().add(
              //             //     const BusinessDataEvent.removeBusinessData());
              //             companySearchNotifier.value = 0;
              //             companySearchNotifier.notifyListeners();
              //           },
              //         );
              //       },
              //       child: Material(
              //         elevation: 3,
              //         shadowColor: kwhite,
              //         borderRadius: BorderRadius.circular(10),
              //         child: const ColoredBox(
              //           color: kred,
              //           child: Padding(
              //             padding: EdgeInsets.all(8.0),
              //             child: Text('Remove company'),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // kHeight20,
              // ValueListenableBuilder(
              //   valueListenable: companySearchNotifier,
              //   builder: (context, value, _) {
              //     value;
              //     return Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceAround,
              //       children: [
              //         EventButton(
              //           text: 'Add Company',
              //           onTap: () {
              //             if (true) {
              //               // cancel request call
              //               showCustomConfirmationDialogue(
              //                 context: context,
              //                 title: 'Remove compnay request ?',
              //                 buttonText: 'Remove',
              //                 onTap: () {
              //                   // context.read<CardBloc>().add(
              //                   //     CardEvent.removeCompanyRequest(
              //                   //         id: state.anotherCard!.id!));
              //                 },
              //               );
              //               return;
              //             }
              //             // else if (state
              //             //         .anotherCard?.isCompanyAutofilled ==
              //             //     true) {
              //             //   showCustomConfirmationDialogue(
              //             //     context: context,
              //             //     title: 'Remove compnay form card ?',
              //             //     buttonText: 'Remove',
              //             //     onTap: () {
              //             //       // context.read<BusinessDataBloc>().add(
              //             //       //     const BusinessDataEvent
              //             //       //         .removeBusinessData());
              //             //       companySearchNotifier.value = 0;
              //             //       companySearchNotifier.notifyListeners();
              //             //     },
              //             //   );
              //             // } else {
              //             //   companySearchNotifier.value = 0;
              //             //   companySearchNotifier.notifyListeners();
              //             // }
              //           },
              //           color: value == 0
              //               ? null
              //               : const LinearGradient(
              //                   colors: [smallBigGrey, kgrey, smallBigGrey],
              //                 ),
              //         ),
              //         EventButton(
              //           text: 'Search Company',
              //           onTap: () {
              //             companySearchNotifier.value = 1;
              //             companySearchNotifier.notifyListeners();
              //           },
              //           color: value == 1
              //               ? null
              //               : const LinearGradient(
              //                   colors: [smallBigGrey, kgrey, smallBigGrey],
              //                 ),
              //         )
              //       ],
              //     );
              //   },
              // ),
              // kHeight20,
              const BusinessAndBankingDetailsAddingTiles(),
              // ValueListenableBuilder(
              //   valueListenable: companySearchNotifier,
              //   builder: (context, value, _) {
              //     if (value == 0) {
              //       return const BusinessAndBankingDetailsAddingTiles();
              //     } else {
              //       return Column(
              //         children: [
              //           AutocompleteTextField(
              //             validate: Validate.notNull,
              //             showDropdown: true,
              //             autocompleteItems: const ['Zizk', 'Pvt Ltd'],
              //             onChanged: (value) {
              //               // call company api and fetch companys to dropdown
              //               // context.read<BusinessDataBloc>().add(
              //               //     BusinessDataEvent.getCompnayList(
              //               //         search: SearchQuery(search: value)));
              //             },
              //             onDropDownSelection: (value) {
              //               showDialog(
              //                 context: context,
              //                 builder: (context) => const Dialog(
              //                   child: CompanyAddingPopUp(),
              //                 ),
              //               );
              //               // }
              //             },
              //             label: 'Company',
              //             textCapitalization: TextCapitalization.words,
              //             // controller: context
              //             //     .read<BusinessDataBloc>()
              //             //  .companyController,
              //           ),
              //           const BusinessAndBankingDetailsAddingTiles()
              //         ],
              //       );
              //     }
              //   },
              // ),
              //
            ],
          ),
        ),
      ),
    );
  }
}
