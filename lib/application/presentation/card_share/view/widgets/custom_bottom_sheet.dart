import 'dart:io';
import 'package:bizkit/application/commen/widgets/textform_field.dart';
import 'package:bizkit/application/commen/const.dart';
import 'package:bizkit/application/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/card_share/view/widgets/card_sharing.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomBottomSheet extends StatelessWidget {
  CustomBottomSheet({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;
  final TextEditingController textEditingController = TextEditingController();
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 13, right: 13),
      height: 400,
      decoration: const BoxDecoration(
        color: kblack,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: ListView(
        children: [
          adjustHieght(khieght * .02),
          Row(
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              adjustWidth(kwidth * .02),
              Text(
                'Business card',
                style: custumText(
                  fontSize: kwidth * 0.033,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const CircleAvatar(
                  radius: 17,
                  backgroundColor: smallBigGrey,
                  child: Icon(
                    Icons.close,
                    color: klightgrey,
                  ),
                ),
              ),
            ],
          ),
          adjustHieght(khieght * .01),
          const Divider(
            color: klightgrey,
          ),
          adjustHieght(khieght * .01),
          Row(
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Image.asset(
                      'asset/images/bottom sheet/AirDrop bottom sheet image.png',
                    ),
                    const Text('Tap')
                  ],
                ),
              ),
              adjustWidth(kwidth * .02),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    fadePageRoute(const CardSharingScreen()),
                  );
                },
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      adjustHieght(khieght * .01),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: kwhite,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image.asset(
                          'asset/images/bottom sheet/scanner bottom sheet img.png',
                        ),
                      ),
                      adjustHieght(khieght * .01),
                      const Text('QR Scan'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          adjustHieght(khieght * .01),
          const Divider(
            color: klightgrey,
          ),
          adjustHieght(khieght * .01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              shareMethods(
                'asset/images/bottom sheet/logos_whatsapp-icon.png',
                decoration: BoxDecoration(
                  color: smallBigGrey,
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              shareMethods(
                'asset/images/bottom sheet/face book bottom sheet image.png',
                fit: BoxFit.cover,
              ),
              shareMethods(
                'asset/images/bottom sheet/linkedin bottom sheet image.png',
                fit: BoxFit.cover,
              ),
              shareMethods(
                'asset/images/bottom sheet/x bottom sheet image.png',
                fit: BoxFit.cover,
              ),
            ],
          ),
          adjustHieght(khieght * .03),
          TTextFormField(
            text: 'Copy link',
            controller: textEditingController,
            inputType: TextInputType.name,
            suffix: const Icon(
              Icons.copy,
            ),
          ),
        ],
      ),
    );
  }

  Widget shareMethods(String image, {BoxDecoration? decoration, BoxFit? fit}) {
    return Container(
      width: kwidth * .2,
      height: kwidth * .2,
      decoration: decoration,
      child: Image.asset(
        image,
        fit: fit,
      ),
    );
  }

  // Future<void> _pickImage(BuildContext context) async {
  //   try {
  //     final pickedFile =
  //         await ImagePicker().pickImage(source: ImageSource.camera);
  //     if (pickedFile != null) {
  //       File image = File(pickedFile.path);
  //       selectedImage = image;
  //       // ignore: use_build_context_synchronously
  //       Navigator.push(
  //         context,
  //         fadePageRoute(CardSharingScreen(image: image)),
  //       );
  //     } else {
  //       print('No image selected.');
  //     }
  //   } catch (e) {
  //     print('Error picking image: $e');
  //   }
  // }
}
