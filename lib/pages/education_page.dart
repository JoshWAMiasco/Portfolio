import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/blocs/navigation_cubit.dart';
import 'package:portfolio/components/experience_card.dart';
import 'package:portfolio/constants/app_color.dart';
import 'package:portfolio/constants/app_font.dart';
import 'package:portfolio/constants/functions.dart';
import 'package:portfolio/constants/static_data.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({Key? key}) : super(key: key);

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
                    items: List.generate(StaticData.educationImages.length, (index) {
                      return CachedNetworkImage(
                        imageUrl: StaticData.educationImages[index],
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
                                  'Education',
                                  style: AppFont.bold(color: Colors.white, fontSize: 25),
                                ),
                                BlocBuilder<NavigationCubit, int>(
                                  builder: (context, state) {
                                    return Row(
                                      children: List.generate(StaticData.educationImages.length, (index) {
                                        return Container(
                                          height: 12,
                                          width: 12,
                                          margin: const EdgeInsets.only(left: 2, right: 2),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: state == index ? Colors.white : Colors.transparent,
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
                              height: 30,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                                padding: EdgeInsets.fromLTRB(12, 3, 12, 3),
                                child: Text(
                                  'Course',
                                  style: AppFont.bold(
                                    color: AppColor.primary,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'Computer Engineering Technology',
                                  style: AppFont.semiBold(fontSize: 16, color: Colors.grey[200]),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                                padding: EdgeInsets.fromLTRB(12, 3, 12, 3),
                                child: Text(
                                  'University',
                                  style: AppFont.bold(
                                    color: AppColor.primary,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'Technological Univeristy of the Philippines',
                                  style: AppFont.semiBold(fontSize: 15, color: Colors.grey[200]),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                                padding: EdgeInsets.fromLTRB(12, 3, 12, 3),
                                child: Text(
                                  'Details',
                                  style: AppFont.bold(
                                    color: AppColor.primary,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'A premier state university with recognized excellence in engineering and technology education at par with leading universities in the ASEAN region',
                                  style: AppFont.semiBold(fontSize: 15, color: Colors.grey[200]),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CachedNetworkImage(
                              imageUrl: StaticData.tupMap,
                              imageBuilder: (context, imageProvider) {
                                return Container(
                                  height: 250,
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), image: DecorationImage(image: imageProvider, fit: BoxFit.cover)),
                                );
                              },
                              placeholder: (context, url) {
                                return Container(
                                  height: 250,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: AppColor.secondary.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                launchURL(context, StaticData.tupMapUrl);
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                child: Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.pin_drop_rounded,
                                        color: AppColor.primary,
                                        size: 25,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'View on Google Maps',
                                        style: AppFont.bold(color: Colors.grey[700], fontSize: 20),
                                      )
                                    ],
                                  ),
                                ),
                              ),
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
