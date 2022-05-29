import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_e_commerece_app/constants/colors.dart';
import 'package:new_e_commerece_app/constants/srtings.dart';
import 'package:new_e_commerece_app/core/business_logic/bloc/auth_bloc.dart';
import 'package:new_e_commerece_app/core/presentation/widgets/custom_buttons.dart';
import 'package:new_e_commerece_app/core/presentation/widgets/custom_text_field.dart';

import '../../../../../../core/data/models/user.dart';
import '../../../../../../core/presentation/widgets/custom_text.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final mobileController = TextEditingController();
    final addressController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPassowrdController = TextEditingController();
    Users? user;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CreatedNewUser) {
          Navigator.pushNamed(context, usersScreen, arguments: user);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            const HeadLineText(
              title: 'Sign Up',
              subTitle: 'Add your details to Sign Up',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: nameController,
              secure: false,
              onSaved: (value) {},
              hint: 'Name',
              inputType: TextInputType.name,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: emailController,
              secure: false,
              onSaved: (value) {},
              hint: 'Email',
              inputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: mobileController,
              secure: false,
              onSaved: (value) {},
              hint: 'Mobil No',
              inputType: TextInputType.number,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: addressController,
              secure: false,
              onSaved: (value) {},
              hint: 'Address',
              inputType: TextInputType.streetAddress,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: passwordController,
              secure: true,
              onSaved: (value) {},
              hint: 'Password',
              inputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: confirmPassowrdController,
              secure: true,
              onSaved: (value) {},
              hint: 'Confirm Password',
              inputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 20,
            ),
            FilledButton(
                text: 'Sign Up',
                onPressed: () async {
                  user = Users(
                    email: emailController.text,
                    name: nameController.text,
                    password: passwordController.text,
                    address: addressController.text,
                    phoneNo: mobileController.text,
                  );

                  BlocProvider.of<AuthBloc>(context).add(
                    CreateNewUser(
                      user: user!,
                    ),
                  );
                }),
            const SizedBox(
              height: 50,
            ),
            buildText(context),
          ],
        ),
      ),
    );
  }

  Widget buildText(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushReplacementNamed(context, loginScreen),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Already have an Account?',
            style: TextStyle(color: primaryFontColor, fontSize: 16),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Login',
            style: TextStyle(
                fontFamily: 'Metropolis-Bold', fontSize: 16, color: mainColor),
          )
        ],
      ),
    );
  }
}
