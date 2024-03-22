import 'dart:convert';

import 'package:bizkit/application/presentation/screens/pdf/pdf_preview_screen.dart';
import 'package:flutter/material.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class BrochersBuilder extends StatelessWidget {
  const BrochersBuilder({
    super.key,
    required this.pdf,
  });
  final List<String> pdf;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
          child: GridView.builder(
            itemCount: pdf.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ScreenPdfPreview(base64: pdf[index])));
                },
                child: PdfViewer.openData(base64Decode(pdf[index]),
                    params: const PdfViewerParams(pageNumber: 1)),
              );
            },
          )),
    );
  }
}
