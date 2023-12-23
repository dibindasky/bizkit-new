import 'package:bizkit/core/const.dart';
import 'package:bizkit/feature/profile_screen/view/widgets/tile_item.dart';
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
            Icons.arrow_back,
            color: kwhite,
          ),
        ),
        backgroundColor: Colors.transparent,
        title: const Text(
          'Privacy and Security',
          style: TextStyle(color: kwhite),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            TileItem(text: 'Level Setting'),
            TileItem(text: 'Privacy Settings'),
          ],
        ),
      ),
    );
  }
}
