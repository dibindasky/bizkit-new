import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/profile_screen/view/screen/connection_network/inner_screens/blocked_connections.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/screens/profile_screen/view/widgets/tile_item.dart';
import 'package:flutter/material.dart';

class ConnectionNetworkScreen extends StatelessWidget {
  const ConnectionNetworkScreen({super.key});

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
        title: Text(
          'Connections & Networking',
          style: textHeadStyle1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            TileItem(
              text: 'Blocked Connections',
              onTap: () {
                Navigator.of(context)
                    .push(fadePageRoute(const BlockedConnections()));
              },
            ),
            TileItem(
              text: 'Restricted Connections',
              onTap: () {},
            ),
            TileItem(
              text: 'Reported Connections',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
