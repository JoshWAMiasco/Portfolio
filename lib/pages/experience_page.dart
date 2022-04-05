import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/blocs/navigation_cubit.dart';
import 'package:portfolio/components/experience_card.dart';
import 'package:portfolio/constants/app_color.dart';
import 'package:portfolio/constants/app_font.dart';
import 'package:portfolio/constants/static_data.dart';

class ExperienPage extends StatelessWidget {
  const ExperienPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Positioned(
                  child: CarouselSlider(
                    options: CarouselOptions(
                        onPageChanged: (value, reason) {
                          BlocProvider.of<NavigationCubit>(context).navigateTo(value);
                        },
                        autoPlay: true,
                        disableCenter: true,
                        height: MediaQuery.of(context).size.height * 0.38,
                        enableInfiniteScroll: true,
                        
                        viewportFraction: 1),
                    items: List.generate(StaticData.experienceImage.length, (index) {
                      return CachedNetworkImage(
                        imageUrl: StaticData.experienceImage[index],
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.38,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                            ),
                          );
                        },
                        placeholder: (context, url) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.38,
                            width: MediaQuery.of(context).size.width,
                            color: AppColor.secondary.withOpacity(0.8),
                          );
                        },
                      );
                    }),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey[300]),
                              child: const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: Colors.black,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 200,
                    ),
                    Align(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              AppColor.primary,
                              AppColor.secondary,
                            ]),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            )),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Experience',
                                  style: AppFont.bold(color: Colors.white, fontSize: 25),
                                ),
                                BlocBuilder<NavigationCubit, int>(
                                  builder: (context, state) {
                                    return Row(
                                      children: List.generate(StaticData.experienceImage.length, (index) {
                                        return Container(
                                          height: 12,
                                          width: 12,
                                          margin: const EdgeInsets.only(left: 2, right: 2),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: state == index ? Colors.white: Colors.transparent,
                                            border: Border.all(color: Colors.white, width: 2.0),
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const ExperienceCard(
                              timeline: 'March 2021 - Present',
                              title: 'Kezar Atlas',
                              details: 'Assign to maintained existing project and create a base app for upcoming project, also assign to deploy apps onAppStore.',
                              logo: 'assets/kezar_logo.png',
                              role: 'App Developer',
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const ExperienceCard(
                              timeline: 'March 2019 - 2021',
                              title: 'Maxim Integrated',
                              details: 'Assign to fix a system issue on production line, also assign to autmate a repeated simple task by creating windows form application',
                              logo: 'assets/maxim_logo.png',
                              role: 'System Technician',
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const ExperienceCard(
                              timeline: 'March 2019 - 2021',
                              title: 'Maxim Integrated',
                              details: 'Assist Engineers to their task and support line issue',
                              logo: 'assets/maxim_logo.png',
                              role: 'Intern',
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
