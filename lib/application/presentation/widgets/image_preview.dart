import 'dart:io';

import 'package:flutter/material.dart';

class ScreenImagePreview extends StatefulWidget {
  const ScreenImagePreview(
      {super.key, required this.image, this.isFileIamge = false});

  final String image;
  final bool isFileIamge;

  @override
  State<ScreenImagePreview> createState() => _ScreenImagePreviewState();
}

class _ScreenImagePreviewState extends State<ScreenImagePreview> {
  double scale = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: GestureDetector(
          onScaleUpdate: (details) {
            setState(() {
              scale = details.scale;
            });
          },
          child: Transform.scale(
            scale: scale,
            child: widget.isFileIamge
                ? Image.file(File(widget.image))
                : Image.network(widget.image),
          ),
        ),
      ),
    );
  }
}
