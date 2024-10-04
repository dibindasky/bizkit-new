import 'dart:convert';

import 'package:bizkit/module/module_manager/application/controller/profile_controller/profile_controller.dart';
import 'package:bizkit/module/module_manager/domain/model/profile_model/profile_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/show_dialogue/show_dailogue.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';
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
        body: Obx(() {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  kHeight50,
                  SizedBox(
                    width: 135,
                    height: 135,
                    child: Stack(
                      children: [
                        SizedBox(
                            width: 135,
                            height: 135,
                            child: CircleAvatar(
                              backgroundColor: Colors.grey,
                              backgroundImage:
                              controller.image.isNotEmpty?MemoryImage(base64Decode(controller.image.value)):
                                  MemoryImage(base64Decode(imageTestingBase64)),
                            )),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                                onPressed: () {
                                    cameraAndGalleryPickImage(
                                  context: context,
                                  onPressCam: () {
                                    controller.profileIamgePicking(context, true);
                                  },
                                  onPressGallery: () {
                                     controller.profileIamgePicking(context, false);
                                  },
                                  tittle: 'Pick Image');
                                },
                                icon: const Icon(
                                  Icons.camera_alt_rounded,color: neonShade,
                                )))
                      ],
                    ),
                  ),
                  kHeight50,
                  CustomTextFormField(
                    labelText: '',
                    controller: controller.userName,
                    onChanaged: (value) {
                      controller.nameOnChanges(value);
                    },
                    suffixIcon: controller.checkName != controller.name.value
                        ? IconButton(
                            icon: Icon(
                              Icons.save,
                              color: Colors.amber,
                            ),
                            onPressed: () {
                              
                            controller.profileNameEditSave();
                              //TODO add method for save data
                            },
                          )
                        : null,
                  ),
                  kHeight10,
                  CustomTextFormField(labelText: 'email'),
                  kHeight10,
                  CustomTextFormField(labelText: 'Phone'),
                ],
              ),
            ),
          );
        }));
  }
}
