import 'dart:convert';

import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/brochure.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/pdf/pdf_preview_screen.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class BrochursBuilder extends StatelessWidget {
  const BrochursBuilder({super.key, required this.pdf});
  final List<Brochure> pdf;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
          child: GridView.builder(
            itemCount: pdf.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1 / 1.4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScreenPdfPreview(
                              base64: imageTestingBase64.substring(
                                  'data:application/pdf;base64,'.length))));
                },
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: PdfViewer.openData(
                          base64Decode(imageTestingBase64.substring(
                              'data:application/pdf;base64,'.length)),
                          params: const PdfViewerParams(pageNumber: 1)),
                    ),
                    adjustHieght(5),
                    const Text('', overflow: TextOverflow.ellipsis)
                  ],
                ),
              );
            },
          )),
    );
  }
}
