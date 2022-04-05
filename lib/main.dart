import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/pages/home_page.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/pages/root_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
       MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  RootPage(),
    )
    );
  });
}