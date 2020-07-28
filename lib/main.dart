import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:osk_dev_app/view/screens/login_screen.dart';
import 'package:osk_dev_app/view/screens/register_screen.dart';

import 'view/screens/welcome_screen.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'One Stop Kitchen',
      debugShowCheckedModeBanner: false,
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//        textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
//          bodyText1: GoogleFonts.montserrat(textStyle: textTheme.bodyText1),
//        ),
//      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
      },
    );
  }
}
