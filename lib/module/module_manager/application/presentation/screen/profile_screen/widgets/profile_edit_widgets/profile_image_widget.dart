import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/show_dialogue/show_dailogue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImagePreview extends StatefulWidget {
  const ProfileImagePreview(
      {super.key,
      required this.image,
      this.onCamPressed,
      this.onGalleryPressed,
      required this.isProfileScreen});

  final String image;
  final VoidCallback? onCamPressed;
  final VoidCallback? onGalleryPressed;
  final bool isProfileScreen;

  @override
  State<ProfileImagePreview> createState() => _ProfileImagePreviewState();
}

class _ProfileImagePreviewState extends State<ProfileImagePreview> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.isProfileScreen ? 70.h : 130.h,
      height: widget.isProfileScreen ? 70.h : 130.h,
      child: Stack(
        children: [
          SizedBox(
              width: widget.isProfileScreen ? 70.h : 130.h,
              height: widget.isProfileScreen ? 70.h : 130.h,
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(
                  widget.image,
                ),
              )),
          widget.onCamPressed != null || widget.onGalleryPressed != null
              ? Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                      onPressed: () {
                        cameraAndGalleryPickImage(
                            context: context,
                            onPressCam: () {
                              widget.onCamPressed!();
                            },
                            onPressGallery: () {
                              widget.onGalleryPressed!();
                            },
                            tittle: 'Pick Image');
                      },
                      icon: const Icon(
                        Icons.camera_alt_rounded,
                        color: neonShade,
                      )))
              : const SizedBox()
        ],
      ),
    );
  }
}
