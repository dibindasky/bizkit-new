import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:bizkit/utils/text_field/auto_fill_text_field.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenConnectionDetailFilling extends StatefulWidget {
  const ScreenConnectionDetailFilling({super.key});

  @override
  State<ScreenConnectionDetailFilling> createState() =>
      _ScreenConnectionDetailFillingState();
}

class _ScreenConnectionDetailFillingState
    extends State<ScreenConnectionDetailFilling> {
  TextEditingController notesController = TextEditingController();
  TextEditingController occasionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Make a Biskit Card'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 200.h,
                child: ListView.builder(
                  itemBuilder: (context, index) => Container(
                    height: 200.h,
                    // width: ,
                    decoration: BoxDecoration(
                      borderRadius: kBorderRadius10,
                      color: klightGreyClr,
                      image: const DecorationImage(
                        image: NetworkImage(
                            'https://example.com/placeholder-image.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                labelText: 'notes',
                controller: notesController,
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Occasion', controller: occasionController),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Location', controller: locationController),
              const SizedBox(height: 10),
              AutocompleteTextField(
                label: 'Category',
                autocompleteItems: bizcardCategories,
                controller: categoryController,
              ),
              const SizedBox(height: 20),
              EventButton(text: 'Update Details', onTap: () {})
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
