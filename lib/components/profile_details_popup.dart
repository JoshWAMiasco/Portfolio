import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:portfolio/blocs/navigation_cubit.dart';
import 'package:portfolio/constants/app_color.dart';
import 'package:portfolio/constants/app_font.dart';
import 'package:portfolio/constants/functions.dart';
import 'package:portfolio/pages/chat_page.dart';
import 'package:portfolio/pages/education_page.dart';
import 'package:portfolio/pages/home_page_old.dart';

class ProfileDetailsPopup extends StatefulWidget {
  const ProfileDetailsPopup({
    Key? key,
  }) : super(key: key);
  @override
  _ProfileDetailsPopupState createState() => _ProfileDetailsPopupState();
}

class _ProfileDetailsPopupState extends State<ProfileDetailsPopup> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            margin: EdgeInsets.fromLTRB(30, MediaQuery.of(context).size.height * 0.2, 30, MediaQuery.of(context).size.height * 0.4),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [AppColor.primary, Colors.white]),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white, image: DecorationImage(image: AssetImage('assets/profile.jpg'))),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Text(
                                'Joshua Miasco',
                                style: AppFont.bold(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                'App Developer',
                                style: AppFont.bold(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.cake_rounded,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            'May 5, 1997',
                            style: AppFont.bold(fontSize: 18, color: Colors.black),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.school_rounded,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(
                              'Computer Engineering Technology',
                              style: AppFont.bold(fontSize: 18, color: Colors.black),
                            ),
                          )
                        ],
                      ),
                      Expanded(child: Container()),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.bottomToTop,
                                child: BlocProvider(
                                  create: (context) => NavigationCubit(0),
                                  child: const EducationPage(),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.primary,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                              child: Text('View My Education', style: AppFont.bold(fontSize: 15, color: Colors.white)),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(onTap: () => Navigator.pop(context), child: const Icon(Icons.close, color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
