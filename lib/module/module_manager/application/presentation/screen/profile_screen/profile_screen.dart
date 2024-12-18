import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/module_manager/application/controller/auth_controller.dart';
import 'package:bizkit/module/module_manager/application/controller/internet_controller.dart';
import 'package:bizkit/module/module_manager/application/controller/module_controller.dart';
import 'package:bizkit/module/module_manager/application/controller/profile_controller/profile_controller.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/profile_screen/widgets/profile_edit_widgets/profile_image_widget.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:bizkit/utils/show_dialogue/dailog.dart';
import 'package:bizkit/utils/snackbar/flutter_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = Get.find<ProfileController>();
    final moduleController = Get.find<ModuleController>();
    final internetConnectinController =
        Get.find<InternetConnectionController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      profileController.checkEmail.isEmpty
          ? profileController.getProfileDetails()
          : null;
    });
    return SafeArea(
      child: Scaffold(
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
                          return ShimmerLoaderCircle(
                            radius: 35,
                            seprator: adjustWidth(kwidth * .02),
                            scrollDirection: Axis.horizontal,
                            itemCount: 8,
                          );
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
                            profileController.isLoadingName.value
                                ? Column(
                                    children: [
                                      ShimmerLoaderTile(
                                        width: 100.w,
                                        height: 15.h,
                                      ),
                                      kHeight10
                                    ],
                                  )
                                : Text(
                                    profileController.name.value,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                            profileController.isLoadingEmail.value
                                ? ShimmerLoaderTile(width: 100.w, height: 12.h)
                                : Text(profileController.email.value,
                                    style:
                                        Theme.of(context).textTheme.titleSmall)
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
                  if (internetConnectinController.isConnectedToInternet.value) {
                    profileController.getProfileDetails();
                    GoRouter.of(context).pushNamed(Routes.editProfile);
                  } else {
                    showCustomToast(
                      message:
                          'You must be online to access the account settings. Please check your internet connection.',
                      backgroundColor: kred,
                    );
                  }
                },
              ),
              ProfileTiles(
                heading: 'Privacy and Security',
                subtitle: 'Level,Security Prefrences',
                onTap: () {},
              ),
              Obx(() => moduleController.currentModule.value == Module.card
                  ? ProfileTiles(
                      heading: 'Data Management',
                      subtitle: 'Archieved,Delete',
                      onTap: () {
                        GoRouter.of(context)
                            .pushNamed(Routes.dataManagementScreen);
                      },
                    )
                  : kempty),
              // Obx(() => moduleController.currentModule.value == Module.card
              //     ? ProfileTiles(
              //         heading: 'Connections & Networking',
              //         subtitle: 'Blocked,Restricted,Report Connections',
              //         onTap: () {
              //           GoRouter.of(context)
              //               .pushNamed(Routes.connectionsAndNetworking);
              //         },
              //       )
              //     : kempty),
              ProfileTiles(
                heading: 'Help & Support',
                subtitle: 'Contact,Faq etc',
                onTap: () {},
              ),
              // ProfileTiles(
              //   heading: 'Matcho Meter',
              //   onTap: () {
              //     GoRouter.of(context).pushNamed(Routes.machoMeterScreen);
              //   },
              // ),
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
              // TextButton(
              //     onPressed: () {
              //       GoRouter.of(context)
              //           .pushNamed(Routes.matchoMeterConnectionScreen);
              //     },
              //     child: Text(
              //       'Navigate to matcho Meter connection screen',
              //       style: Theme.of(context).textTheme.titleSmall,
              //     )),
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
    return Card(
      elevation: 0,
      child: GestureDetector(
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
                          : Text(subtitle ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(color: kGreyNormal, fontSize: 11)),
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
                    icon: Container(
                      width: 30.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: klightgrey),
                        color: Theme.of(context).colorScheme.onTertiary,
                      ),
                      child: const Icon(
                        Iconsax.arrow_right_3,
                        color: kblack,
                        size: 13,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
