// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bizkit/fade_transition/fade_transition.dart';
import 'package:bizkit/feature/profile_screen/view/screen/account_settings/account_settings_scree.dart';
import 'package:bizkit/feature/profile_screen/view/screen/connection_network/connection_network_screen.dart';
import 'package:bizkit/feature/profile_screen/view/screen/data_management/data_management.dart';
import 'package:bizkit/feature/profile_screen/view/screen/help_support/help_support.dart';
import 'package:bizkit/feature/profile_screen/view/screen/log_out/log_out_screen.dart';
import 'package:bizkit/feature/profile_screen/view/screen/privacy_security/privacy_screen.dart';
import 'package:flutter/material.dart';

import 'package:bizkit/core/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: knill,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 75,
                backgroundColor: neonShade,
                child: CircleAvatar(
                  radius: 73,
                  backgroundColor: kblack,
                  child: CircleAvatar(
                    radius: 67,
                    backgroundImage: AssetImage('asset/images/person.jpeg'),
                  ),
                ),
              ),
              adjustHieght(khieght * .04),
              const ProfileTiles(
                heading: 'Account Settings',
                subtittle: 'Profile, Password, Email Etc.',
                widget: AccountSettigsScreen(),
              ),
              const ProfileTiles(
                heading: 'Privacy and Security',
                subtittle: 'Level, Security Preferences Etc.',
                widget: PrivacyAndSecurityScreen(),
              ),
              const ProfileTiles(
                heading: 'Data Management',
                subtittle: 'Data Export, delete etc.',
                widget: DataManagement(),
              ),
              const ProfileTiles(
                heading: 'Connections & Networking',
                subtittle: 'Blocked, Restricted, Report Connections',
                widget: ConnectionNetworkScreen(),
              ),
              ProfileTiles(
                heading: 'Help & Support',
                subtittle: 'Contact, Faq etc.',
                widget: HelpSupport(),
              ),
              const ProfileTiles(
                heading: 'Logout',
                widget: LogOutScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileTiles extends StatelessWidget {
  const ProfileTiles({
    Key? key,
    this.widget,
    required this.heading,
    this.subtittle,
  }) : super(key: key);
  final Widget? widget;
  final String heading;
  final String? subtittle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(fadePageRoute(widget!)),
      child: SizedBox(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    heading,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtittle == null
                      ? const SizedBox()
                      : Text(
                          subtittle!,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w200,
                            color: klightgrey,
                          ),
                        ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: kwhite,
                  size: 17,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
