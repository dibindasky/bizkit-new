import 'dart:developer';

import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchUrl {
  static const urlMapTest = 'https://www.google.com/maps?q=';
  static const urlGoogleSearch = 'https://www.google.com/search?q=';
  static const urlGoogleLatLong =
      'https://www.google.com/maps/search/?api=1&query=LATITUDE,LONGITUDE';
  static Future<void> launchMap(
      {required String address, required BuildContext context}) async {
    try {
      launchUrl(Uri.parse(urlMapTest + address));
    } catch (e) {
      log('cannot launch url');
      log(e.toString());
      showSnackbar(context, message: errorMessage, backgroundColor: kneonShade);
    }
  }

  static Future<void> launchMapLatLong(
      {required List<double> location, required BuildContext context}) async {
    try {
      launchUrl(
        Uri.parse(
          urlGoogleLatLong
              .replaceFirst('LATITUDE', location[0].toString())
              .replaceFirst('LONGITUDE', location[1].toString()),
        ),
      );
    } catch (e) {
      log('cannot launch url');
      log(e.toString());
      showSnackbar(context, message: errorMessage, backgroundColor: kneonShade);
    }
  }

  static launchUrls({required String url}) {
    try {
      launchUrl(Uri.parse(url));
    } catch (e) {
      log('cannot launch url');
      log(e.toString());
    }
  }

  static googleSearch({required String url}) async {
    try {
      if (!url.startsWith('http')) {
        launchUrl(Uri.parse('https://$url'));
      } else {
        launchUrl(Uri.parse(url));
      }
    } catch (e) {
      log('cannot launch url');
      log(e.toString());
    }
  }

  static launchCall({required String phone}) {
    try {
      launchUrl(Uri.parse("tel://$phone"));
    } catch (e) {
      log('cannot launch url for call');
      log(e.toString());
    }
  }

  static openSMS({required String phoneNumber, required String message}) {
    final url = 'sms:$phoneNumber?body=$message';
    try {
      launchUrl(Uri.parse(url));
    } catch (e) {
      log('cannot launch url for sms');
      log(e.toString());
    }
  }

  static launchEmail(String email) async {
    try {
      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: email,
      );
      launchUrl(emailLaunchUri);
    } catch (e) {
      log('cannot launch url for email');
      log(e.toString());
    }
  }
}
