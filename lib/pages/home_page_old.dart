import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:portfolio/blocs/navigation_cubit.dart';
import 'package:portfolio/blocs/selection_cubit.dart';
import 'package:portfolio/components/banner_card.dart';
import 'package:portfolio/components/profile_details_popup.dart';
import 'package:portfolio/constants/app_color.dart';
import 'package:portfolio/constants/app_font.dart';
import 'package:portfolio/constants/functions.dart';
import 'package:portfolio/constants/static_data.dart';
import 'package:portfolio/pages/chat_page.dart';
import 'package:portfolio/pages/experience_page.dart';
import 'package:portfolio/pages/skills_page.dart';

class HomePageOld extends StatelessWidget {
  const HomePageOld({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: null,
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const ProfileDetailsPopup();
                                  });
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(shape: BoxShape.circle, color: AppColor.primary, boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 2, offset: Offset(0, 4))]),
                              child: const Icon(
                                Icons.info_rounded,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Hey There,',
                            style: AppFont.bold(
                              fontSize: 32,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'I\'m Joshua,',
                            style: AppFont.bold(
                              fontSize: 32,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'I design and develop mobile application and provide solution to your needs.',
                            style: AppFont.regular(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 100),
                                child: Image(
                                  image: AssetImage('assets/pastel_background.png'),
                                ),
                              ),
                              const Positioned(
                                bottom: 1,
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 100),
                                  child: Image(
                                    image: AssetImage('assets/profile_background.png'),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 1,
                                child: SizedBox(
                                  height: 110,
                                  child: Stack(
                                    children: [
                                      GestureDetector(
                                        onTap: () => Navigator.push(
                                            context,
                                            PageTransition(
                                                child: BlocProvider(
                                                  create: (context) => NavigationCubit(0),
                                                  child: const ExperienPage(),
                                                ),
                                                type: PageTransitionType.bottomToTop)),
                                        child: Container(
                                          width: MediaQuery.of(context).size.width * 0.9,
                                          padding: const EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                                                AppColor.primary,
                                                AppColor.secondary,
                                              ])),
                                          child: Text(
                                            'I’m 1 year full stack flutter mobile developer.\nI ensure application to delivered from design to production',
                                            style: AppFont.medium(fontSize: 14, color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 2,
                                        right: 20,
                                        child: TextButton(
                                          style: TextButton.styleFrom(backgroundColor: Colors.white, shadowColor: Colors.grey, elevation: 3, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), minimumSize: const Size(10, 15), padding: EdgeInsets.zero),
                                          onPressed: () => Navigator.push(
                                              context,
                                              PageTransition(
                                                  child: BlocProvider(
                                                    create: (context) => NavigationCubit(0),
                                                    child: const ExperienPage(),
                                                  ),
                                                  type: PageTransitionType.bottomToTop)),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                                            child: Text(
                                              'View My Experience',
                                              style: AppFont.bold(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 50, bottom: 30, left: 20),
                                  child: Image(image: AssetImage('assets/dev_back.png')),
                                ),
                                Text(
                                  'Using a new Framework ( Flutter ) created by google with wide community we can create bueatiful application targeted a multi-platform with single code base',
                                  style: AppFont.medium(
                                    fontSize: 14,
                                  ),
                                ),
                                Positioned(
                                  bottom: 5,
                                  right: 5,
                                  child: TextButton(
                                    style: TextButton.styleFrom(backgroundColor: AppColor.primary, shadowColor: Colors.grey, elevation: 3, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), minimumSize: const Size(10, 15), padding: EdgeInsets.zero),
                                    onPressed: () => Navigator.push(
                                        context,
                                        PageTransition(
                                            child: BlocProvider(
                                              create: (context) => NavigationCubit(0),
                                              child: SkillsPage(),
                                            ),
                                            type: PageTransitionType.bottomToTop)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                                      child: Text(
                                        'View My Skills',
                                        style: AppFont.bold(fontSize: 14, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'My Latest Work',
                            style: AppFont.bold(
                              color: Colors.grey[700],
                              fontSize: 30,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'I’m currently working at Kezar Innovation and here’s my contributions on thier existing application and new projects.',
                            style: AppFont.medium(
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  CarouselSlider(
                    items: List.generate(StaticData.banneData.length, (index) {
                      return BannerCard(
                        logo: StaticData.banneData[index].logo,
                        path: StaticData.banneData[index].path,
                        title: StaticData.banneData[index].title,
                        description: StaticData.banneData[index].description,
                      );
                    }),
                    options: CarouselOptions(height: 200, enlargeCenterPage: true, autoPlay: true, pauseAutoPlayOnTouch: true),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Image(
                    width: MediaQuery.of(context).size.width,
                    image: const AssetImage('assets/wave.png'),
                    fit: BoxFit.fitWidth,
                  ),
                  Container(
                    height: 250,
                    padding: const EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(border: Border.all(color: AppColor.primary), gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [AppColor.primary, AppColor.secondary])),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact me @',
                          style: AppFont.bold(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: TextButton(
                            style: TextButton.styleFrom(backgroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              launchURL(context, 'tel://+639993529200');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ImageIcon(
                                  const AssetImage('assets/phone_icon.png'),
                                  color: AppColor.primary,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '+63 999-3529-200',
                                  style: AppFont.bold(
                                    color: Colors.grey.shade800,
                                    fontSize: 15,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: TextButton(
                            style: TextButton.styleFrom(backgroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              // String? encodeQueryParameters(Map<String, String> params) {
                              //   return params.entries.map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&');
                              // }

                              // final Uri emailLaunchUri = Uri(
                              //   scheme: 'mailto',
                              //   path: 'joshua.miasco@gmail.com',
                              //   query: encodeQueryParameters(<String, String>{'subject': 'Joshua App Portfolio'}),
                              // );
                              // launchURL(context, emailLaunchUri.toString());
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Image(
                                  image: AssetImage('assets/gmail_icon.png'),
                                  height: 25,
                                  width: 25,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'joshua.miasco@gmail.com',
                                  style: AppFont.bold(
                                    color: Colors.grey.shade800,
                                    fontSize: 15,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: TextButton(
                            style: TextButton.styleFrom(backgroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              //Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.leftToRight,
                                      child: BlocProvider(
                                        create: (context) => SelectionCubit(''),
                                        child: ChatPage(),
                                      )));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.message_rounded,
                                  color: AppColor.primary,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Chat Here',
                                  style: AppFont.bold(
                                    color: Colors.grey.shade800,
                                    fontSize: 15,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
