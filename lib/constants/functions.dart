 import 'dart:developer';

import 'package:flutter/material.dart';
 import 'package:url_launcher/url_launcher.dart';

void launchURL(BuildContext context, String url) async {
  try {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      log('Could not launch google map');
    }
  } catch (err) {
    log('Could not launch google map');
  }
}
