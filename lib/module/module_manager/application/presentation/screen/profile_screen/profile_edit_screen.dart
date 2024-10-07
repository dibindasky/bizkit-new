import 'package:bizkit/module/module_manager/application/controller/profile_controller/profile_controller.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/profile_screen/widgets/profile_edit_widgets/profile_image_widget.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScreenProfileEdit extends StatelessWidget {
  const ScreenProfileEdit({super.key});

 

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find<ProfileController>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile Screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                kHeight50,
                GetBuilder<ProfileController>(
                  id: 'image',
                  builder: (controller) => controller.imageChangingLoading.value
                      ? SizedBox(height: 135.h,width: 135.w,child:const Center(child: CircularProgressIndicator()),)
                      : ProfileImagePreview(
                          image: controller.image.value.isEmpty
                              ? imageTestingBase64
                              : controller.image.value,
                          onCamPressed: () {
                            controller.profileIamgePicking(context, true);
                          },
                          onGalleryPressed: () =>
                              controller.profileIamgePicking(context, false),
                        ),
                ),
                kHeight50,
                Obx(() {
                  return CustomTextFormField(
                    labelText: 'Name',
                    controller: controller.userName,
                    onChanaged: (value) {
                      controller.nameOnChanges(value);
                    },
                    
                    suffixIcon:controller.nameChangingLoading.value?const Padding(
                      padding:  EdgeInsets.only(right: 10),
                      child: SizedBox(width: 50, child: LoadingAnimation()),
                    ) :
                     controller.checkName != controller.name.value&&controller.name.value.isNotEmpty
                        ? IconButton(
                            icon:const Icon(
                              Icons.save,
                              color: Colors.amber,
                            ),
                            onPressed: () {
                              controller.profileNameEditSave();
                            },
                          )
                        : null,
                  );
                }),
                kHeight10,
                Obx(() {
                  return Form(
                    key: controller.mailKey,
                    child: CustomTextFormField(
                      inputType: TextInputType.emailAddress,
                      validate: Validate.email,
                        labelText: 'Email',
                        controller: controller.userMail,
                        onChanaged: (value) {
                          controller.emailOnChanges(value);
                        },
                        suffixIcon:
                            controller.checkEmail != controller.email.value
                                ? IconButton(
                                    onPressed: () {},
                                    icon:const Icon(Icons.check_box_outlined))
                                : null),
                  );
                }),
                kHeight10,
                Form(
                  key: controller.phoneKey,
                  child: CustomTextFormField(
                    inputType: TextInputType.number,
                    validate: Validate.phone,
                    labelText: 'Phone',
                    controller: controller.userPhone,
                    onChanaged: (value) {
                      controller.phoneOnChanges(value);
                    },
                    suffixIcon: controller.checkPhone != controller.phone.value
                        ? IconButton(
                            icon:const Icon(
                              Icons.save,
                              color: Colors.amber,
                            ),
                            onPressed: () {
                            controller.updateEmail(context);
                            },
                          )
                        : null,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
