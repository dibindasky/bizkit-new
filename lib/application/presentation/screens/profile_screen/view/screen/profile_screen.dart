import 'package:bizkit/application/business_logic/auth/login/auth_bloc.dart';
import 'package:bizkit/application/business_logic/profile/profile_bloc.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/routes/routes.dart';
import 'package:bizkit/application/presentation/screens/profile_screen/view/screen/account_settings/account_settings_scree.dart';
import 'package:bizkit/application/presentation/screens/profile_screen/view/screen/connection_network/connection_network_screen.dart';
import 'package:bizkit/application/presentation/screens/profile_screen/view/screen/data_management/data_management.dart';
import 'package:bizkit/application/presentation/screens/profile_screen/view/screen/help_support/help_support.dart';
import 'package:bizkit/application/presentation/screens/profile_screen/view/screen/privacy_security/privacy_screen.dart';
import 'package:bizkit/application/presentation/utils/dailog.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
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
                    if (state.updateUserInfoModel != null) {
                      showSnackbar(context, message: 'Profile updated');
                    }
                  },
                  builder: (context, state) {
                    String base64String = '';
                    if ((state.getUserInfoModel != null &&
                        state.getUserInfoModel!.results != null &&
                        state.getUserInfoModel!.results!.profilePic != null)) {
                      final image = state.getUserInfoModel!.results!.profilePic;
                      base64String = image!;
                      base64String = base64String.replaceFirst(
                          RegExp(r'data:image/jpg;base64,'), '');
                    }

                    return Stack(
                      children: [
                        CircleAvatar(
                          radius: 70,
                          backgroundColor: neonShade,
                          child: state.isLoading
                              ? const CircularProgressIndicator(
                                  color: backgroundColour,
                                )
                              : (state.getUserInfoModel != null &&
                                      state.getUserInfoModel!.results != null &&
                                      state.getUserInfoModel!.results!
                                              .profilePic !=
                                          null)
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(67),
                                      child: Image.network(
                                        state.getUserInfoModel!.results!
                                            .profilePic!,
                                        width: 134,
                                        height: 134,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : const CircleAvatar(
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
                        Positioned(
                          bottom: 0,
                          right: 20,
                          child: Container(
                            decoration: BoxDecoration(
                                color: neonShade,
                                borderRadius: BorderRadius.circular(6)),
                            height: 30,
                            width: 34,
                            child: InkWell(
                              onTap: () {
                                cardscanimagesSelectingDailogue(context);
                              },
                              child: const Icon(
                                Icons.camera,
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
                const ProfileTiles(
                  heading: 'Help & support',
                  subtittle: 'Contact, Faq etc.',
                  widget: HelpSupport(),
                ),
                ProfileTiles(
                  heading: 'Logout',
                  onTap: () {
                    showConfirmationDialog(
                      actionButton: 'Log-out',
                      heading: 'Are really want to logout from Bizkit',
                      context,
                      onPressed: () {
                        context.read<AuthBloc>().add(const AuthEvent.logOut());
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
