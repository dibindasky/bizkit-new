import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            """Are you sure you want to add this company's details to your profile? The company can block you from using their data if you are not part of the organization."""),
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
