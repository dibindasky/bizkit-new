import 'package:bizkit/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
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
      child: BlocConsumer<BusinessDataBloc, BusinessDataState>(
        listenWhen: (previous, current) =>
            previous.loadCompanyData && !current.loadCompanyData,
        listener: (context, state) {
          if (state.gotCompanyData) {
            context
                .read<CardBloc>()
                .add(CardEvent.getCardyCardId(id: state.currentCard!.id!));
            Navigator.pop(context);
            Navigator.pop(context);
          } else if (state.hasError &&
              !state.gotCompanyData &&
              !state.loadCompanyData) {
            if (state.message != null) {
              showSnackbar(context,
                  message: state.message!,
                  backgroundColor: kred,
                  textColor: kwhite);
            }
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state.loadCompanyData) {
            return SizedBox(
                height: kwidth * 0.50,
                child: const Center(child: CircularProgressIndicator()));
          }
          return Column(mainAxisSize: MainAxisSize.min, children: [
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
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
                    // Navigator.pop(context);
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
          ]);
        },
      ),
    );
  }
}
