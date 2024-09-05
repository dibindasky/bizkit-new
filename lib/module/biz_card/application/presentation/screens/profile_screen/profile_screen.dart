import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/module/biz_card/application/presentation/widgets/show_case_view.dart';
import 'package:bizkit/module/module_manager/application/controller/auth_controller.dart';
import 'package:bizkit/service/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/dailog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  // final GlobalKey globalKeyProfilPicUploading = GlobalKey();
  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   SharedPreferences.getInstance().then((prefs) async {
    //     final showed =
    //         await SecureStorage.getHomeShowCaseViwed(homeScreenShowCase);
    //     setState(() {
    //       isShowcaseSeen = showed;
    //     });
    //     if (!isShowcaseSeen) {
    //       ShowCaseWidget.of(context)
    //           .startShowCase([globalKeyProfilPicUploading]);
    //       await SecureStorage.setHomeShowCaseViwed(homeScreenShowCase);
    //     }
    //   });
    // });
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
      (timeStamp) {
        // context.read<ProfileBloc>().add(
        //     const ProfileEvent.getProfile(isLoad: false),
        //   );
      },
    );
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: knill,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: FadeTransition(
            opacity: animation,
            child: Column(
              children: [
                // Positioned(
                //   bottom: 0,
                //   right: 20,
                //   child: Container(
                //     decoration: BoxDecoration(
                //       color: neonShade,
                //       borderRadius: BorderRadius.circular(6),
                //     ),
                //     height: 30,
                //     width: 34,
                //     child: InkWell(
                //       onTap: () {
                //         cardscanimagesSelectingDailogue(context);
                //       },
                //       child: const Icon(
                //         Icons.add,
                //       ),
                //     ),
                //   ),
                // ),
                adjustHieght(khieght * .06),
                // const ProfileTiles(
                //   heading: 'Account Settings',
                //   subtittle: 'Username, Password, Email, Report Problem Etc.',
                //   widget: AccountSettigsScreen(),
                // ),
                // BlocBuilder<ProfileBloc, ProfileState>(
                //   builder: (context, state) {
                //     return !state.isBusiness
                //         ? const ProfileTiles(
                //             heading: 'Privacy and Security',
                //             subtittle: 'Level Or Security Preferences Etc.',
                //             widget: PrivacyAndSecurityScreen(),
                //           )
                //         : kempty;
                //   },
                // ),
                // const ProfileTiles(
                //   heading: 'Data Management',
                //   subtittle: 'Archived Cards, Soft Deleted Cards.',
                //   widget: DataManagement(),
                // ),
                // ProfileTiles(
                //   heading: 'Connections & Networking',
                //   subtittle: 'Blocked Connections$business',
                //   widget: const ConnectionNetworkScreen(),
                // ),
                // const ProfileTiles(
                //   heading: 'Help & Support',
                //   subtittle: ' Faq',
                //   widget: HelpSupport(),
                // ),
                ProfileTiles(
                  heading: 'Log Out',
                  onTap: () {
                    showConfirmationDialog(
                      actionButton: 'Log-out',
                      heading: 'Are you sure want to logout from Bizkit',
                      context,
                      onPressed: () {
                        Get.find<AuthenticationController>().logOut(context);
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
          Navigator.of(context).push(cardFadePageRoute(widget!));
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
                      Navigator.of(context).push(cardFadePageRoute(widget!));
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
          },
          style: ElevatedButton.styleFrom(
              foregroundColor: kwhite, side: const BorderSide(color: kwhite)),
          child: const Text('Gallery'),
        ),
        adjustHieght(khieght * .02),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
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
