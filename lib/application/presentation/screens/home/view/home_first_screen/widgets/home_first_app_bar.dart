import 'package:bizkit/application/business_logic/auth/login/auth_bloc.dart';
import 'package:bizkit/application/business_logic/profile/profile_bloc.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/routes/routes.dart';
import 'package:bizkit/application/presentation/screens/card_share/view/widgets/card_sharing_qr.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeFirstAppBar extends StatefulWidget {
  const HomeFirstAppBar({
    super.key,
  });

  @override
  State<HomeFirstAppBar> createState() => _HomeFirstAppBarState();
}

class _HomeFirstAppBarState extends State<HomeFirstAppBar> {
  bool isOPen = false;

  @override
  void initState() {
    context
        .read<ProfileBloc>()
        .add(const ProfileEvent.getProfile(isLoad: false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                    return Text(
                      '${state.userName != null ? state.userName!.length > 15 ? '${state.userName!.substring(0, 15)}..' : state.userName : ''}',
                      style: custumText(
                        fontSize: kwidth * 0.05,
                        fontWeight: FontWeight.w700,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          // const Spacer(),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).pushNamed(Routes.notificationPage);
            },
            child: CircleAvatar(
                radius: kwidth * .060,
                backgroundColor: textFieldFillColr,
                backgroundImage: const AssetImage(iconNotification)),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              fadePageRoute(
                const CardSharingScreen(),
              ),
            ),
            child: CircleAvatar(
              radius: kwidth * 0.060,
              backgroundColor: textFieldFillColr,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(iconBizkitPng),
              ),
            ),
          )
        ],
      ),
    );
  }
}
