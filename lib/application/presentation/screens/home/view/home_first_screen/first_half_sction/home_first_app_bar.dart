import 'package:bizkit/application/presentation/screens/card_share/view/widgets/card_sharing.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class HomeFirstAppBar extends StatelessWidget {
  const HomeFirstAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Text('Hello,\nJoi',
              style: custumText(
                  fontSize: kwidth * 0.05, fontWeight: FontWeight.w700)),
          const Spacer(),
          InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CardSharingScreen())),
            child: CircleAvatar(
              radius: kwidth * 0.080,
              backgroundColor: textFieldFillColr,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset('asset/images/bizkitIcon.png'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
