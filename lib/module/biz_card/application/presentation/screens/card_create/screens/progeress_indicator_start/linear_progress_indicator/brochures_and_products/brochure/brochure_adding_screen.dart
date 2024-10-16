import 'dart:convert';

import 'package:bizkit/core/model/pdf/pdf_model.dart';
import 'package:bizkit/module/biz_card/application/controller/card/business_details.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/brochure.dart';
import 'package:bizkit/packages/pdf/pdf_picker.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/pdf/pdf_preview_screen.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class ScreenBrochureAdding extends StatefulWidget {
  const ScreenBrochureAdding({super.key, this.brochure, this.selectedIndex});
  final Brochure? brochure;
  final int? selectedIndex;

  @override
  State<ScreenBrochureAdding> createState() => _ScreenBrochureAddingState();
}

class _ScreenBrochureAddingState extends State<ScreenBrochureAdding> {
  @override
  void initState() {
    if (widget.brochure != null) {
      final bussinessController = Get.find<BusinesDetailsController>();
      bussinessController.pdf = widget.brochure!.file == null
          ? null
          : PdfModel(base64: widget.brochure!.file);
      bussinessController.businessBroshureLebel.text =
          widget.brochure!.title ?? '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bussinessController = Get.find<BusinesDetailsController>();
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios_sharp, size: 17)),
            title: const Text('Brochure')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  kHeight10,
                  const Align(
                      alignment: Alignment.centerLeft, child: Text('Title')),
                  kHeight10,
                  CustomTextFormField(
                      textCapitalization: TextCapitalization.sentences,
                      labelText: 'Title',
                      controller: bussinessController.businessBroshureLebel),
                  kHeight10,
                  bussinessController.pdf == null
                      ? const SizedBox()
                      : SizedBox(
                          height: khieght * 0.4,
                          child: Stack(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ScreenPdfPreview(
                                            base64: bussinessController
                                                .pdf!.base64!,
                                            label: bussinessController
                                                .businessBroshureLebel.text),
                                      ));
                                },
                                child: AspectRatio(
                                    aspectRatio: 0.705,
                                    child: PdfViewer.openData(base64.decode(
                                        bussinessController.pdf!.base64!
                                                .startsWith("data")
                                            ? bussinessController.pdf!.base64!
                                                .substring(
                                                    "data:application/pdf;base64,"
                                                        .length)
                                            : bussinessController
                                                .pdf!.base64!))),
                              ),
                            ],
                          ),
                        ),
                  kHeight10,
                  InkWell(
                    onTap: () async {
                      bussinessController.pdf = await PdfPickerImpl().getPdf();
                      if (bussinessController.pdf != null && mounted) {
                        // bussinessController.businessBroshureLebel.text =
                        //     bussinessController.pdf?.file?.path
                        //             .split('/')
                        //             .last
                        //             .replaceFirst('.pdf', '') ??
                        //         '';
                        setState(() {});
                      }
                    },
                    child: DottedBorder(
                      dashPattern: const [8, 8],
                      color: neonShade,
                      strokeWidth: 2.5,
                      child: SizedBox(
                        width: double.infinity,
                        height: 81.dm,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 32.dm,
                              height: 32.dm,
                              child: const CircleAvatar(
                                child: Icon(
                                  Icons.add,
                                ),
                              ),
                            ),
                            kHeight10,
                            Text(
                              bussinessController.pdf != null
                                  ? 'Change Brochure'
                                  : 'Choose Brochure',
                              style: TextStyle(fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  kHeight20,
                  Obx(
                    () => bussinessController.brochureLoading.value
                        ? const LoadingAnimation()
                        : EventButton(
                            text: widget.brochure?.id == null
                                ? "Add Brochure"
                                : 'Update Brochure',
                            onTap: () {
                              if (bussinessController
                                      .businessBroshureLebel.text.isEmpty ||
                                  bussinessController.pdf == null) {
                                showSnackbar(context,
                                    message: bussinessController
                                            .businessBroshureLebel.text.isEmpty
                                        ? 'Add Brochure Title'
                                        : 'Add Brochure',
                                    backgroundColor: kred);
                                return;
                              }
                              if (widget.brochure == null) {
                                bussinessController.addBrochure(
                                    context: context);
                              } else {
                                bussinessController.brochureUpdate(
                                    context: context,
                                    brochureIndex: widget.selectedIndex ?? 0);
                              }
                            }),
                  ),
                  kHeight20,
                ]),
          ),
        ));
  }
}
