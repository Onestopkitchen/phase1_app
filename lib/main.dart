import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'view/screens/brand_home_screen.dart';
import 'view/screens/cart_screen.dart';
import 'view/screens/delivery_status_screen.dart';
import 'view/screens/food_detail_screen.dart';
import 'view/screens/hob_menu_screen.dart';
import 'view/screens/login_screen.dart';
import 'view/screens/osk_menu_screen.dart';
import 'view/screens/register_screen.dart';
import 'view/screens/splash_screen.dart';
import 'view/screens/welcome_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(),
    ),
  );
//  runApp(MyApp());
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
      initialRoute: FoodDetailScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        BrandHomeScreen.id: (context) => BrandHomeScreen(),
        OskMenuScreen.id: (context) => OskMenuScreen(),
        HobMenuScreen.id: (context) => HobMenuScreen(),
        CartScreen.id: (context) => CartScreen(),
        FoodDetailScreen.id: (context) => FoodDetailScreen(),
        DeliveryStatusScreen.id: (context) => DeliveryStatusScreen(),
      },
    );
  }
}
