import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/blocs/navigation_cubit.dart';
import 'package:portfolio/constants/app_color.dart';
import 'package:portfolio/constants/app_font.dart';
import 'package:page_transition/page_transition.dart';
import 'package:portfolio/pages/education_page.dart';
import 'package:portfolio/pages/experience_page.dart';
import 'package:portfolio/pages/skills_page.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({Key? key, required this.title, required this.description, required this.path}) : super(key: key);
  final String title;
  final String description;
  final String path;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (path) {
          case 'experience':
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.bottomToTop,
                    child: BlocProvider(
                      create: (context) => NavigationCubit(0),
                      child: const ExperienPage(),
                    )));
            break;
          case 'education':
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.bottomToTop,
                    child: BlocProvider(
                      create: (context) => NavigationCubit(0),
                      child: const EducationPage(),
                    )));
            break;
          case 'skill':
            Navigator.push(context, MaterialPageRoute(builder: (context) => SkillsPage()));
            break;
          default:
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          decoration: BoxDecoration(
              gradient: const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                Color(0xFF6B1EFF),
                Color(0xFF5857FE),
              ]),
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppFont.bold(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  description,
                  style: AppFont.regular(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                Expanded(child: Container()),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                      child: Text(
                        'Read more',
                        style: AppFont.bold(fontSize: 15, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
