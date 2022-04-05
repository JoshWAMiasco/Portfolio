import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_color.dart';
import 'package:portfolio/constants/app_font.dart';

class ChipImage extends StatelessWidget {
  const ChipImage({Key? key,required this.assets, this.original = false,required this.title}) : super(key: key);
  final String assets;
  final bool original;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
        child: FittedBox(
          child: Row(
            children: [
              original ? Image(
                image: AssetImage('assets/$assets'),
                height: 25,
                width: 25,
              ) 
              : ImageIcon(
                AssetImage('assets/$assets'),
                color: AppColor.primary,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: AppFont.bold(
                  color: AppColor.primary,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
