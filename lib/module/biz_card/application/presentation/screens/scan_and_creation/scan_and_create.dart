import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/text_extraction/text_extraction_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/received_card/received_card_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/scan_and_creation/widgets/qr_scanner_view.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/scan_and_creation/widgets/selected_card_builder.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/scan_and_creation/widgets/selected_cards.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'widgets/recivercard_creation.dart';

class BizCardScanAndCreateScreen extends StatefulWidget {
  const BizCardScanAndCreateScreen({super.key});

  @override
  State<BizCardScanAndCreateScreen> createState() =>
      _BizCardScanAndCreateScreenState();
}

class _BizCardScanAndCreateScreenState extends State<BizCardScanAndCreateScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey globalKeyQRLists = GlobalKey();

  final GlobalKey globalKeyQRScan = GlobalKey();

  final GlobalKey globalKeyNFCScan = GlobalKey();

  final GlobalKey globalKeyCreateVsitingCard = GlobalKey();

  final buttons = [
    'asset/images/Vector.png',
    'asset/images/camerFromgalleryIcon.png',
    'asset/images/ic_twotone-tap-and-play.png'
  ];

  final centerButtons = [
    'asset/images/camera select Icon.png',
    'asset/images/solar_gallery-bold.png',
    'asset/images/phone_connectivity_bold.png'
  ];

  int indexofButton = 0;

  int leftButton = 1;

  int rightButton = 2;

  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textExtractionController = Get.find<CardTextExtractionController>();
    return Scaffold(
      appBar: AppBar(
        title: indexofButton == 0
            ? const Text('QR Scanner')
            : indexofButton == 1
                ? const Text('Create Receiver Card')
                : const Text('NFC'),
      ),
      body: Container(
        width: kwidth,
        height: MediaQuery.of(context).size.height - 130.h,
        decoration: indexofButton == 2
            ? const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('asset/images/connecting_iphone.gif'),
                  fit: BoxFit.cover,
                ),
              )
            : null,
        child: ColoredBox(
          color: indexofButton == 2 ? kblack.withOpacity(0.6) : knill,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    adjustHieght(
                        indexofButton == 1 ? khieght * 0.0 : khieght * 0.20),
                    indexofButton == 0
                        ? Center(
                            child: SizedBox(
                              child: Column(
                                children: [
                                  Container(
                                    width: kwidth * 0.80,
                                    height: kwidth * 0.60,
                                    color: kwhite,
                                    child: const QrScannerView(),
                                  ),
                                  adjustHieght(10),
                                ],
                              ),
                            ),
                          )
                        : indexofButton == 1
                            ? Column(
                                children: [
                                  RecivercardCreation(
                                    onPressedCam: () {
                                      textExtractionController.pickedImageUrl
                                          .clear();
                                      Navigator.of(context).push(
                                          cardFadePageRoute(
                                              const SelectedCards()));
                                      textExtractionController
                                          .pickImageScanning(camera: true);
                                    },
                                    onPressedGallery: () {
                                      textExtractionController.pickedImageUrl
                                          .clear();
                                      Navigator.of(context).push(
                                          cardFadePageRoute(
                                              const SelectedCards()));
                                      textExtractionController
                                          .pickImageScanning(camera: false);
                                    },
                                  ),
                                  // adjustHieght(25),
                                ],
                              )
                            : const SizedBox(),
                    // const Spacer(),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    scannerButton(image: buttons[leftButton], left: true),
                    FadeTransition(
                      opacity: _controller,
                      child: Container(
                        padding: const EdgeInsets.all(35),
                        width: kwidth * 0.28,
                        height: kwidth * 0.28,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(kwidth * 0.2)),
                            image: const DecorationImage(
                                image: AssetImage(
                                  'asset/images/cameraSelectBackground.png',
                                ),
                                fit: BoxFit.contain)),
                        child: Image.asset(
                          centerButtons[indexofButton],
                        ),
                      ),
                    ),
                    scannerButton(image: buttons[rightButton], left: false)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget scannerButton({required String image, required bool left}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _controller.forward(from: 0.5);
          if (left) {
            int temp = leftButton;
            leftButton = indexofButton;
            indexofButton = temp;
          } else {
            int temp = rightButton;
            rightButton = indexofButton;
            indexofButton = temp;
          }
        });
      },
      child: FadeTransition(
        opacity: _controller,
        child: Container(
          width: kwidth * 0.13,
          height: kwidth * 0.13,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(kwidth * 0.1)),
            border: Border.all(
              color: neonShade,
              width: kwidth * 0.003,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(image),
          ),
        ),
      ),
    );
  }
}

class ContainerPickImage extends StatelessWidget {
  const ContainerPickImage({
    this.iscardList = true,
    super.key,
    this.heading,
    this.onPressedCam,
    this.onPressedGallery,
    this.isBoth = true,
    this.fromMain = true,
    this.needNavigate = true,
  });
  final String? heading;
  final VoidCallback? onPressedCam;
  final VoidCallback? onPressedGallery;
  final bool isBoth;
  final bool fromMain;
  final bool needNavigate;
  final bool iscardList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
      child: DottedBorder(
        dashPattern: const [8, 8],
        color: neonShade,
        strokeWidth: 2.5,
        child: SizedBox(
          width: double.infinity,
          height: iscardList ? 150.dm : 120,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: iscardList ? 30.h : 10.h),
              // adjustHieght(30),
              Text(
                heading ?? 'Scan information through image',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: iscardList ? 30.h : 10.h),
              // adjustHieght(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  adjustWidth(20),
                  isBoth
                      ? Expanded(
                          child: InkWell(
                            onTap: onPressedGallery ??
                                () {
                                  if (needNavigate) {
                                    Navigator.of(context).push(
                                        cardFadePageRoute(
                                            const SelectedCard()));
                                  }
                                  // context.read<CardSecondBloc>().add(
                                  //     const CardSecondEvent.scanImage(
                                  //         isFront: false, isCam: false));
                                  if (fromMain) {
                                    // context.read<CardSecondBloc>().add(
                                    //     const CardSecondEvent.imageClear());
                                  }
                                },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                border: Border.all(color: neonShade),
                              ),
                              child: Center(
                                  child: Text('Gallery',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium)),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  adjustWidth(20),
                  Expanded(
                    child: InkWell(
                      onTap: onPressedCam ??
                          () {
                            if (needNavigate) {
                              Navigator.of(context).push(
                                  cardFadePageRoute(const SelectedCard()));
                            }
                            // context.read<CardSecondBloc>().add(
                            //       const CardSecondEvent.scanImage(
                            //           isCam: true, isFront: false),
                            //     );
                            if (fromMain) {
                              // context
                              //     .read<CardSecondBloc>()
                              //     .add(const CardSecondEvent.imageClear());
                            }
                          },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          border: Border.all(color: neonShade),
                        ),
                        child: Center(
                            child: Text(
                          'Camera',
                          style: Theme.of(context).textTheme.titleMedium,
                        )),
                      ),
                    ),
                  ),
                  adjustWidth(20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
