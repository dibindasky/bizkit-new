import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/profile_screen/view/screen/privacy_security/inner_screens/level_sharing_settings.dart';
import 'package:bizkit/application/presentation/screens/profile_screen/view/widgets/tile_item.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class PrivacyAndSecurityScreen extends StatelessWidget {
  const PrivacyAndSecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          'Privacy and Security',
          style: TextStyle(color: kwhite),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            TileItem(
              text: 'Level Setting',
              onTap: () => Navigator.of(context).push(
                fadePageRoute(const DefaultLevelSharing()),
              ),
            ),
            // TileItem(
            //   text: 'Privacy Settings',
            //   onTap: () => Navigator.of(context).push(
            //     fadePageRoute(
            //       const PrivacyAecurityinner(),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
