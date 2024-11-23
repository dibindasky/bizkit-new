import 'dart:typed_data';

import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/domain/model/chat/file/file_model.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ImageMessageCard extends StatefulWidget {
  const ImageMessageCard({
    Key? key,
    required this.message,
  }) : super(key: key);

  final FileMessage message;

  @override
  State<ImageMessageCard> createState() => _ImageMessageCardState();
}

class _ImageMessageCardState extends State<ImageMessageCard> {
  late Uint8List image;

  @override
  void initState() {
    super.initState();
    // _decodeImage();
  }

  // @override
  // void didUpdateWidget(covariant ImageMessageCard oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   if (oldWidget.message.file != widget.message.file) {
  //     _decodeImage();
  //   }
  // }

  // void _decodeImage() {
  //   setState(() {
  //     image = base64Decode(widget.message.file ?? '');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushNamed(Routes.slidablePhotoGallery, extra: {
          'initial': 0,
          'memory': false,
          'images': [widget.message.file!]
        });
      },
      child: Container(
        height: 200.h,
        child: NetworkImageWithLoader(widget.message.file!,radius: 5),
        decoration: BoxDecoration(
          borderRadius: kBorderRadius5,
          // image: DecorationImage(
          //   fit: BoxFit.cover,
          //   image: MemoryImage(image),
          // ),
        ),
        child: NetworkImageWithLoader(widget.message.file!, radius: 5),
      ),
    );
  }
}
