import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_color.dart';
import 'package:portfolio/constants/app_font.dart';

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({Key? key, required this.title, required this.logo, required this.role, required this.details,required this.timeline}) : super(key: key);
  final String title;
  final String logo;
  final String role;
  final String details;
  final String timeline;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 20, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(
                Icons.calendar_today,
                color: Colors.white,
                size: 25,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                timeline,
                style: AppFont.semiBold(color: Colors.white, fontSize: 14),
              )
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white.withOpacity(0.3)),
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: AppFont.bold(color: Colors.white, fontSize: 20),
                  ),
                  Image(
                    image: AssetImage(logo),
                    height: 30,
                    width: 30,
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                  padding: EdgeInsets.fromLTRB(12, 3, 12, 3),
                  child: Text(
                    'Role',
                    style: AppFont.bold(
                      color: AppColor.primary,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Text(
                  details,
                  style: AppFont.regular(color: Colors.grey[200], fontSize: 14),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                  padding: EdgeInsets.fromLTRB(12, 3, 12, 3),
                  child: Text(
                    'Position',
                    style: AppFont.bold(
                      color: AppColor.primary,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    role,
                    style: AppFont.regular(color: Colors.grey[200], fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
