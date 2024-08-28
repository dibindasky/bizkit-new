import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
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
      body: Stack(
        children: [
          SizedBox(
            child: PageView.builder(
              itemCount: images.length,
              controller: PageController(initialPage: initialIndex),
              itemBuilder: (context, index) {
                return Hero(tag: 'photo',
                  child: PhotoView(
                    imageProvider: MemoryImage(
                      base64.decode(images[index].startsWith('data')
                          ? images[index].substring(22)
                          : images[index]),
                    ),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 2,
                    initialScale: PhotoViewComputedScale.contained,
                    backgroundDecoration:
                        const BoxDecoration(color: Colors.black),
                  ),
                );
              },
            ),
          ),
          Positioned(
              top: 40.h,
              left: 10.h,
              child: IconButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back)))
        ],
      ),
    );
  }
}
