import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:portfolio/constants/app_color.dart';
import 'package:portfolio/constants/app_font.dart';
import 'package:portfolio/pages/home_page.dart';
import 'package:portfolio/pages/home_page_old.dart';
import 'package:rive/rive.dart' as rive;

class RootPage extends StatefulWidget {
 const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(context, PageTransition(child: const HomePageOld(), type: PageTransitionType.fade));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Container(
          color:  Colors.grey[100],
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(
                top: 50,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome to my Portfolio',
                        style: AppFont.bold(
                          color: AppColor.primary,
                          fontSize: 25,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        'Please standby while preparing data...',
                        style: AppFont.medium(
                          color: Colors.grey[700],
                          fontSize: 15
                        ),
                      )
                    ],
                  )
                ),
              ),
              const Center(
                child: rive.RiveAnimation.asset(
                  'assets/first_rive.riv',
                  fit: BoxFit.contain,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(15, 30, 15, 10),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.35,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                        Color(0xFF6B1EFF),
                        Color(0xFF5857FE),
                      ]),
                    color: AppColor.primary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About',
                        style: AppFont.bold(
                          fontSize: 20,
                          color: Colors.white
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Text(
                        'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur',
                        style: AppFont.regular(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      Expanded(child: Container()),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () => SystemNavigator.pop(),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(10, 10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                            child: Text(
                              'Exit',
                              style: AppFont.bold(
                                color: AppColor.primary,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
