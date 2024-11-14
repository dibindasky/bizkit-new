

import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/utils/url_launcher/url_launcher_functions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScannerView extends StatefulWidget {
  const QrScannerView({super.key});

  @override
  State<QrScannerView> createState() => _QrScannerViewState();
}

class _QrScannerViewState extends State<QrScannerView> {
  BarcodeCapture? result;
  bool goturl = false;
  late MobileScannerController cameraController;

  @override
  void initState() {
    super.initState();
    cameraController = MobileScannerController();
  }

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      controller: cameraController,
      // allowDuplicates: false, // Avoid multiple scans of the same QR code
      onDetect: (barcode) {
        setState(() {
          result = barcode;
        });
        print('===========================scan===========================');
        if (result != null && result!.barcodes.isNotEmpty) {
          final code = result!.barcodes.first.rawValue;
          if (code != null) {
            print(code);
            _launchUrl(code);
          }
        }
      },
    );
  }

  // launch scanned URL to the web page
  Future<void> _launchUrl(String url) async {
    if (url.contains('/get-bizcard/')) {
      try {
        if (!goturl) {
          print(
              '===========================got url and navigated===========================');
          final id = url.split('/').last;
          goturl = true;
          cameraController.stop(); // Pause the scanner
          await GoRouter.of(context)
              .pushNamed(Routes.cardViewDeeplinking, extra: id);
          goturl = false;
          cameraController.start(); // Resume the scanner
        }
      } catch (e) {
        print('launch web ------------------web');
        await LaunchUrl.launchUrls(url: url);
      }
    }
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }
}
