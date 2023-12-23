import 'package:bizkit/feature/profile_screen/view/widgets/tile_item.dart';
import 'package:flutter/material.dart';
import 'package:bizkit/core/const.dart';

class AccountSettigsScreen extends StatelessWidget {
  const AccountSettigsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: kwhite,
          ),
        ),
        backgroundColor: Colors.transparent,
        title: const Text(
          'Account Settings',
          style: TextStyle(color: kwhite),
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
