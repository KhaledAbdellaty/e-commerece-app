import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_e_commerece_app/app_route.dart';
import 'package:new_e_commerece_app/constants/colors.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(
    appRoute: AppRoute(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRoute appRoute;
  const MyApp({Key? key, required this.appRoute}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Colors.black,
            fontFamily: 'Metropolis-Bold',
            fontSize: 25,
          ),
        ),
        fontFamily: 'Metropolis',
        primaryColor: mainColor,
      ),
      onGenerateRoute: appRoute.generateRoute,
    );
  }
}
