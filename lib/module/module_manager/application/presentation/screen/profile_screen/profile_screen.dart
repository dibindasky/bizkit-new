import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/module_manager/application/controller/auth_controller.dart';
import 'package:bizkit/module/module_manager/application/controller/profile_controller/profile_controller.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/profile_screen/widgets/profile_edit_widgets/profile_image_widget.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/show_dialogue/dailog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = Get.find<ProfileController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      profileController.checkEmail.isEmpty
          ? profileController.getProfileDetails()
          : null;
    });
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   backgroundColor: knill,
        // ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kHeight30,
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: SizedBox(
                      height: 70.h,
                      width: 70.w,
                      child: Obx(() {
                        if (profileController.isLoadingImage.value) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          return profileController.image.value.isNotEmpty
                              ? ProfileImagePreview(
                                  isProfileScreen: true,
                                  image: profileController.image.value,
                                )
                              : CircleAvatar(
                                  backgroundColor: kgrey,
                                  child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: profileController
                                              .name.value.isEmpty
                                          ? Icon(
                                              Icons.person,
                                              size: 40.sp,
                                            )
                                          : Text(
                                              style: textHeadStyle1.copyWith(
                                                  color: kblack,
                                                  fontSize: 40.sp),
                                              profileController
                                                          .name.value.length <=
                                                      1
                                                  ? profileController.name.value
                                                  : profileController.name
                                                      .substring(0, 2)
                                                      .toUpperCase())));
                        }
                      }),
                    ),
                  ),
                  kWidth10,
                  SizedBox(
                    child: Obx(() => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              profileController.name.value,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(profileController.email.value,
                                style: Theme.of(context).textTheme.titleSmall)
                          ],
                        )),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              kHeight20,
              ProfileTiles(
                heading: 'Account Settings',
                subtitle: 'Profile,Name,Email,Phone',
                onTap: () {
                  profileController.getProfileDetails();
                  GoRouter.of(context).pushNamed(Routes.editProfile);
                },
              ),
              ProfileTiles(
                heading: 'Privacy and Security',
                subtitle: 'Level,Security Prefrences',
                onTap: () {},
              ),
              ProfileTiles(
                heading: 'Data Management',
                subtitle: 'Archieved,Data Eport,Delete',
                onTap: () {},
              ),
              ProfileTiles(
                heading: 'Connections & Networking',
                subtitle: 'Blocked,Restricted,Report Connections',
                onTap: () {
                  GoRouter.of(context)
                      .pushNamed(Routes.connectionsAndNetworking);
                },
              ),
              ProfileTiles(
                heading: 'Help & Support',
                subtitle: 'Contact,Faq etc',
                onTap: () {},
              ),
              ProfileTiles(
                heading: 'Matcho Meter',
                onTap: () {
                  GoRouter.of(context).pushNamed(Routes.machoMeterScreen);
                },
              ),
              ProfileTiles(
                heading: 'Log Out',
                onTap: () {
                  showConfirmationDialog(
                    actionButton: 'Log-out',
                    heading: 'Are you sure want to logout',
                    context,
                    onPressed: () {
                      Get.find<AuthenticationController>().logOut(context);
                      profileController.clearData();
                    },
                  );
                },
              ),
            ],
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
    this.subtitle,
    this.onTap,
  }) : super(key: key);
  final Widget? widget;
  final String heading;
  final String? subtitle;
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
        padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
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
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontSize: 15)),
                    subtitle == null
                        ? const SizedBox()
                        : Text(subtitle!,
                            style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: kGreyNormal)),
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
                    color: kblack,
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
