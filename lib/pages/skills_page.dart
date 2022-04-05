import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/components/animated_list.dart';
import 'package:portfolio/components/chip_label.dart';
import 'package:portfolio/constants/app_color.dart';
import 'package:portfolio/constants/app_font.dart';

class SkillsPage extends StatelessWidget {
  SkillsPage({Key? key}) : super(key: key);

  final listOfSkillsWidget = <Widget>[
     Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(
           'Programming Language',
           style: AppFont.bold(color: AppColor.primary, fontSize: 20),
         ),
         const SizedBox(height: 10,),
         Wrap(
           alignment: WrapAlignment.start,
           children: const [
             ChipImage(
              assets: 'dart_icon.png',
              title: 'Dart',
              original: true,
            ),
            ChipImage(
               assets: 'cplus_icon.png',
               title: 'C++',
             ),
             ChipImage(
              assets: 'csharp_icon.png',
              title: 'C Sharp',
            ),
            ChipImage(
              assets: 'python_icon.png',
              title: 'Python',
              original: true,
            ),
           ],
         )
       ],
     ),
     Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Framework',
          style: AppFont.bold(color: AppColor.primary, fontSize: 20),
        ),
        const SizedBox(height: 10,),
         Wrap(
           alignment: WrapAlignment.start,
           children: const [
              ChipImage(
                assets: 'flutter_icon.png',
                title: 'Flutter',
                original: true,
              ),
              ChipImage(
              assets: 'react_icon.png',
              title: 'React',
              original: true,
            ),
           ],
         )
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Others',
          style: AppFont.bold(color: AppColor.primary, fontSize: 20),
        ),
        const SizedBox(height: 10,),
         Wrap(
           alignment: WrapAlignment.start,
           children: const [
             ChipImage(
              assets: 'figma_icon.png',
              title: 'Figma',
              original: true,
            ),
            ChipImage(
              assets: 'adobe_icon.png',
              title: 'Adobe illustrator',
              original: true,
            ),
             ChipImage(
                assets: 'firebase_icon.png',
                title: 'Firebase',
                original: true,
              ),
            //   ChipImage(
            //   assets: 'arduino_icon.png',
            //   title: 'Arduino',
            //   original: true,
            // ),
              ChipImage(
              assets: 'getx_icon.PNG',
              title: 'GetX State Management',
              original: true,
            ),
              ChipImage(
                assets: 'bloc_icon.PNG',
                title: 'Bloc State Management',
                original: true,
              ),
           ]
         )
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: AppColor.primary,
                            size: 25,
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Text(
                          'Skills',
                          style: AppFont.bold(fontSize: 28, color: AppColor.primary),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 900,
                  child: AnimationItems(
                    items: listOfSkillsWidget,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
