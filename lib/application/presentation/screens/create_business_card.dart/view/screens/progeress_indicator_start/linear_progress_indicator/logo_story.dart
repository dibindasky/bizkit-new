import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/last_skip_and_aontinue.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoStory extends StatefulWidget {
  const LogoStory({super.key, required this.pageController});

  final PageController pageController;

  @override
  State<LogoStory> createState() => _LogoStoryState();
}

class _LogoStoryState extends State<LogoStory> {
  TextEditingController textEditingController = TextEditingController();

  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 900),
      delay: const Duration(milliseconds: 600),
      child: GestureDetector(
        onTap: () {
          FocusScopeNode focusScopeNode = FocusScope.of(context);
          if (!focusScopeNode.hasPrimaryFocus) {
            focusScopeNode.unfocus();
          }
        },
        child: ListView(
          children: [
            adjustHieght(khieght * .03),
            const Text(
              'Logo',
              style: TextStyle(fontSize: 20),
            ),
            adjustHieght(khieght * .02),
            Center(
              child: InkResponse(
                // onTap: () => _pickImage(),
                child: DottedBorder(
                  dashPattern: const [8, 8],
                  color: neonShade,
                  strokeWidth: 2.5,
                  child: SizedBox(
                    width: kwidth * 0.8,
                    height: kwidth * 0.25,
                    child: selectedImage != null
                        ? Image.file(selectedImage!, fit: BoxFit.cover)
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 32.dm,
                                height: 32.dm,
                                child: CircleAvatar(
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.add)),
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
            adjustHieght(khieght * .02),
            const Text(
              'Logo story',
              style: TextStyle(fontSize: 20),
            ),
            adjustHieght(khieght * .02),
            const TTextFormField(
              maxLines: 10,
              text:
                  "Your logo has been made with so much of thoughts and is designed to inspire. I'm sure that there is a story/ deep meaning behind your logo. This is one of the few places where you can impress the receiver of your card about the foundation of your logo",
            ),
            adjustHieght(khieght * .04),
            LastSkipContinueButtons(
              onTap: () => widget.pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
