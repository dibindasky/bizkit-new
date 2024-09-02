import 'dart:convert';

import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class SlidablePhotoGallery extends StatelessWidget {
  final List<String> images;
  final int initialIndex;
  final bool isMemory;

  const SlidablePhotoGallery(
      {super.key,
      required this.images,
      this.initialIndex = 0,
      this.isMemory = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: knill,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios, size: 17)),
      ),
      body: PageView.builder(
        itemCount: images.length,
        controller: PageController(initialPage: initialIndex),
        itemBuilder: (context, index) {
          return PhotoView(
            imageProvider: MemoryImage(
              base64.decode(images[index].startsWith('data')
                  ? images[index].substring(22)
                  : images[index]),
            ),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2,
            initialScale: PhotoViewComputedScale.contained,
            backgroundDecoration: const BoxDecoration(color: Colors.black),
          );
        },
      ),
    );
  }
}
