import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

class LaunchUrl {
  static launchUrls({required String url}) {
    try {
      launchUrl(Uri.parse(url));
    } catch (e) {
      log('cannot launch url');
      log(e.toString());
    }
  }

  static launchCall({required String phone}) {
    try {
      launchUrl(Uri.parse("tel://$phone"));
    } catch (e) {
      log('cannot launch url');
      log(e.toString());
    }
  }
}
