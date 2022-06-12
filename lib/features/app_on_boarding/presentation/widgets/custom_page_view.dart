import 'package:flutter/material.dart';
import 'package:new_e_commerece_app/features/app_on_boarding/presentation/widgets/page_view_item.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({Key? key, required this.pageController})
      : super(key: key);
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          imageUrl: 'assets/images/onBoarding-1.png',
          title: 'Find Food You Love',
          subTitle:
              'Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep',
        ),
        PageViewItem(
          imageUrl: 'assets/images/onBoarding-2.png',
          title: 'Fast Delivery',
          subTitle: 'Fast food delivery to your home, office wherever you are',
        ),
        PageViewItem(
          imageUrl: 'assets/images/onBoarding-3.png',
          title: 'Live Tracking',
          subTitle:
              'Real time tracking of your food on the app once you placed the order',
        ),
      ],
    );
  }
}
 