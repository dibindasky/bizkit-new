import 'dart:convert';

import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/card_detail_model.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/connection_detail/connection_detail.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
import 'package:bizkit/utils/text_field/auto_fill_text_field.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:bizkit/utils/validators/validators.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class BizCardConnectionDetailUpdateScreen extends StatefulWidget {
  const BizCardConnectionDetailUpdateScreen({super.key, this.cardDetailModel});

  final CardDetailModel? cardDetailModel;
  @override
  State<BizCardConnectionDetailUpdateScreen> createState() =>
      _BizCardConnectionDetailUpdateScreenState();
}

class _BizCardConnectionDetailUpdateScreenState
    extends State<BizCardConnectionDetailUpdateScreen> {
  TextEditingController notesController = TextEditingController();
  TextEditingController occasionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  @override
  initState() {
    controller
        .restConnectionDetails(widget.cardDetailModel?.selfie ?? <String>[]);
    if (widget.cardDetailModel != null) {
      notesController.text = widget.cardDetailModel?.notes ?? '';
      occasionController.text = widget.cardDetailModel?.occasion ?? '';
      locationController.text = widget.cardDetailModel?.location ?? '';
      categoryController.text = widget.cardDetailModel?.category ?? '';
    }
    super.initState();
  }

  final controller = Get.find<ConnectionsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          kHeight40,
          Row(
            children: [
              kWidth20,
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).pop();
                },
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 15.sp,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ),
              kWidth10,
              Text('Connection Details',
                  style: Theme.of(context).textTheme.displayMedium),
              const Spacer(),
            ],
          ),
          kHeight10,
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // images
                    Stack(
                      children: [
                        SizedBox(
                          height: 200.h,
                          child: Obx(() {
                            if (controller.connectionSelfieIamges.isEmpty) {
                              return const Center(child: Icon(Icons.image));
                            }
                            return ListView.builder(
                              itemCount:
                                  controller.connectionSelfieIamges.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Stack(
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 5.h),
                                    height: 200.h,
                                    width: 250.h,
                                    decoration: BoxDecoration(
                                      borderRadius: kBorderRadius10,
                                      color: klightGreyClr,
                                      image: isURLValid(controller
                                              .connectionSelfieIamges[index])
                                          ? null
                                          : DecorationImage(
                                              image: MemoryImage(base64Decode(
                                                  controller
                                                          .connectionSelfieIamges[
                                                      index])),
                                              fit: BoxFit.cover,
                                              onError:
                                                  (exception, stackTrace) =>
                                                      const Icon(Icons.image),
                                            ),
                                    ),
                                    child: isURLValid(controller
                                            .connectionSelfieIamges[index])
                                        ? NetworkImageWithLoader(
                                            controller
                                                .connectionSelfieIamges[index],
                                            radius: 10)
                                        : null,
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
                    kHeight20,
                    CustomTextFormField(
                        labelText: 'notes', controller: notesController),
                    kHeight10,
                    CustomTextFormField(
                        labelText: 'Occasion', controller: occasionController),
                    kHeight10,
                    CustomTextFormField(
                        labelText: 'Location', controller: locationController),
                    kHeight10,
                    AutocompleteTextField(
                        label: 'Category',
                        autocompleteItems: bizcardCategories,
                        controller: categoryController),
                    kHeight20,
                    Obx(() {
                      return controller.connectionDetailLoading.value
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : EventButton(
                              showGradiant: false,
                              text: 'Update Details',
                              onTap: () {
                                print(
                                    'updation on tap -----> ${widget.cardDetailModel?.connectionId}');
                                controller.addOrUpdateConnectionDetails(context,
                                    connectionDtail: ConnectionDetail(
                                        category: categoryController.text,
                                        connectionId: widget.cardDetailModel
                                                ?.connectionId ??
                                            '',
                                        location: locationController.text,
                                        notes: notesController.text,
                                        occasion: occasionController.text,
                                        selfie: controller
                                            .connectionSelfieIamges
                                            .map((e) => e)
                                            .toList()));
                              });
                    })
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
