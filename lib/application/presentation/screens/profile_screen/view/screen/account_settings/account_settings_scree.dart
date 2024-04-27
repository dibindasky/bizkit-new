import 'package:bizkit/application/business_logic/profile/profile_bloc.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/profile_screen/view/screen/account_settings/inner_screens/change_password.dart';
import 'package:bizkit/application/presentation/screens/profile_screen/view/screen/account_settings/inner_screens/report_a_problem.dart';
import 'package:bizkit/application/presentation/screens/profile_screen/view/screen/account_settings/inner_screens/username_edit.dart';
import 'package:bizkit/application/presentation/screens/profile_screen/view/widgets/tile_item.dart';
import 'package:flutter/material.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state.isBusiness) {
                  return kempty;
                }
                return TileItem(
                  text: 'Change Username',
                  onTap: () => Navigator.push(
                    context,
                    fadePageRoute(const EditUserDetails()),
                  ),
                );
              },
            ),
            TileItem(
              text: 'Change password',
              onTap: () => Navigator.push(
                context,
                fadePageRoute(const ChangePassword()),
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
