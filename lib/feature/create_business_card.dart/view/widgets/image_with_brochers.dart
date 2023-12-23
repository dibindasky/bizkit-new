import 'dart:io';
import 'package:bizkit/commen/widgets/textform_field.dart';
import 'package:bizkit/core/const.dart';
import 'package:bizkit/feature/authentication/view/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageDetailsScreen extends StatefulWidget {
  final File image;

  const ImageDetailsScreen({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  State<ImageDetailsScreen> createState() => _ImageDetailsScreenState();
}

class _ImageDetailsScreenState extends State<ImageDetailsScreen> {
  TextEditingController textEditingController = TextEditingController();

  String selectedOption = '';
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode focusScope = FocusScope.of(context);
        if (!focusScope.hasPrimaryFocus) {
          focusScope.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Add Product / Brochure'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                children: [
                  adjustHieght(khieght * .05),
                  SizedBox(
                    width: 270.dm,
                    height: 170.dm,
                    child: Image.file(
                      widget.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  adjustHieght(khieght * .02),
                  TTextFormField(
                    text: 'Name',
                    controller: textEditingController,
                    inputType: TextInputType.name,
                  ),
                  TTextFormField(
                    text: 'Description',
                    maxLines: 10,
                    controller: textEditingController,
                    inputType: TextInputType.name,
                  ),
                  adjustHieght(khieght * .02),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: textFieldFillColr,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Add Enquire Button'),
                        Switch(
                          value: switchValue,
                          onChanged: (value) {
                            setState(() {
                              switchValue = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  adjustHieght(khieght * .03),
                  AuthButton(
                    text: 'Save product',
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
