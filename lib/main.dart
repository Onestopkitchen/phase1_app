import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:osk_dev_app/provider/prodProvider.dart';
import 'package:osk_dev_app/view/screens/HealthyCo/healthy_co_dashboard.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/services/authService.dart';
import 'view/screens/Authentication/login_screen.dart';
import 'view/screens/Authentication/register_screen.dart';
import 'view/screens/HealthyCo/healthy_co_auth.dart';
import 'view/screens/HealthyCo/healthy_co_diet_preference.dart';
import 'view/screens/HealthyCo/healthy_co_goal_screen.dart';
import 'view/screens/HealthyCo/healthy_co_meal_preference.dart';
import 'view/screens/HealthyCo/healthy_co_personal_info.dart';
import 'view/screens/HealthyCo/healthy_co_plan_details.dart';
import 'view/screens/HouseOfBiryani/hob_menu_screen.dart';
import 'view/screens/OSKPlus/osk_plus_category_screen.dart';
import 'view/screens/OSKPlus/osk_plus_detail_screen.dart';
import 'view/screens/OSKPlus/osk_plus_item_screen.dart';
import 'view/screens/OnBoarding/brand_home_screen.dart';
import 'view/screens/OnBoarding/splash_screen.dart';
import 'view/screens/OnBoarding/welcome_screen.dart';
import 'view/screens/OneStopKitchen/osk_menu_screen.dart';
import 'view/screens/cart_screen.dart';
import 'view/screens/delivery_status_screen.dart';
import 'view/screens/food_detail_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
//  runApp(
//    DevicePreview(
//      enabled: !kReleaseMode,
//      builder: (context) => MyApp(prefs),
//    ),
//  );
  runApp(MyApp(prefs));
}

class MyApp extends StatelessWidget {
  SharedPreferences prefs;
  MyApp(this.prefs);

  @override
  Widget build(BuildContext context) {
    var userInfo = prefs.getString('userInfo');
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (context) => AuthService(),
        ),
        ChangeNotifierProvider<ProdProvider>(
          create: (context) => ProdProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'One Stop Kitchen',
        debugShowCheckedModeBanner: false,
        initialRoute: userInfo == null ? WelcomeScreen.id : BrandHomeScreen.id,
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
          OskPlusCategoryScreen.id: (context) => OskPlusCategoryScreen(),
          OskPlusItemScreen.id: (context) => OskPlusItemScreen(),
          OskPlusDetailScreen.id: (context) => OskPlusDetailScreen(),
          HealthyCoGoalScreen.id: (context) => HealthyCoGoalScreen(),
          HealthyCoDietPreference.id: (context) => HealthyCoDietPreference(),
          HealthyCoAuth.id: (context) => HealthyCoAuth(),
          HealthyCoPersonalInfo.id: (context) => HealthyCoPersonalInfo(),
          HealthyCoMealPreference.id: (context) => HealthyCoMealPreference(),
          HealthyCoPlanDetails.id: (context) => HealthyCoPlanDetails(),
          HealthyCoDashboard.id: (context) => HealthyCoDashboard(),
        },
      ),
    );
  }
}
