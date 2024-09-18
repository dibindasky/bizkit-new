import 'dart:convert';

import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/connection_detail/connection_detail.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:bizkit/utils/text_field/auto_fill_text_field.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScreenConnectionDetailFilling extends StatefulWidget {
  const ScreenConnectionDetailFilling({super.key, required this.connectionId});

  final String connectionId;

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
                      return ListView.builder(
                        itemCount: controller.connectionSelfieIamges.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.h),
                          height: 200.h,
                          width: 250.h,
                          decoration: BoxDecoration(
                            borderRadius: kBorderRadius10,
                            color: klightGreyClr,
                            image: DecorationImage(
                              image: MemoryImage(base64Decode(
                                  controller.connectionSelfieIamges[index])),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  Positioned(
                      bottom: 10,
                      right: 10,
                      child: GestureDetector(
                          onTap: () => controller.addSelfieimageToList(),
                          child: const CircleAvatar(
                            child: Icon(Icons.add),
                          )))
                ],
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                labelText: 'notes',
                controller: notesController,
              ),
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
                controller: categoryController,
              ),
              const SizedBox(height: 20),
              EventButton(
                  text: 'Update Details',
                  onTap: () {
                    controller.addOrUpdateConnectionDetails(context,
                        connectionDtail: ConnectionDetail());
                  })
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
