import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

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
  Uint8List? image;
  @override
  void initState() {
    if (!widget.isFileIamge) {
      image = base64.decode(widget.image.startsWith('data')
          ? widget.image.substring(22)
          : widget.image);
    }
    super.initState();
  }

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
                : Image.memory(image!),
          ),
        ),
      ),
    );
  }
}
