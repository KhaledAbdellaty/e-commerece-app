import 'package:flutter/material.dart';
import 'package:new_e_commerece_app/constants/colors.dart';
import 'package:new_e_commerece_app/constants/srtings.dart';
import 'package:new_e_commerece_app/core/presentation/widgets/custom_buttons.dart';

import '../../../../constants/size_config.dart';
import 'custom_indicator.dart';
import 'custom_page_view.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({Key? key}) : super(key: key);

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  PageController? pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: 0,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPageView(
          pageController: pageController!,
        ),
        Positioned(
          bottom: SizeConfig.defaultSize! * 34,
          left: 0,
          right: 0,
          child: CustomIndicator(
            dotIndex: pageController!.hasClients ? pageController?.page : 0,
          ),
        ),
        Visibility(
          visible: pageController!.hasClients
              ? pageController?.page == 2
                  ? false
                  : true
              : true,
          child: Positioned(
            top: SizeConfig.defaultSize! * 10,
            right: SizeConfig.defaultSize! * 3,
            child: InkWell(
              onTap: () {
                pageController!.jumpToPage(2);
              },
              child: Text(
                'Skip',
                style: TextStyle(color: mainColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: SizeConfig.defaultSize! * 6,
          left: SizeConfig.defaultSize! * 2,
          right: SizeConfig.defaultSize! * 2,
          child: FilledButton(
            onPressed: () {
              if (pageController!.page! < 2) {
                pageController?.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              } else {
                Navigator.pushNamed(context, homeScreen);
              }
            },
            text: pageController!.hasClients
                ? pageController!.page == 2
                    ? 'Get started'
                    : 'Next'
                : 'Next',
          ),
        ),
      ],
    );
  }
}
