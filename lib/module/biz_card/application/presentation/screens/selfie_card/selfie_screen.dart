import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/module/biz_card/application/business_logic/card_second/card_second_bloc.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/selfie_card/widgets/qr_scanner_view.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/selfie_card/widgets/second_card_feilds.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/selfie_card/widgets/selected_card_builder.dart';
import 'package:bizkit/module/biz_card/data/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_share/view/widgets/card_sharing_qr.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/module/biz_card/application/presentation/widgets/show_case_view.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';

final GlobalKey globalKeyQRLists = GlobalKey();
final GlobalKey globalKeyQRScan = GlobalKey();
final GlobalKey globalKeyNFCScan = GlobalKey();
final GlobalKey globalKeyCreateVsitingCard = GlobalKey();

class SelfieScreen extends StatefulWidget {
  const SelfieScreen({super.key});

  @override
  State<SelfieScreen> createState() => _SelfieScreenState();
}

class _SelfieScreenState extends State<SelfieScreen>
    with SingleTickerProviderStateMixin {
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
  int indexofButton = 1;
  int leftButton = 0;
  int rightButton = 2;

  late AnimationController _controller;

  bool isShowcaseSeen = false;
  final homeScreenShowCase = 'isShowCaseShareCard';

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      SharedPreferences.getInstance().then((prefs) async {
        final showed =
            await SecureStorage.getHomeShowCaseViwed(homeScreenShowCase);
        setState(() {
          isShowcaseSeen = showed;
        });
        if (!isShowcaseSeen) {
          ShowCaseWidget.of(context).startShowCase([
            globalKeyQRLists,
            globalKeyQRScan,
            globalKeyNFCScan,
            globalKeyCreateVsitingCard
          ]);
          await SecureStorage.setHomeShowCaseViwed(homeScreenShowCase);
        }
      });
    });
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: kwidth,
        height: double.infinity,
        decoration: indexofButton == 2
            ? const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('asset/images/connecting_iphone.gif'),
                  fit: BoxFit.cover,
                ),
              )
            : null,
        child: ColoredBox(
          color: indexofButton == 2 ? kblack.withOpacity(0.8) : knill,
          child: Column(
            children: [
              adjustHieght(khieght * 0.10),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CardSharingScreen(),
                      ),
                    ),
                    child: CustomShowCaseView(
                      description: '',
                      tittle: 'Created cards QR Lists',
                      globalKey: globalKeyQRLists,
                      image: '',
                      child: CircleAvatar(
                        radius: kwidth * 0.080,
                        backgroundColor: textFieldFillColr,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset('asset/images/bizkitIcon.png'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              adjustHieght(khieght * 0.05),
              indexofButton == 0
                  ? Column(
                      children: [
                        Container(
                          width: kwidth * 0.80,
                          height: kwidth * 0.60,
                          color: kwhite,
                          child: const QrScannerView(),
                        ),
                        adjustHieght(10),
                        // TextButton(
                        // onPressed: () async {
                        // context.read<CardSecondBloc>().add(
                        //     const CardSecondEvent.galeryScannedImage());
                        // final image = await ImagePicker()
                        //     .pickImage(source: ImageSource.gallery);
                        // if (image == null) {
                        //   return; // Handle no image selected case
                        // }
                        // final file = File(image.path);
                        // final barcodeScanner = BarcodeScannerPlugin();
                        // List<Barcode> barcodes =
                        //     await barcodeScanner.scan(file
                        //         .path); // Replace with _image!.path

                        // if (barcodes.isEmpty) {
                        //   print('No QR codes found in the image.');
                        // } else {
                        //   // Process the extracted data (first barcode assumed):
                        //   final data = barcodes[0].displayValue;
                        //   print('Extracted QR code data: $data');
                        //   // Use the extracted data as needed in your app
                        //}
                        // },
                        // child: const Text('Upload from gallery'),
                        //),
                      ],
                    )
                  : indexofButton == 1
                      ? Column(
                          children: [
                            CustomShowCaseView(
                                image: personImage,
                                globalKey: globalKeyCreateVsitingCard,
                                tittle: 'See notification',
                                description: '',
                                child: const Text('Create visiting card')),
                            const ContainerPickImage(),
                            adjustHieght(20),
                            TextButton(
                              onPressed: () {
                                context
                                    .read<CardSecondBloc>()
                                    .add(const CardSecondEvent.imageClear());
                                Navigator.of(context).push(
                                  fadePageRoute(CardSecondScannedDatas()),
                                );
                              },
                              child: const Text(
                                'Create card without visiting card',
                                style: TextStyle(
                                  decorationColor: neonShade,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        )
                      : const SizedBox(),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  scannerButton(image: buttons[leftButton], left: true),
                  InkWell(
                    splashColor: neonShade,
                    onTap: () {},
                    customBorder: const CircleBorder(),
                    child: FadeTransition(
                      opacity: _controller,
                      child: Container(
                        padding: const EdgeInsets.all(35),
                        width: kwidth * 0.28,
                        height: kwidth * 0.28,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(kwidth * 0.2),
                          ),
                          image: const DecorationImage(
                            image: AssetImage(
                              'asset/images/cameraSelectBackground.png',
                            ),
                            fit: BoxFit.contain,
                          ),
                        ),
                        child: Image.asset(
                          centerButtons[indexofButton],
                        ),
                      ),
                    ),
                  ),
                  scannerButton(image: buttons[rightButton], left: false)
                ],
              ),
              adjustHieght(khieght * 0.05)
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
          height: 150.dm,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              adjustHieght(30),
              Text(heading ?? 'Scan information through image'),
              adjustHieght(30),
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
                                        fadePageRoute(const SelectedCard()));
                                  }
                                  context.read<CardSecondBloc>().add(
                                      const CardSecondEvent.scanImage(
                                          isFront: false, isCam: false));
                                  if (fromMain) {
                                    context.read<CardSecondBloc>().add(
                                        const CardSecondEvent.imageClear());
                                  }
                                },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                border: Border.all(color: neonShade),
                              ),
                              child: const Center(child: Text('Gallery')),
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
                              Navigator.of(context)
                                  .push(fadePageRoute(const SelectedCard()));
                            }
                            context.read<CardSecondBloc>().add(
                                  const CardSecondEvent.scanImage(
                                      isCam: true, isFront: false),
                                );
                            if (fromMain) {
                              context
                                  .read<CardSecondBloc>()
                                  .add(const CardSecondEvent.imageClear());
                            }
                          },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          border: Border.all(color: neonShade),
                        ),
                        child: const Center(child: Text('Camera')),
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
