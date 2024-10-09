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
      profileController.getProfileDetails();
    });
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: knill,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              kHeight50,
              SizedBox(
                height: 135.h,
                width: 135.w,
                child: Obx(() {
                  if (profileController.isLoadingImage.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return profileController.image.value.isNotEmpty
                        ? ProfileImagePreview(
                            image: profileController.image.value,
                          )
                        : CircleAvatar(
                            backgroundColor: kgrey,
                            child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: profileController.name.value.isEmpty
                                    ? Icon(
                                        Icons.person,
                                        size: 80.sp,
                                      )
                                    : Text(
                                        style: textHeadStyle1.copyWith(
                                            color: kblack, fontSize: 80.sp),
                                        profileController.name.value.length <= 1
                                            ? profileController.name.value
                                            : profileController.name
                                                .substring(0, 2)
                                                .toUpperCase())));
                  }
                }),
              ),
              kHeight50,
              ProfileTiles(
                heading: 'Edit Personal Details',
                onTap: () {
                  // profileController.getProfileDetails();
                  GoRouter.of(context).pushNamed(Routes.editProfile);
                },
              ),
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
              ProfileTiles(
                heading: 'Matcho Meter',
                onTap: () {
                  GoRouter.of(context).pushNamed(Routes.matchoMeter);
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
