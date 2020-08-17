import 'package:flutter/material.dart';
import 'package:osk_dev_app/provider/authProvider.dart';
import 'package:osk_dev_app/view/screens/Authentication/mobile_number_screen.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Widget _logo() {
    return Image.asset(
      'assets/images/logo.png',
      fit: BoxFit.cover,
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width / 1,
    );
  }

  Widget _authButton(
      {String text, Color buttonColor, Color textColor, Border border}) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.3,
      padding: EdgeInsets.symmetric(vertical: 13),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        border: border,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Color(0xfffec609).withAlpha(100),
              offset: Offset(2, 4),
              blurRadius: 8,
              spreadRadius: 2)
        ],
        color: buttonColor,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          color: textColor,
        ),
      ),
    );
  }

//  Widget _label() {
//    return Container(
//        margin: EdgeInsets.only(top: 40, bottom: 20),
//        child: Column(
//          children: <Widget>[
////            Text(
////              'Quick login with Touch ID',
////              style: TextStyle(color: Color(0xFFFF9B00), fontSize: 17),
////            ),
//            SizedBox(
//              height: 20,
//            ),
//            Icon(Icons.fingerprint, size: 60, color: Color(0xfffec609)),
////            SizedBox(
////              height: 20,
////            ),
////            Text(
////              'Touch ID',
////              style: TextStyle(
////                color: Color(0xFFFF9B00),
////                fontSize: 15,
////                decoration: TextDecoration.underline,
////              ),
////            ),
//          ],
//        ));
//  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _logo(),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, MobileNumberScreen.id);
                },
                child: _authButton(
                  text: 'Login',
                  buttonColor: Colors.white,
                  textColor: Color(0xfffec609),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, MobileNumberScreen.id);
                },
                child: _authButton(
                  text: 'Register Now',
                  buttonColor: Color(0xfffec609), //FF9B00
                  textColor: Colors.white,
                  // border: Border.all(color: Colors.white, width: 2)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
