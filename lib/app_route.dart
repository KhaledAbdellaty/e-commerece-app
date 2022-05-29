import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_e_commerece_app/constants/srtings.dart';
import 'package:new_e_commerece_app/core/presentation/screens/user_screen.dart';
import 'package:new_e_commerece_app/features/auth/data/repositories/auth_repo_imp.dart';
import 'package:new_e_commerece_app/features/auth/presentation/pages/login_screen/login_screen.dart';
import 'package:new_e_commerece_app/features/splash_screen/peresntation/splash_screen.dart';
import 'core/business_logic/bloc/auth_bloc.dart';
import 'core/data/models/user.dart';
import 'features/auth/presentation/pages/signup_screen/signup_screen.dart';
import 'features/auth/presentation/pages/welcome_screen/welcome_screen.dart';

class AppRoute {
  late AuthRepoImpl authRepo;
  AppRoute() {
    authRepo = AuthRepoImpl();
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case welcomeScreen:
        return MaterialPageRoute(builder: (context) => WelcomeScreen());
      case signUpScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => AuthBloc(authRepoImpl: AuthRepoImpl()),
                  child: SignUpScreen(),
                ));
      case loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthBloc(authRepoImpl: AuthRepoImpl()),
            child: LoginScreen(),
          ),
        );
      case usersScreen:
        final user = settings.arguments as Users;
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => AuthBloc(authRepoImpl: authRepo),
                  child: UserScreen(user: user),
                ));
    }
  }
}
