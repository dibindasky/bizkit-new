import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class ScreenPdfPreview extends StatelessWidget {
  const ScreenPdfPreview({super.key, this.filePath, this.base64});

  final String? filePath;
  final String? base64;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Brochure'),
        ),
        body: filePath != null
            ? PdfViewer.openFile(filePath!,
                onError: (_) => const Center(
                      child: Text('Could not load brochure please try again'),
                    ))
            : PdfViewer.openData(base64Decode(base64!.substring('data:application/pdf;base64,'.length)),
                onError: (_) => const Center(
                      child: Text('Could not load brochure please try again'),
                    )));
  }
}
