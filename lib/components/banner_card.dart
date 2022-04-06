import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/blocs/navigation_cubit.dart';
import 'package:portfolio/constants/app_color.dart';
import 'package:portfolio/constants/app_font.dart';
import 'package:page_transition/page_transition.dart';
import 'package:portfolio/pages/education_page.dart';
import 'package:portfolio/pages/experience_page.dart';
import 'package:portfolio/pages/project_details_page.dart';
import 'package:portfolio/pages/skills_page.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({Key? key, required this.title, required this.description, required this.path, required this.logo}) : super(key: key);
  final String title;
  final String description;
  final String path;
  final String logo;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (path) {
          case 'nurseloop':
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.bottomToTop,
                child: BlocProvider(
                  create: (context) => NavigationCubit(0),
                  child: const ProjectDetailsPage(
                    title: 'Nurseloop',
                    description: 'Nurseloop is a free-to-download app that lets nurses connect to healthcare facilities seamlessly. With a few, simple-to-follow steps, you will be ready with an account that\'s set to take on jobs with a simple click',
                    contribution: [
                      'Create new UI/UX Phase 2',
                      'Apply GetX State Management',
                    ],
                    pictures: [
                      'https://firebasestorage.googleapis.com/v0/b/portfolio-93c51.appspot.com/o/nurseloop.PNG?alt=media&token=25d67d9d-490e-4957-81f2-7426fc55fba6',
                      'https://firebasestorage.googleapis.com/v0/b/portfolio-93c51.appspot.com/o/nurseloop_2.PNG?alt=media&token=682eb925-7e0e-446d-8b97-43e54d6c1e4d',
                      'https://firebasestorage.googleapis.com/v0/b/portfolio-93c51.appspot.com/o/nurseloop_3.PNG?alt=media&token=785b86ae-379a-44e3-b741-ad41c1826692',
                    ],
                  ),
                ),
              ),
            );
            break;
          case 'raketship':
            Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.bottomToTop,
                  child: BlocProvider(
                    create: (context) => NavigationCubit(0),
                    child: const ProjectDetailsPage(
                      title: 'RaketShip',
                      description: 'Raketship is the newest, homegrown on-demand delivery service that utilizes the network created by private cars traversing provincial routes to transport your parcels and deliveries - no more queues, no more cut-off times, a door-to-door provincial delivery service at the touch of your fingertip',
                      contribution: [
                        'Create Base App Phase 1',
                        'Apply Bloc State Management',
                      ],
                      pictures: [
                        'https://firebasestorage.googleapis.com/v0/b/portfolio-93c51.appspot.com/o/raketship.PNG?alt=media&token=3d016b01-fafd-413e-bfed-e263347808e2',
                        'https://firebasestorage.googleapis.com/v0/b/portfolio-93c51.appspot.com/o/raketship_2.PNG?alt=media&token=f13fde73-8664-4b0b-9cdc-81e15b6d504b',
                        'https://firebasestorage.googleapis.com/v0/b/portfolio-93c51.appspot.com/o/raketship_3.PNG?alt=media&token=11eea0dd-25e1-4aa6-bedf-5bb0f204a8a2', 
                      ],
                    ),
                  ),
                ),
              );
            break;
          case 'dentpal':
            Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.bottomToTop,
                  child: BlocProvider(
                    create: (context) => NavigationCubit(0),
                    child: const ProjectDetailsPage(
                      title: 'DentPal',
                      description: 'The leading Online Shopping app in the Dental Industry in Southeast Asia, powered by R and R Newtech Dental Corp is the Leading Online Shopping app in the Dental Industry in Southeast Asia that offers convenient and smooth transaction to Dental practitioners without leaving their Practice. DentPal provides all user with an easy, secure, and fast online shopping experience',
                      contribution: [
                        'Create new UI/UX Phase 2',
                        'Resolve Bugs',
                      ],
                      pictures: [
                        'https://firebasestorage.googleapis.com/v0/b/portfolio-93c51.appspot.com/o/dentpal.PNG?alt=media&token=3b0fbded-609a-4b70-afb9-ff58e0fd7ffc',
                        'https://firebasestorage.googleapis.com/v0/b/portfolio-93c51.appspot.com/o/dentpal_2.PNG?alt=media&token=606eee52-ed82-4900-9e13-63a6c1b1c29c',
                        'https://firebasestorage.googleapis.com/v0/b/portfolio-93c51.appspot.com/o/dentpal_3.PNG?alt=media&token=e561798e-da5f-4782-a228-cdf3d3784f99',
                      ],
                    ),
                  ),
                ),
              );
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
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: AssetImage(logo))),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      title,
                      style: AppFont.bold(
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    ),
                  ],
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
