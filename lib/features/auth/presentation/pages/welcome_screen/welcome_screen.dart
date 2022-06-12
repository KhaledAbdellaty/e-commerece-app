import 'package:flutter/material.dart';
import 'package:new_e_commerece_app/features/auth/presentation/pages/welcome_screen/widgets/welcome_body.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WelcomeBody(),
    );
  }
}
