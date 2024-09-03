import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../../../../../domain/model/task/get_task_responce/attachment.dart';

class ImagePreviewScreen extends StatelessWidget {
  const ImagePreviewScreen({
    super.key,
    required this.imageBase64,
    required this.attachments,
    this.initialIndex = 0,
  });

  final String imageBase64;
  final List<Attachment> attachments;
  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView.builder(
        itemCount: attachments.length,
        controller: PageController(initialPage: initialIndex),
        itemBuilder: (context, index) {
          return PhotoView(
            imageProvider:
                MemoryImage(base64.decode(attachments[index].attachment ?? '')),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2,
            initialScale: PhotoViewComputedScale.contained,
            gaplessPlayback: true,
            backgroundDecoration: const BoxDecoration(color: Colors.black),
          );
        },
      ),
    );
  }
}
