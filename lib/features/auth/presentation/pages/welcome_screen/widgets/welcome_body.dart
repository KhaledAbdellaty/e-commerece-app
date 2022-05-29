import 'package:flutter/material.dart';
import 'package:new_e_commerece_app/constants/size_config.dart';
import 'package:new_e_commerece_app/constants/srtings.dart';
import 'package:new_e_commerece_app/core/presentation/widgets/custom_buttons.dart';

import '../../../../../../constants/colors.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/Organe-top-shape.png',
                ),
              ),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: SizeConfig.defaultSize! + 220,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ],
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              width: SizeConfig.screenWidth! - 52,
              child: const Text(
                'Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep',
                textAlign: TextAlign.center,
                style: TextStyle(
                    height: 1.5,
                    fontSize: 15,
                    //fontFamily: 'Metropolis-Medium',
                    color: secondaryFontColor),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            FilledButton(
              text: 'Login',
              onPressed: () => Navigator.pushNamed(context, loginScreen),
            ),
            const SizedBox(
              height: 20,
            ),
            BorderButton(
              text: 'Create an Account',
              onPressed: () => Navigator.pushNamed(context, signUpScreen),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ],
    );
  }
}
