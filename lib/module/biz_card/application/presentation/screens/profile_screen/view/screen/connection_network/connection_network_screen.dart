import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/module/biz_card/application/business_logic/profile/profile_bloc.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/profile_screen/view/screen/connection_network/inner_screens/blocked_connections.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/profile_screen/view/screen/connection_network/inner_screens/tabs/tab.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/profile_screen/view/widgets/tile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                    .push(cardFadePageRoute(const CardBlockedConnections()));
              },
            ),
            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (!state.isBusiness) {
                  return kempty;
                }
                return TileItem(
                  text: 'Business Users',
                  onTap: () {
                    Navigator.of(context).push(cardFadePageRoute(const Tabs()));
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
