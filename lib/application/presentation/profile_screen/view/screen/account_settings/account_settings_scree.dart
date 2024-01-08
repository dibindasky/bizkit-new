import 'package:bizkit/application/presentation/profile_screen/view/widgets/tile_item.dart';
import 'package:flutter/material.dart';
import 'package:bizkit/application/commen/const.dart';

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
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            TileItem(text: 'Change Username'),
            TileItem(text: 'Change Password'),
            TileItem(text: 'Verify Email'),
            TileItem(text: 'Logged In Devices'),
            TileItem(text: 'Notification Settings'),
          ],
        ),
      ),
    );
  }
}
