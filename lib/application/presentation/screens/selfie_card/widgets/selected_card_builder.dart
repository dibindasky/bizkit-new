import 'package:bizkit/application/business_logic/card_second/card_second_bloc.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/screens/selfie_card/widgets/selfie_preview_screen.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          'Selecetd Cards',
          style: textHeadStyle1,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: BlocConsumer<CardSecondBloc, CardSecondState>(
              listener: (context, state) {
                if (state.cardScanFinish) {
                  Navigator.of(context).pushReplacement(
                      fadePageRoute(const SelfiePreviewScreen()));
                }
              },
              builder: (context, state) {
                return Column(
                  children: [
                    adjustHieght(khieght * .05),
                    ListView.separated(
                      separatorBuilder: (context, index) {
                        return adjustHieght(khieght * .02);
                      },
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.scannedImagesSecondCardCreation.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            SizedBox(
                              width: 200.dm,
                              height: 120.dm,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  state.scannedImagesSecondCardCreation[index]
                                      .fileImage,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                    onPressed: () {
                                      context.read<CardSecondBloc>().add(
                                          CardSecondEvent.removeImageScanning(
                                              index: index));
                                    },
                                    icon: const Icon(Icons.delete)))
                          ],
                        );
                      },
                    ),
                    adjustHieght(khieght * .02),
                    state.scannedImagesSecondCardCreation.length < 2
                        ? DottedBorder(
                            dashPattern: const [8, 8],
                            color: neonShade,
                            strokeWidth: 2.5,
                            child: SizedBox(
                              width: double.infinity,
                              height: 110.dm,
                              child: GestureDetector(
                                onTap: () {
                                  state.scannedImagesSecondCardCreation
                                              .length >=
                                          2
                                      ? showSnackbar(
                                          message:
                                              "You can't add more than 2 files",
                                          context)
                                      : context.read<CardSecondBloc>().add(
                                            const CardSecondEvent
                                                .galeryScannedImage(),
                                          );
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 32.dm,
                                      height: 32.dm,
                                      child: const CircleAvatar(
                                        child: Center(child: Icon(Icons.add)),
                                      ),
                                    ),
                                    Text(
                                      'Add more images',
                                      style: TextStyle(fontSize: 10.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
                    adjustHieght(khieght * .02),
                    state.isLoading
                        ? const Center(child: LoadingAnimation())
                        : AuthButton(
                            text: 'Continue',
                            onTap: () {
                              context.read<CardSecondBloc>().add(
                                    CardSecondEvent.processImageScanning(
                                      images:
                                          state.scannedImagesSecondCardCreation,
                                    ),
                                  );
                            },
                          ),
                    adjustHieght(khieght * .02),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
