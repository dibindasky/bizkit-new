import 'package:flutter/material.dart';

class ScreenImagePreview extends StatefulWidget {
  const ScreenImagePreview({
    super.key,
    required this.image,
    this.isFileIamge = false,
    this.slideImages,
  });
  final List<String>? slideImages;
  final String image;
  final bool isFileIamge;

  @override
  State<ScreenImagePreview> createState() => _ScreenImagePreviewState();
}

class _ScreenImagePreviewState extends State<ScreenImagePreview> {
  double scale = 1;
  // Uint8List? image;
  // List<Uint8List>? imagess;
  // @override
  // void initState() {
  //   // if (widget.slideImages != null && widget.slideImages!.isNotEmpty) {
  //   //   for (var image in widget.slideImages!) {
  //   //     imagee = base64
  //   //         .decode(image.startsWith('data') ? image.substring(22) : image);
  //   //   }
  //   //   imagess?.add(imagee!);
  //   // }
  //   if (!widget.isFileIamge) {
  //     image = base64.decode(widget.image.startsWith('data')
  //         ? widget.image.substring(22)
  //         : widget.image);
  //   }
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 17,
          ),
        ),
      ),
      body: Center(
        child: GestureDetector(
          onScaleUpdate: (details) {
            setState(() {
              scale = details.scale;
            });
          },
          child:
              Transform.scale(scale: scale, child: Image.network(widget.image)
                  //  widget.isFileIamge
                  //     ? Image.file(File(widget.image))
                  //     : Image.memory(image!),
                  ),
        ),
      ),
    );
  }
}
