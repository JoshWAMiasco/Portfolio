import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:portfolio/constants/app_color.dart';
import 'package:portfolio/constants/app_font.dart';
import 'package:portfolio/pages/home_page.dart';
import 'package:rive/rive.dart';

class RootPage extends StatefulWidget {
  RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(context, PageTransition(child: const HomePage(), type: PageTransitionType.fade));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Container(
          color: AppColor.primary,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      'Preparing Data',
                      style: AppFont.bold(fontSize: 30, color: Colors.white),
                    ),
                    Expanded(child: Container()),
                    Text(
                      'Please wait...',
                      style: AppFont.bold(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const Center(
                child: RiveAnimation.asset(
                  'assets/loader2.riv',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
