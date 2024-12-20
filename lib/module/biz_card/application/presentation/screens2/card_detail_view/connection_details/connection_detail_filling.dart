import 'dart:convert';

import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/card_detail_model.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/connection_detail/connection_detail.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:bizkit/utils/text_field/auto_fill_text_field.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScreenConnectionDetailFilling extends StatefulWidget {
  const ScreenConnectionDetailFilling({super.key, this.cardDetailModel});

  final CardDetailModel? cardDetailModel;

  @override
  State<ScreenConnectionDetailFilling> createState() =>
      _ScreenConnectionDetailFillingState();
}

class _ScreenConnectionDetailFillingState
    extends State<ScreenConnectionDetailFilling> {
  TextEditingController notesController = TextEditingController();
  TextEditingController occasionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  @override
  initState() {
    Get.find<ConnectionsController>()
        .restConnectionDetails(widget.cardDetailModel?.selfie ?? <String>[]);
    if (widget.cardDetailModel != null) {
      notesController.text = widget.cardDetailModel?.notes ?? '';
      occasionController.text = widget.cardDetailModel?.occasion ?? '';
      locationController.text = widget.cardDetailModel?.location ?? '';
      categoryController.text = widget.cardDetailModel?.category ?? '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ConnectionsController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Make a Biskit Card'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 200.h,
                    child: Obx(() {
                      if (controller.connectionSelfieIamges.isEmpty) {
                        return const Center(child: Icon(Icons.image));
                      }
                      return ListView.builder(
                        itemCount: controller.connectionSelfieIamges.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 5.h),
                              height: 200.h,
                              width: 250.h,
                              decoration: BoxDecoration(
                                borderRadius: kBorderRadius10,
                                color: klightGreyClr,
                                image: DecorationImage(
                                  image: MemoryImage(base64Decode(controller
                                      .connectionSelfieIamges[index])),
                                  fit: BoxFit.cover,
                                  onError: (exception, stackTrace) =>
                                      const Icon(Icons.image),
                                ),
                              ),
                            ),
                            Positioned(
                                right: 10.h,
                                top: 10.h,
                                child: GestureDetector(
                                  onTap: () =>
                                      controller.removeSelfieImage(index),
                                  child: const CircleAvatar(
                                    backgroundColor: klightGrey,
                                    child: Icon(
                                      Icons.delete,
                                      color: kblack,
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      );
                    }),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: () => showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Choose an option'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                leading: const Icon(Icons.camera_alt),
                                title: const Text('Take a photo'),
                                onTap: () {
                                  Navigator.of(context).pop();
                                  controller.addSelfieimageToList(
                                      cameraOrGallery: true);
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.photo_library),
                                title: const Text('Choose from gallery'),
                                onTap: () {
                                  Navigator.of(context).pop();
                                  controller.addSelfieimageToList(
                                      cameraOrGallery: false);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      child: const CircleAvatar(
                        child: Icon(Icons.add),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                  labelText: 'notes', controller: notesController),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Occasion', controller: occasionController),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Location', controller: locationController),
              const SizedBox(height: 10),
              AutocompleteTextField(
                  label: 'Category',
                  autocompleteItems: bizcardCategories,
                  controller: categoryController),
              const SizedBox(height: 20),
              Obx(() {
                return controller.connectionDetailLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : EventButton(
                        text: 'Update Details',
                        onTap: () {
                          controller.addOrUpdateConnectionDetails(context,
                              connectionDtail: ConnectionDetail(
                                  category: categoryController.text,
                                  connectionId:
                                      widget.cardDetailModel?.connectionId ??
                                          '',
                                  location: locationController.text,
                                  notes: notesController.text,
                                  occasion: occasionController.text,
                                  selfie: controller.connectionSelfieIamges));
                        });
              })
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
