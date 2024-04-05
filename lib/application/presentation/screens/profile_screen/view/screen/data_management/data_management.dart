import 'package:bizkit/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/application/business_logic/card_second/card_second_bloc.dart';
import 'package:bizkit/application/business_logic/profile/profile_bloc.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/profile_screen/view/screen/data_management/inner_screens/archieved_cards.dart';
import 'package:bizkit/application/presentation/screens/profile_screen/view/screen/data_management/inner_screens/deleted_cards.dart';
import 'package:bizkit/application/presentation/screens/profile_screen/view/widgets/tile_item.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataManagement extends StatelessWidget {
  const DataManagement({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context
            .read<CardBloc>()
            .add(const CardEvent.getArchievedCards(isLoad: false));
        context
            .read<CardBloc>()
            .add(const CardEvent.getdeleteCards(isLoad: false));
        context
            .read<CardSecondBloc>()
            .add(const CardSecondEvent.getDeleteCardSecond(isLoad: false));
      },
    );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: kwhite,
          ),
        ),
        backgroundColor: knill,
        title: const Text(
          'Data Management',
          style: TextStyle(color: kwhite),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TileItem(
              text: 'Achieved cards',
              onTap: () => Navigator.of(context).push(fadePageRoute(
                const ArchivedCards(),
              )),
            ),
            TileItem(
              text: 'Deleted cards',
              onTap: () => Navigator.of(context).push(
                fadePageRoute(
                  const DeletedCards(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
