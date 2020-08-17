import 'package:flutter/material.dart';
import 'package:osk_dev_app/provider/authProvider.dart';
import 'package:osk_dev_app/view/screens/Authentication/mobile_number_screen.dart';
import 'package:osk_dev_app/view/screens/Authentication/register_screen.dart';
import 'package:osk_dev_app/view/screens/OnBoarding/brand_home_screen.dart';
import 'package:provider/provider.dart';

class MobileOtpScreen extends StatefulWidget {
  static String id = 'mobile_otp_screen';
  @override
  _MobileOtpScreenState createState() => _MobileOtpScreenState();
}

class _MobileOtpScreenState extends State<MobileOtpScreen> {
  final otpController = TextEditingController();
  String text = '';

  showSnackBar(msg, color, context) {
    Scaffold.of(context).showSnackBar(
      new SnackBar(
        content: new Text(
          msg,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        duration: new Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        elevation: 3.0,
        backgroundColor: color,
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Error Occured'),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text('OK!'),
          )
        ],
      ),
    );
  }

  verifyOtp() async {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    if (auth.otp.toString() == otpController.text.toString()) {
      if (auth.user_exist == null) {
        final registerNumber = await auth.registerUser();
        if (registerNumber != null) {
          Navigator.pushReplacementNamed(context, RegisterScreen.id);
        }
      } else {
        final user = await auth.getUser();
        user != null
            ? Navigator.pushReplacementNamed(context, BrandHomeScreen.id)
            : Navigator.pushReplacementNamed(context, MobileNumberScreen.id);
      }
    } else {
      print(auth.otp.toString());
      print(otpController.text);
      Navigator.pushReplacementNamed(context, MobileNumberScreen.id);
    }
  }

  Widget otpNumberWidget(int position) {
    try {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Center(
            child: Text(
          text[position],
          style: TextStyle(color: Colors.black),
        )),
      );
    } catch (e) {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: Color(0xfffec609).withOpacity(0.4),
            ),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 16,
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                          'Enter 4 digits verification code sent to your number',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              fontWeight: FontWeight.w500))),
                  Container(
                    alignment: Alignment.center,
                    width: 100,
                    child: TextField(
                      controller: otpController,
                    ),
                  ),
//                  Container(
//                    constraints: const BoxConstraints(maxWidth: 500),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                      crossAxisAlignment: CrossAxisAlignment.center,
//                      children: <Widget>[
//                        otpNumberWidget(0),
//                        otpNumberWidget(1),
//                        otpNumberWidget(2),
//                        otpNumberWidget(3),
//                      ],
//                    ),
//                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: RaisedButton(
                      onPressed: () {
                        //TODO: Validation
                        verifyOtp();
                      },
                      color: Color(0xfffec609),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14))),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Confirm',
                              style: TextStyle(color: Colors.white),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                color: Colors.black12,
                              ),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
