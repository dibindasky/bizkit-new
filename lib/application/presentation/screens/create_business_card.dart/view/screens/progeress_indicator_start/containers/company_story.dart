import 'package:animate_do/animate_do.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/last_skip_and_aontinue.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompanyStory extends StatelessWidget {
  const CompanyStory({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 900),
      delay: const Duration(milliseconds: 600),
      child: ListView(
        children: [
          adjustHieght(khieght * .03),
          const Text(
            'Company story',
            style: TextStyle(fontSize: 20),
          ),
          adjustHieght(khieght * .02),
          Center(
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
                          onPressed: () {},
                          icon: const Icon(Icons.add),
                        ),
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
          adjustHieght(khieght * .02),
          const Text(
            'Company story',
            style: TextStyle(fontSize: 20),
          ),
          adjustHieght(khieght * .02),
          Container(
            color: textFieldFillColr,
            child: Hero(
              tag: 'information',
              child: TextFormField(
                maxLines: 13,
                decoration: InputDecoration(
                  fillColor: textFieldFillColr,
                  filled: true,
                  hintText:
                      "Your logo has been made with so much of thoughts and is designed to inspire. I'm sure that there is a story/ deep meaning behind your logo. This is one of the few places where you can impress the receiver of your card about the foundation of your logo",
                  hintStyle: const TextStyle(color: klightgrey),
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(
                      color: kwhite,
                    ),
                  ),
                ),
              ),
            ),
          ),
          adjustHieght(khieght * .04),
          LastSkipContinueButtons(
            onTap: () => pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            ),
          ),
          //SkipContinueIndicator(pageController: pageController)
        ],
      ),
    );
  }
}
