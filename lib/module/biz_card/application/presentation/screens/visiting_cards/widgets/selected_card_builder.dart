import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/visiting_cards/visiting_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/widgets/image_preview.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectedCard extends StatelessWidget {
  const SelectedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: knill,
        title: Text(
          'Selected Cards',
          style: textHeadStyle1,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              children: [
                adjustHieght(khieght * .05),
                ListView.separated(
                  separatorBuilder: (context, index) {
                    return adjustHieght(khieght * .02);
                  },
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    // if (state.pickImageLoading) {
                    //   length += 1;
                    //   if (index + 1 == length) {
                    //     return SizedBox(
                    //       height: 150.dm,
                    //       child: const Center(
                    //         child: CircularProgressIndicator(
                    //           color: neonShade,
                    //         ),
                    //       ),
                    //     );
                    //   }
                    // }
                    return Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              cardFadePageRoute(
                                  const ScreenImagePreview(image: '')),
                            );
                          },
                          child: Container(
                            width: 310.dm,
                            height: 150.dm,
                            decoration: BoxDecoration(
                              border: Border.all(color: neonShade, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            color: neonShade,
                            onPressed: () {
                              // context.read<CardSecondBloc>().add(
                              //       CardSecondEvent.removeImageScanning(
                              //           index: index),
                              //     );
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        )
                      ],
                    );
                  },
                ),
                adjustHieght(khieght * .02),
                const ContainerPickImage(
                  fromMain: false,
                  heading: 'Add more image',
                ),
                adjustHieght(khieght * .02),
                EventButton(
                  text: 'Continue',
                  onTap: () {
                    // context.read<CardSecondBloc>().add(
                    //     const CardSecondEvent.cardFeildClearing());
                    // if (state
                    //     .scannedImagesSecondCardCreation.isEmpty) {
                    //   showSnackbar(
                    //     context,
                    //     message: 'Select atleast one Image',
                    //     backgroundColor: kred,
                    //   );
                    // } else {
                    //   context.read<CardSecondBloc>().add(
                    //       CardSecondEvent.processImageScanningInfo(
                    //           images: state
                    //               .scannedImagesSecondCardCreation));
                    // }
                  },
                ),
                adjustHieght(khieght * .02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}