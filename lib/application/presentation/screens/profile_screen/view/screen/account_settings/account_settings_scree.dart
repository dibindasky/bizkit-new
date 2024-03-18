import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/profile_screen/view/screen/account_settings/inner_screens/change_password.dart';
import 'package:bizkit/application/presentation/screens/profile_screen/view/screen/account_settings/inner_screens/login_in_devices.dart';
import 'package:bizkit/application/presentation/screens/profile_screen/view/screen/account_settings/inner_screens/mail_id_edit.dart';
import 'package:bizkit/application/presentation/screens/profile_screen/view/screen/account_settings/inner_screens/notification_settings.dart';
import 'package:bizkit/application/presentation/screens/profile_screen/view/screen/account_settings/inner_screens/report_a_problem.dart';
import 'package:bizkit/application/presentation/screens/profile_screen/view/screen/account_settings/inner_screens/username_edit.dart';
import 'package:bizkit/application/presentation/screens/profile_screen/view/widgets/tile_item.dart';
import 'package:flutter/material.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';

class AccountSettigsScreen extends StatelessWidget {
  const AccountSettigsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: kwhite,
          ),
        ),
        backgroundColor: knill,
        title: const Text(
          'Account Settings',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            TileItem(
              text: 'Change Username',
              onTap: () => Navigator.push(
                context,
                fadePageRoute(const EditUserDetails()),
              ),
            ),
            TileItem(
              text: 'Change password',
              onTap: () => Navigator.push(
                context,
                fadePageRoute(ChangePassword()),
              ),
            ),
            // TileItem(
            //   text: 'Verify Email',
            //   onTap: () => Navigator.push(
            //     context,
            //     fadePageRoute(const ChangeMailId()),
            //   ),
            // ),
            // TileItem(
            //   text: 'Loged in Devices',
            //   onTap: () => Navigator.push(
            //     context,
            //     fadePageRoute(const LoggedDevices()),
            //   ),
            // ),
            TileItem(
              text: 'Notification Settings',
              onTap: () => Navigator.push(
                context,
                fadePageRoute(
                  const NotificationSettings(),
                ),
              ),
            ),
            TileItem(
              text: 'Report a problem',
              onTap: () => Navigator.push(
                context,
                fadePageRoute(
                  ReportProblemPage(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
