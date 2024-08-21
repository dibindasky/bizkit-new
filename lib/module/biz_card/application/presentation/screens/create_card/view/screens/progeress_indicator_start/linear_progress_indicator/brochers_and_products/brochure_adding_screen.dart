import 'dart:convert';

import 'package:bizkit/core/model/pdf/pdf_model.dart';
import 'package:bizkit/packages/pdf/pdf_picker.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:bizkit/utils/pdf/pdf_preview_screen.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class ScreenBrochureAdding extends StatefulWidget {
  const ScreenBrochureAdding({super.key});
  // final Brochure? brochure;

  @override
  State<ScreenBrochureAdding> createState() => _ScreenBrochureAddingState();
}

class _ScreenBrochureAddingState extends State<ScreenBrochureAdding> {
  PdfModel? pdf;

  @override
  void initState() {
    // if (widget.brochure != null) {
    //   pdf = widget.brochure!.file == null
    //       ? null
    //       : PdfModel(base64: widget.brochure!.file);
    //   context.read<BusinessDataBloc>().brochureLabelController.text =
    //       widget.brochure!.label ?? '';
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Brochure'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  adjustHieght(10),
                  const Align(
                      alignment: Alignment.centerLeft, child: Text('Label')),
                  const CustomTextFormField(
                    textCapitalization: TextCapitalization.words,
                    labelText: 'Label',
                    // controller: context
                    //     .read<BusinessDataBloc>()
                    //     .brochureLabelController,
                  ),
                  adjustHieght(10),
                  pdf == null
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
                                            base64: pdf!.base64!, label: ''),
                                      ));
                                },
                                child: AspectRatio(
                                    aspectRatio: 0.705,
                                    child: PdfViewer.openData(base64.decode(
                                        pdf!.base64!.startsWith("data")
                                            ? pdf!.base64!.substring(
                                                "data:application/pdf;base64,"
                                                    .length)
                                            : pdf!.base64!))),
                              ),
                              Positioned(
                                right: 0,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      pdf = null;
                                      // context
                                      //     .read<BusinessDataBloc>()
                                      //     .brochureLabelController
                                      //     .text = '';
                                    });
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: const ColoredBox(
                                        color: neonShade,
                                        child: Padding(
                                          padding: EdgeInsets.all(3.0),
                                          child: Icon(Icons.close),
                                        )),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                  adjustHieght(40),
                  EventButton(
                      text: "Add Brochure",
                      onTap: () {
                        // if (widget.brochure == null) {
                        //   context.read<BusinessDataBloc>().add(
                        //         BusinessDataEvent.addBrochure(
                        //           brochure: Brochure(
                        //             cardId: state.currentCard?.id,
                        //             file: pdf!.base64,
                        //             label: context
                        //                 .read<BusinessDataBloc>()
                        //                 .brochureLabelController
                        //                 .text
                        //                 .trim(),
                        //           ),
                        //         ),
                        //       );
                        // } else {
                        //   context.read<BusinessDataBloc>().add(
                        //         BusinessDataEvent.updateBrochure(
                        //           brochure: Brochure(
                        //               cardId: state.currentCard?.id,
                        //               file: pdf!.base64,
                        //               label: context
                        //                   .read<BusinessDataBloc>()
                        //                   .brochureLabelController
                        //                   .text
                        //                   .trim(),
                        //               id: widget.brochure!.id),
                        //         ),
                        //       );
                        // }
                      }),
                  adjustHieght(10),
                  InkWell(
                    onTap: () async {
                      pdf = await PdfPickerImpl().getPdf();
                      if (pdf != null && mounted) {
                        // context
                        //     .read<BusinessDataBloc>()
                        //     .brochureLabelController
                        //     .text = pdf?.file?.path
                        //         .split('/')
                        //         .last
                        //         .replaceFirst('.pdf', '') ??
                        //     '';
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
                            Text(
                              pdf != null
                                  ? 'Change Brochures'
                                  : 'Add Brochures',
                              style: TextStyle(fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ));
  }
}
