import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BizcardDetailEditButton extends StatelessWidget {
  const BizcardDetailEditButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kHeight30,
        EventButton(
            text: 'Edit Card',
            onTap: () {
              GoRouter.of(context).pushNamed(Routes.cardUpdating);
            },
            showGradiant: false,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity),
      ],
    );
  }
}
