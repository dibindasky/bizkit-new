import 'dart:io';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/business_card_preview/view/screen/preview_main_screen.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/brochers_and_products/brocher_builder.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/brochers_and_products/product_builder.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/brochers_and_products/product_adding_screen.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/last_skip_and_continue.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class BrochersAndProductsScreen extends StatelessWidget {
  BrochersAndProductsScreen({Key? key}) : super(key: key);

  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              adjustHieght(khieght * .03),
              const Text(
                'Brochures / Products',
                style: TextStyle(fontSize: 20),
              ),
              adjustHieght(30),
              Center(
                child: InkWell(
                  onTap: () async {
                    final result = await ImagePickerClass.getImage();
                    if (result != null) {
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        fadePageRoute(const AddPrductsScreen()),
                      );
                    }
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
                            child: const CircleAvatar(
                              child: Icon(
                                Icons.add,
                              ),
                            ),
                          ),
                          Text(
                            'Add Products',
                            style: TextStyle(fontSize: 10.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              adjustHieght(30),
              Center(
                child: InkWell(
                  // onTap: () async {
                  //   final result = await PickImage.getImage();
                  //   if (result != null) {
                  //     // ignore: use_build_context_synchronously
                  //     Navigator.push(
                  //       context,
                  //       fadePageRoute(const AddPrductsScreen()),
                  //     );
                  //   }
                  // },
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
                            child: const CircleAvatar(
                              child: Icon(
                                Icons.add,
                              ),
                            ),
                          ),
                          Text(
                            'Add brochers',
                            style: TextStyle(fontSize: 10.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              adjustHieght(30),
              const Text('Added Products'),
              const ProductBuilder(),
              adjustHieght(30),
              const Text('Added Brochers'),
              adjustHieght(10),
              const BrocherBuilder(),
              adjustHieght(khieght * .03),
              selectedImage == null
                  ? const SizedBox()
                  : SizedBox(
                      width: 100.dm,
                      height: 100.dm,
                      child: Image.file(
                        File(
                          selectedImage!.path,
                        ),
                      ),
                    ),
            ],
          ),
          adjustHieght(khieght * .03),
          LastSkipContinueButtons(
            onTap: () => Navigator.of(context).push(
              fadePageRoute(const BusinessCardCreationPreviewScreen()),
            ),
          ),
          adjustHieght(30),
        ],
      ),
    );
  }
}
