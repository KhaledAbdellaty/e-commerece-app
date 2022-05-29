import 'package:flutter/material.dart';
import 'package:new_e_commerece_app/features/auth/presentation/pages/login_screen/widgets/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: LoginBody()),
    );
  }
}
