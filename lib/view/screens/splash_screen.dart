import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:osk_dev_app/view/screens/welcome_screen.dart';

class SplashScreen extends StatelessWidget {
  String _animationName = "loading";
  static String id = 'splash_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          child: FlareActor(
            'assets/flare/LoadingIndicator.flr',
            callback: (_animationName) {
              Navigator.pushReplacementNamed(context, WelcomeScreen.id);
            },
            animation: _animationName,
            sizeFromArtboard: false,
          ),
        ),
      ),
    );
  }
}
