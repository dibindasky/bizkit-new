import 'package:bizkit/core/const.dart';
import 'package:bizkit/fade_transition/fade_transition.dart';
import 'package:bizkit/feature/create_business_card.dart/view/screens/manuel_entries/card_creation_first.dart';
import 'package:bizkit/navbar/navba.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class StartingBusinessCardCreation extends StatefulWidget {
  const StartingBusinessCardCreation({super.key});

  @override
  State<StartingBusinessCardCreation> createState() =>
      _StartingBusinessCardCreationState();
}

class _StartingBusinessCardCreationState
    extends State<StartingBusinessCardCreation> {
  String _scanBarcode = 'Unknown';
  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
      '#ff6666',
      'Cancel',
      true,
      ScanMode.BARCODE,
    )!
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6686',
        'Cancel',
        true,
        ScanMode.QR,
      );
      print(barcodeScanRes);
    } on PlatformException {
      print('PlatformException while scanning');
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;
    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: khieght * .7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DottedBorder(
                      dashPattern: const [8, 8],
                      color: neonShade,
                      strokeWidth: 2.5,
                      child: GestureDetector(
                        onTap: () => scanQR(),
                        child: SizedBox(
                          width: 290.dm,
                          height: 150.dm,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 32.dm,
                                height: 32.dm,
                                child: const CircleAvatar(
                                  backgroundImage: AssetImage(
                                    'asset/images/carbon_add-filled.png',
                                  ),
                                ),
                              ),
                              Text(
                                'Scan Card',
                                style: TextStyle(fontSize: 10.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).push(
                        fadePageRoute(ProfileScreen()),
                      ),
                      child: Text(
                        'Create Card manually',
                        style: TextStyle(
                          color: kwhite,
                          fontSize: 10.sp,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // ElevatedButton(
              //   onPressed: () => scanBarcodeNormal(),
              //   child: const Text('Start barcode scan'),
              // ),
              // ElevatedButton(
              //   onPressed: () => scanQR(),
              //   child: const Text('Start QR scan'),
              // ),
              // ElevatedButton(
              //   onPressed: () => startBarcodeScanStream(),
              //   child: const Text('Start barcode scan stream'),
              // ),
              // Text(
              //   'Scan result : $_scanBarcode\n',
              //   style: const TextStyle(fontSize: 20),
              // ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    fadePageRoute(const BizkitBottomNavigationBar()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    border: Border.all(
                      color: neonShade,
                    ),
                  ),
                  width: 123.dm,
                  height: 45.dm,
                  child: Center(
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
