import 'dart:convert';

import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/data/features/pdf/pdf_picker.dart';
import 'package:bizkit/domain/model/card/card/brochure/brochure.dart';
import 'package:bizkit/domain/model/pdf/pdf_model.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class ScreenBrochureAdding extends StatefulWidget {
  const ScreenBrochureAdding({super.key});

  @override
  State<ScreenBrochureAdding> createState() => _ScreenBrochureAddingState();
}

class _ScreenBrochureAddingState extends State<ScreenBrochureAdding> {
  PdfModel? pdf;
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
                  TTextFormField(
                    text: 'Label',
                    controller: context
                        .read<BusinessDataBloc>()
                        .brochureLabelController,
                  ),
                  adjustHieght(10),
                  pdf == null
                      ? const SizedBox()
                      : SizedBox(
                          height: khieght * 0.4,
                          child: Stack(
                            children: [
                              AspectRatio(
                                  aspectRatio: 0.705,
                                  child: PdfViewer.openData(base64.decode(pdf!
                                          .base64!
                                          .startsWith("data")
                                      ? pdf!.base64!.substring(
                                          "data:application/pdf;base64,".length)
                                      : pdf!.base64!))),
                              Positioned(
                                right: 0,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      pdf = null;
                                      context
                                          .read<BusinessDataBloc>()
                                          .brochureLabelController
                                          .text = '';
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
                  pdf == null
                      ? const SizedBox()
                      : BlocConsumer<BusinessDataBloc, BusinessDataState>(
                          listener: (context, state) {
                            if (state.brochureAdded) {
                              Navigator.pop(context);
                            }
                          },
                          builder: (context, state) {
                            if (state.brochureLoading) {
                              return const LoadingAnimation();
                            }
                            return AuthButton(
                                text: "Add Brousher",
                                onTap: () {
                                  context.read<BusinessDataBloc>().add(
                                        BusinessDataEvent.addBrochure(
                                          brochure: Brochure(
                                            cardId: state.currentCard?.id,
                                            file: pdf!.base64,
                                            label: context
                                                .read<BusinessDataBloc>()
                                                .brochureLabelController
                                                .text
                                                .trim(),
                                          ),
                                        ),
                                      );
                                });
                          },
                        ),
                  adjustHieght(10),
                  pdf != null
                      ? const SizedBox()
                      : InkWell(
                          onTap: () async {
                            pdf = await PdfPickerImpl().getPdf();
                            if (pdf != null && mounted) {
                              context
                                  .read<BusinessDataBloc>()
                                  .brochureLabelController
                                  .text = pdf?.file?.path
                                      .split('/')
                                      .last
                                      .replaceFirst('.pdf', '') ??
                                  '';
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
