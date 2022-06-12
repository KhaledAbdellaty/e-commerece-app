import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({
    Key? key,
    required this.dotIndex
  }) : super(key: key);
  final double? dotIndex;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      decorator: DotsDecorator(
          activeColor: mainColor,
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: mainColor),
          )
      ),
      dotsCount: 3,
      position: dotIndex!,
    );
  }
}