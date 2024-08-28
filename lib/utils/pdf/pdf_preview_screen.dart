import 'dart:convert';

import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class ScreenPdfPreview extends StatelessWidget {
  const ScreenPdfPreview(
      {super.key, this.filePath, this.base64, this.label = 'Document'});

  final String? filePath;
  final String? base64;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(label, style: textThinStyle1),
      ),
      body: filePath != null
          ? PdfViewer.openFile(filePath!,
              onError: (_) => const Center(
                    child: Text('Could not load document please try again'),
                  ))
          : PdfViewer.openData(
              base64Decode(base64!.startsWith('data')
                  ? base64!.substring('data:application/pdf;base64,'.length)
                  : base64!),
              onError: (_) => const Center(
                child: Text('Could not load document please try again'),
              ),
            ),
    );
  }
}
