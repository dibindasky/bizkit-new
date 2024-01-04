// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:bizkit/fade_transition/fade_transition.dart';
import 'package:bizkit/feature/business_card_preview/view/screen/preview_main_screen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bizkit/core/const.dart';
import 'package:bizkit/feature/create_business_card.dart/view/widgets/image_with_brochers.dart';

// ignore: must_be_immutable
class BrochersAndProducts extends StatelessWidget {
  BrochersAndProducts({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  final PageController pageController;
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 900),
      delay: const Duration(milliseconds: 600),
      child: ListView(
        children: [
          adjustHieght(khieght * .03),
          const Text(
            'Brochures / Products',
            style: TextStyle(fontSize: 20),
          ),
          adjustHieght(khieght * .03),
          selectedImage == null
              ? const SizedBox()
              : SizedBox(
                  width: 100.dm,
                  height: 100.dm,
                  child: Image.file(File(selectedImage!.path)),
                ),
          Center(
            child: InkWell(
              onTap: () async {
                await _pickImage(context);
              },
              child: DottedBorder(
                dashPattern: const [8, 8],
                color: neonShade,
                strokeWidth: 2.5,
                child: SizedBox(
                  width: 290.dm,
                  height: 91.dm,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 32.dm,
                        height: 32.dm,
                        child: CircleAvatar(
                          child: IconButton(
                              onPressed: () {}, icon: const Icon(Icons.add)),
                        ),
                      ),
                      Text(
                        'Add logo from file',
                        style: TextStyle(fontSize: 10.sp),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          adjustHieght(khieght * .5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () => pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: neonShade),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  width: 123.dm,
                  height: 45.dm,
                  child: const Center(child: Text('Skip')),
                ),
              ),
              InkWell(
                onTap: () => Navigator.of(context).push(
                  fadePageRoute(const PreviewMainScreen()),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    color: neonShade,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  width: 123.dm,
                  height: 45.dm,
                  child: const Center(
                    child: Text('Continue'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage(BuildContext context) async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        File image = File(pickedFile.path);
        selectedImage = image;
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageDetailsScreen(image: image),
          ),
        );
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }
}
