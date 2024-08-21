import 'package:bizkit/module/biz_card/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyAddingPopUp extends StatelessWidget {
  const CompanyAddingPopUp({super.key});
  //final int id;

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
            """Are you sure you want to add the company details to the profile? The company details will be added to your card once your request has been accepted. The company can block you from using their data if you are not part of the organization."""),
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
                // context.read<CardBloc>().add(CardEvent.requestCompanyData(
                //     requestCardDetailModel: RequestCardDetailModel(
                //         companyId: id, cardId: state.anotherCard!.id!)));
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: neonShade,
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  border: Border.all(color: neonShade),
                ),
                child: const Center(
                  child: Text('Request'),
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
