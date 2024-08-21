import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

Future<dynamic> cardscanimagesSelectingDailogue(
    BuildContext context, Widget widget) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            // context
            //     .read<UserDataBloc>()
            //     .add(UserDataEvent.pickImageScanning(camera: false));
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => widget,
            ));
          },
          style: ElevatedButton.styleFrom(
              foregroundColor: kwhite, side: const BorderSide(color: kwhite)),
          child: const Text('Gallery'),
        ),
        adjustHieght(khieght * .02),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            // context
            //     .read<UserDataBloc>()
            //     .add(UserDataEvent.pickImageScanning(camera: true));
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => widget,
            ));
          },
          style: ElevatedButton.styleFrom(
              foregroundColor: kwhite, side: const BorderSide(color: kwhite)),
          child: const Text('Camera'),
        )
      ],
      title: const Text('Take a picture or upload an image'),
    ),
  );
}
