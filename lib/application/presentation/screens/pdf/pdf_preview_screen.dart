import 'package:flutter/material.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class ScreenPdfPreview extends StatelessWidget {
  const ScreenPdfPreview({super.key, required this.filePath});

  final String filePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brochure'),
      ),
      body: PdfViewer.openFile(filePath,
          onError: (_) => const Center(
                child: Text('Could not load brochure please try again'),
              )),
    );
  }
}
