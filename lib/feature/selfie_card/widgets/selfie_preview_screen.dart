import 'package:bizkit/core/const.dart';
import 'package:bizkit/fade_transition/fade_transition.dart';
import 'package:bizkit/feature/selfie_card/widgets/make_bizkit_card_screen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class SelfiePreviewScreen extends StatefulWidget {
  const SelfiePreviewScreen({super.key});

  @override
  State<SelfiePreviewScreen> createState() => _SelfiePreviewScreenState();
}

class _SelfiePreviewScreenState extends State<SelfiePreviewScreen> {
  late CameraController controller;
  late List<CameraDescription> cameras;
  bool hasError=true;

  @override
  void initState() {
    super.initState();
    initilizeCamera();
  }

  initilizeCamera() async {
    cameras = await availableCameras();
    controller = CameraController(cameras[1], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      hasError=false;
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAcessDenied':
            break;
          default:
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: kwidth,
        height: khieght,
        child: Stack(
          children: [
            !hasError
                ? CameraPreview(controller)
                : const SizedBox(),
            Align(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  adjustHieght(khieght * 0.10),
                  Text(
                    'Selfie',
                    style: TextStyle(
                        fontSize: kwidth * 0.08, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            fadePageRoute(const MakeABizkitCardScreen()));
                      },
                      child: Text('Skip',
                          style: TextStyle(
                              color: kwhite,
                              decoration: TextDecoration.underline,
                              decorationColor: kwhite,
                              fontSize: kwidth * 0.06,
                              fontWeight: FontWeight.w300))),
                  adjustHieght(khieght * 0.05),
                  Container(
                    padding: const EdgeInsets.all(35),
                    width: kwidth * 0.28,
                    height: kwidth * 0.28,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(kwidth * 0.2)),
                      image: const DecorationImage(
                        image:
                            AssetImage('asset/images/cameraSelectBackground.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                    child: PhysicalModel(
                      color: kwhite,
                      elevation: 8.0,
                      shadowColor:
                          const Color.fromARGB(255, 15, 15, 15).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(50.0),
                      child: const CircleAvatar(
                        backgroundColor: kwhite,
                      ),
                    ),
                  ),
                  adjustHieght(khieght * 0.05),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
