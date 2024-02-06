import 'package:bizkit/application/business_logic/card_creation/card_screation_bloc.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/selected_cards/pick_cards_screen.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<dynamic> cardscanimagesSelectingDailogue(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            context
                .read<CardScreationBloc>()
                .add(CardScreationEvent.pickImage(camera: false));
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const PickCardsScreen(),
            ));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: neonShade,
            foregroundColor: kwhite,
          ),
          child: const Text('Gallery'),
        ),
        adjustHieght(khieght * .02),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            context
                .read<CardScreationBloc>()
                .add(CardScreationEvent.pickImage(camera: true));
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const PickCardsScreen(),
            ));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: kgreen,
            foregroundColor: kwhite,
          ),
          child: const Text('Camera'),
        )
      ],
      title: const Text('Create scanning images'),
    ),
  );
}
