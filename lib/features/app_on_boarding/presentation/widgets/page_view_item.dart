import 'package:flutter/material.dart';
import 'package:new_e_commerece_app/constants/colors.dart';

import '../../../../constants/size_config.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
  }) : super(key: key);
  final String imageUrl;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.defaultSize! * 10,
        ),
        SizedBox(
          child: Image.asset(imageUrl),
        ),
        SizedBox(
          height: SizeConfig.defaultSize! * 12,
        ),
        Text(
          title,
          maxLines: 1,
          style: const TextStyle(
            fontSize: 18,
            color: primaryFontColor,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: SizeConfig.defaultSize! * 3,
        ),
        SizedBox(
          width: SizeConfig.defaultSize! * 33,
          child: Text(
            subTitle,
            maxLines: 2,
            style: const TextStyle(
              height: 1.5,
              fontSize: 14,
              color: secondaryFontColor,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
