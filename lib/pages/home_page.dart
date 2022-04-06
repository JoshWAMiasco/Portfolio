import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/banner_card.dart';
import 'package:portfolio/components/profile_details_popup.dart';
import 'package:portfolio/constants/app_color.dart';
import 'package:portfolio/constants/app_font.dart';
import 'package:portfolio/constants/static_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Contact me @',
                          style: AppFont.bold(fontSize: 18, color: Colors.grey[700]),
                        ),
                        Container(
                          margin: const EdgeInsets.all(25),
                          child: GestureDetector(
                            onTap: () {
                              showDialog(context: context, builder: (context) => const ProfileDetailsPopup());
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 0.5, offset: Offset(1, 2))],
                                shape: BoxShape.circle,
                                color: AppColor.primary,
                              ),
                              child: const ImageIcon(
                                AssetImage('assets/profile_icon.png'),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          'Let\'s Build',
                          style: AppFont.bold(
                            fontSize: 35,
                          ),
                        ),
                        Text(
                          'Application',
                          style: AppFont.bold(
                            fontSize: 35,
                          ),
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
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'I will help you finding a solution and solve your problems, we use process design to create digital products. Besides that also help their business',
                      style: AppFont.regular(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
