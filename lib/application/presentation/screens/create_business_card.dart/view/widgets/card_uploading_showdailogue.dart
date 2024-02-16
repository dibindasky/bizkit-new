import 'package:bizkit/application/business_logic/card/create/user_data/user_data_bloc.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/selected_cards/pick_cards_screen.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<dynamic> cardscanimagesSelectingDailogue(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: neonShade,
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            context
                .read<UserDataBloc>()
                .add(UserDataEvent.pickImageScanning(camera: false));
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const PickCardsScreen(),
            ));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: kwhite,
            foregroundColor: neonShade,
          ),
          child: const Text('Gallery'),
        ),
        adjustHieght(khieght * .02),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            context
                .read<UserDataBloc>()
                .add(UserDataEvent.pickImageScanning(camera: true));
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const PickCardsScreen(),
            ));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: kwhite,
            foregroundColor: neonShade,
          ),
          child: const Text('Camera'),
        )
      ],
      title: const Text('Take a picture or upload an image'),
    ),
  );
}
