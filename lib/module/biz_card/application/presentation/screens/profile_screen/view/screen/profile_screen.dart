// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/business_logic/auth/login/auth_bloc.dart';
import 'package:bizkit/module/biz_card/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/module/biz_card/application/business_logic/card_second/card_second_bloc.dart';
import 'package:bizkit/module/biz_card/application/business_logic/connections/connection_request/connection_request_bloc.dart';
import 'package:bizkit/module/biz_card/application/business_logic/notification/notification_bloc.dart';
import 'package:bizkit/module/biz_card/application/business_logic/profile/profile_bloc.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/profile_screen/view/screen/account_settings/account_settings_scree.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/profile_screen/view/screen/connection_network/connection_network_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/profile_screen/view/screen/data_management/data_management.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/profile_screen/view/screen/help_support/help_support.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/profile_screen/view/screen/privacy_security/privacy_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/widgets/show_case_view.dart';
import 'package:bizkit/module/biz_card/data/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/dailog.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  bool isShowcaseSeen = false;
  final homeScreenShowCase = 'isShowcaseProfile';
  final GlobalKey globalKeyProfilPicUploading = GlobalKey();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      SharedPreferences.getInstance().then((prefs) async {
        final showed =
            await SecureStorage.getHomeShowCaseViwed(homeScreenShowCase);
        setState(() {
          isShowcaseSeen = showed;
        });
        if (!isShowcaseSeen) {
          ShowCaseWidget.of(context)
              .startShowCase([globalKeyProfilPicUploading]);
          await SecureStorage.setHomeShowCaseViwed(homeScreenShowCase);
        }
      });
    });
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = Tween<double>(begin: 0, end: 1).animate(animationController);
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  String business = '';

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => context.read<ProfileBloc>().add(
            const ProfileEvent.getProfile(isLoad: false),
          ),
    );
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: knill,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: FadeTransition(
            opacity: animation,
            child: Column(
              children: [
                BlocConsumer<ProfileBloc, ProfileState>(
                  listenWhen: (previous, current) {
                    return previous.updateUserInfoModel !=
                        current.updateUserInfoModel;
                  },
                  listener: (context, state) {
                    if (state.hasError) {
                      showSnackbar(context, message: errorMessage);
                    }
                    if (state.updateUserInfoModel != null) {
                      showSnackbar(context, message: 'Profile updated');
                    }
                  },
                  builder: (context, state) {
                    if (state.isBusiness) {
                      business = ', Business Users';
                    }
                    String base64String = '';
                    if ((state.getUserInfoModel != null &&
                        state.getUserInfoModel!.results != null &&
                        state.getUserInfoModel!.results!.profilePic != null &&
                        state.getUserInfoModel!.results!.profilePic!
                            .isNotEmpty)) {
                      final image =
                          state.getUserInfoModel!.results!.profilePic!;
                      base64String = image;
                      base64String = image.replaceFirst(
                          RegExp(r'data:image/jpg;base64,'), '');
                    }
                    return Stack(
                      children: [
                        CircleAvatar(
                          radius: 70,
                          backgroundColor: neonShade,
                          child: state.profileLoading
                              ? const CircularProgressIndicator(
                                  color: backgroundColour,
                                )
                              : (state.getUserInfoModel != null &&
                                      state.getUserInfoModel!.results != null &&
                                      state.getUserInfoModel!.results!
                                              .profilePic !=
                                          null &&
                                      state.getUserInfoModel!.results!
                                          .profilePic!.isNotEmpty)
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(67),
                                      child: Image.memory(
                                        base64.decode(base64String),
                                        width: 134,
                                        height: 134,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : CustomShowCaseView(
                                      image: personImage,
                                      globalKey: globalKeyProfilPicUploading,
                                      tittle: 'Add your Profile image',
                                      description: '',
                                      child: const CircleAvatar(
                                        radius: 66,
                                        backgroundColor: backgroundColour,
                                        child: Center(
                                          child: Icon(
                                            Icons.person,
                                            color: neonShade,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 20,
                          child: Container(
                            decoration: BoxDecoration(
                              color: neonShade,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            height: 30,
                            width: 34,
                            child: InkWell(
                              onTap: () {
                                cardscanimagesSelectingDailogue(context);
                              },
                              child: const Icon(
                                Icons.add,
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
                adjustHieght(khieght * .06),
                const ProfileTiles(
                  heading: 'Account Settings',
                  subtittle: 'Username, Password, Email, Report Problem Etc.',
                  widget: AccountSettigsScreen(),
                ),
                BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                    return !state.isBusiness
                        ? const ProfileTiles(
                            heading: 'Privacy and Security',
                            subtittle: 'Level Or Security Preferences Etc.',
                            widget: PrivacyAndSecurityScreen(),
                          )
                        : kempty;
                  },
                ),
                const ProfileTiles(
                  heading: 'Data Management',
                  subtittle: 'Archived Cards, Soft Deleted Cards.',
                  widget: DataManagement(),
                ),
                ProfileTiles(
                  heading: 'Connections & Networking',
                  subtittle: 'Blocked Connections$business',
                  widget: const ConnectionNetworkScreen(),
                ),
                const ProfileTiles(
                  heading: 'Help & Support',
                  subtittle: ' Faq',
                  widget: HelpSupport(),
                ),
                ProfileTiles(
                  heading: 'Log Out',
                  onTap: () {
                    showConfirmationDialog(
                      actionButton: 'Log-out',
                      heading: 'Are you sure want to logout from Bizkit',
                      context,
                      onPressed: () {
                        context
                            .read<CardSecondBloc>()
                            .add(const CardSecondEvent.clear());
                        context.read<AuthBloc>().add(const AuthEvent.logOut());
                        context.read<CardBloc>().add(const CardEvent.clear());
                        context
                            .read<ConnectionRequestBloc>()
                            .add(const ConnectionRequestEvent.clear());
                        context
                            .read<NotificationBloc>()
                            .add(const NotificationEvent.clear());
                        context.go(Routes.loginPage);
                      },
                    );
                  },
                ),
              ],
            ),
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
    this.onTap,
  }) : super(key: key);
  final Widget? widget;
  final String heading;
  final String? subtittle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        } else {
          Navigator.of(context).push(fadePageRoute(widget!));
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: ColoredBox(
          color: textFieldFillColr,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(heading,
                        style: TextStyle(
                          fontSize: kwidth * 0.045,
                          fontWeight: FontWeight.w200,
                          color: kwhite,
                        )),
                    subtittle == null
                        ? const SizedBox()
                        : Text(
                            subtittle!,
                            style: TextStyle(
                              fontSize: kwidth * 0.03,
                              fontWeight: FontWeight.w200,
                              color: klightgrey,
                            ),
                          ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    if (onTap != null) {
                      onTap!();
                    } else {
                      Navigator.of(context).push(fadePageRoute(widget!));
                    }
                  },
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
      ),
    );
  }
}

Future<dynamic> cardscanimagesSelectingDailogue(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            context
                .read<ProfileBloc>()
                .add(const ProfileEvent.pickImageScanning(camera: false));
          },
          style: ElevatedButton.styleFrom(
              foregroundColor: kwhite, side: const BorderSide(color: kwhite)),
          child: const Text('Gallery'),
        ),
        adjustHieght(khieght * .02),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            context
                .read<ProfileBloc>()
                .add(const ProfileEvent.pickImageScanning(camera: true));
          },
          style: ElevatedButton.styleFrom(
              foregroundColor: kwhite, side: const BorderSide(color: kwhite)),
          child: const Text('Camera'),
        )
      ],
      title: const Text('Take a picture or upload an image'),
    ),
  );
}