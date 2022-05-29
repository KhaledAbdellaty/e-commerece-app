import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_e_commerece_app/core/business_logic/bloc/auth_bloc.dart';
import '../../../../../../constants/colors.dart';
import '../../../../../../constants/srtings.dart';
import '../../../../../../core/data/models/user.dart';
import '../../../../../../core/presentation/widgets/custom_buttons.dart';
import '../../../../../../core/presentation/widgets/custom_text.dart';
import '../../../../../../core/presentation/widgets/custom_text_field.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();
    final password = TextEditingController();
    Users? user;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoginedWithGoogle) {
          Navigator.pushNamed(context, usersScreen, arguments: user);
        } else if (state is AuthLoginedWithEmailAndPassword) {
          Navigator.pushNamed(context, usersScreen, arguments: user);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: ListView(
          // physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            const HeadLineText(
              title: 'Login',
              subTitle: 'Add your details to login',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: email,
              secure: false,
              onSaved: (value) {
                email.text = value;
              },
              hint: 'Your Email',
              inputType: TextInputType.name,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: password,
              secure: true,
              onSaved: (value) {},
              hint: 'Password',
              inputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 20,
            ),
            FilledButton(
                text: 'Login',
                onPressed: () async {
                  user = Users(
                    email: email.text,
                    password: password.text,
                  );
                  BlocProvider.of<AuthBloc>(context)
                      .add(LoginWithEmailAndPassword(user: user!));
                  print('${user!.email} / ${user!.password}');
                }),
            const SizedBox(
              height: 20,
            ),
            buildText(
              context: context,
              title: 'Forgot your password?',
              nextTitle: '',
              onTap: () {},
            ),
            const SizedBox(
              height: 60,
            ),
            buildText(
              context: context,
              title: 'or Login With',
              nextTitle: '',
              onTap: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            CusttomIconButton(
              color: const Color(0XFF367FC0),
              onPressed: () {
                print('facebook');
              },
              text: 'Login With Facebook',
              icon: Image.asset(
                'assets/icons/facebook-letter-logo.png',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CusttomIconButton(
              color: const Color(0XFFDD4B39),
              onPressed: () {
                BlocProvider.of<AuthBloc>(context)
                    .add(LoginWithGoogle(user: Users()));
                print('ss');
              },
              text: 'Login With Google',
              icon: Image.asset(
                'assets/icons/google-plus-logo.png',
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            buildText(
                context: context,
                title: 'Don\'t have an Account?',
                nextTitle: 'Sign Up',
                onTap: () =>
                    Navigator.pushReplacementNamed(context, signUpScreen))
          ],
        ),
      ),
    );
  }

  Widget buildText(
      {BuildContext? context,
      String? title,
      String? nextTitle,
      VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title!,
            style: const TextStyle(color: secondaryFontColor, fontSize: 16),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            nextTitle!,
            style: const TextStyle(
                fontFamily: 'Metropolis-Bold', fontSize: 16, color: mainColor),
          )
        ],
      ),
    );
  }
}
