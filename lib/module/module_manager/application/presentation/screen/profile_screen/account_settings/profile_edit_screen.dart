import 'package:bizkit/module/module_manager/application/controller/profile_controller/profile_controller.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/profile_screen/widgets/profile_edit_widgets/profile_image_widget.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:bizkit/utils/show_dialogue/show_dailogue.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ScreenProfileEdit extends StatelessWidget {
  const ScreenProfileEdit({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find<ProfileController>();
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            kHeight20,
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pop(context);
                  },
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 18.sp,
                      color: Theme.of(context).colorScheme.onTertiary,
                    ),
                  ),
                ),
                adjustWidth(20.w),
                Text(
                  'Edit Profile',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            ),
            kHeight50,
            Obx(() {
              if (controller.isLoadingImage.value) {
                return SizedBox(
                  height: 135.h,
                  width: 135.w,
                  child: const Center(child: CircularProgressIndicator()),
                );
              } else {
                return controller.imageChangingLoading.value
                    ? SizedBox(
                        height: 135.h,
                        width: 135.w,
                        child: const Center(child: CircularProgressIndicator()),
                      )
                    : controller.image.value.isNotEmpty
                        ? ProfileImagePreview(
                            isProfileScreen: false,
                            image: controller.image.value,
                            onCamPressed: () {
                              controller.profileIamgePicking(context, true);
                            },
                            onGalleryPressed: () =>
                                controller.profileIamgePicking(context, false),
                          )
                        : SizedBox(
                            width: 135.w,
                            height: 135.h,
                            child: Stack(children: [
                              Stack(
                                children: [
                                  SizedBox(
                                      width: 135.w,
                                      height: 135.h,
                                      child: CircleAvatar(
                                          backgroundColor: kgrey,
                                          child: FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: Text(
                                                  style:
                                                      textHeadStyle1.copyWith(
                                                          color: kblack,
                                                          fontSize: 80.sp),
                                                  controller.name.value
                                                              .length <=
                                                          1
                                                      ? controller.name.value
                                                      : controller.name
                                                          .substring(0, 2)
                                                          .toUpperCase())))),
                                  Align(
                                      alignment: Alignment.bottomRight,
                                      child: IconButton(
                                          onPressed: () {
                                            cameraAndGalleryPickImage(
                                                context: context,
                                                onPressCam: () {
                                                  controller
                                                      .profileIamgePicking(
                                                          context, true);
                                                },
                                                onPressGallery: () {
                                                  controller
                                                      .profileIamgePicking(
                                                          context, false);
                                                },
                                                tittle: 'Pick Image');
                                          },
                                          icon: const Icon(
                                            Icons.camera_alt_rounded,
                                            color: neonShade,
                                          ))),
                                ],
                              ),
                            ]),
                          );
              }
            }),
            kHeight50,
            Obx(() {
              return controller.isLoadingName.value
                  ? ShimmerLoaderTile(width: double.infinity, height: 35.h)
                  : CustomTextFormField(
                      labelText: 'Name',
                      controller: controller.userName,
                      onChanaged: (value) {
                        controller.nameOnChanges(value);
                      },
                      suffixIcon: controller.nameChangingLoading.value
                          ? const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: SizedBox(
                                  width: 50, child: LoadingAnimation()),
                            )
                          : controller.checkName != controller.name.value &&
                                  controller.name.value.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(
                                    Icons.check_circle_outline,
                                    color: neonShade,
                                  ),
                                  onPressed: () {
                                    controller.profileNameEditSave(context);
                                  },
                                )
                              : null,
                    );
            }),
            kHeight10,
            Obx(() {
              return Form(
                key: controller.mailKey,
                child: controller.isLoadingEmail.value
                    ? ShimmerLoaderTile(width: double.infinity, height: 35.h)
                    : CustomTextFormField(
                        inputType: TextInputType.emailAddress,
                        validate: Validate.email,
                        labelText: 'Email',
                        controller: controller.userMail,
                        onChanaged: (value) {
                          controller.emailOnChanges(value);
                        },
                        suffixIcon: controller.emailChangingLoading.value
                            ? const Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: SizedBox(
                                    width: 50, child: LoadingAnimation()),
                              )
                            : controller.checkEmail != controller.email.value
                                ? IconButton(
                                    onPressed: () {
                                      controller.updateEmail(context);
                                    },
                                    icon: const Icon(
                                      Icons.check_circle_outline,
                                      color: neonShade,
                                    ))
                                : null),
              );
            }),
            kHeight10,
            Obx(() {
              return Form(
                key: controller.phoneKey,
                child: controller.isLoadingPhone.value
                    ? ShimmerLoaderTile(width: double.infinity, height: 35.h)
                    : CustomTextFormField(
                        inputType: TextInputType.number,
                        validate: Validate.phone,
                        labelText: 'Phone',
                        controller: controller.userPhone,
                        onChanaged: (value) {
                          controller.phoneOnChanges(value);
                        },
                        suffixIcon: controller.phoneChangingLoading.value
                            ? const Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: SizedBox(
                                    width: 50, child: LoadingAnimation()),
                              )
                            : controller.checkPhone != controller.phone.value
                                ? IconButton(
                                    icon: const Icon(
                                      Icons.check_circle_outline,
                                      color: neonShade,
                                    ),
                                    onPressed: () {
                                      controller.updatePhone(context);
                                    },
                                  )
                                : null,
                      ),
              );
            }),
          ],
        ),
      ),
    ));
  }
}
