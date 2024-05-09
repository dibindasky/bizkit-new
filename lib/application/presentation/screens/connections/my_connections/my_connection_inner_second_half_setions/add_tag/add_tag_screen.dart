import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddTagScreen extends StatelessWidget {
  AddTagScreen({super.key});
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormField(
          labelText: 'Write New Tag Here',
          controller: textEditingController,
          inputType: TextInputType.name,
        ),
        const Text('Frequently Used Tags'),
        adjustHieght(khieght * .02),
        SizedBox(
          height: 50,
          width: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: textFieldFillColr, // Set the background color
              border: Border.all(
                color: klightgrey, // Set the border color
                width: 2, // Set the border width
              ),
            ),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Friend',
                  style: TextStyle(
                    color: kwhite, // Set the text color
                    fontSize: 14, // Set the font size
                  ),
                ),
              ),
            ),
          ),
        ),
        adjustHieght(khieght * .012),
        SizedBox(
          height: 50,
          width: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: textFieldFillColr, // Set the background color
              border: Border.all(
                color: klightgrey, // Set the border color
                width: 2, // Set the border width
              ),
            ),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Relative',
                  style: TextStyle(
                    color: kwhite, // Set the text color
                    fontSize: 14, // Set the font size
                  ),
                ),
              ),
            ),
          ),
        ),
        adjustHieght(khieght * .012),
        SizedBox(
          height: 50,
          width: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: textFieldFillColr, // Set the background color
              border: Border.all(
                color: klightgrey, // Set the border color
                width: 2, // Set the border width
              ),
            ),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Colleague',
                  style: TextStyle(
                    color: kwhite, // Set the text color
                    fontSize: 14, // Set the font size
                  ),
                ),
              ),
            ),
          ),
        ),
        adjustHieght(khieght * .012),
        SizedBox(
          height: 50,
          width: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: textFieldFillColr, // Set the background color
              border: Border.all(
                color: klightgrey, // Set the border color
                width: 2, // Set the border width
              ),
            ),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Neighbour',
                  style: TextStyle(
                    color: kwhite, // Set the text color
                    fontSize: 14, // Set the font size
                  ),
                ),
              ),
            ),
          ),
        ),
        adjustHieght(khieght * .012),
        SizedBox(
          height: 50,
          width: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: textFieldFillColr, // Set the background color
              border: Border.all(
                color: klightgrey, // Set the border color
                width: 2, // Set the border width
              ),
            ),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Business',
                  style: TextStyle(
                    color: kwhite, // Set the text color
                    fontSize: 14, // Set the font size
                  ),
                ),
              ),
            ),
          ),
        ),
        adjustHieght(khieght * .012),
      ],
    );
  }
}
