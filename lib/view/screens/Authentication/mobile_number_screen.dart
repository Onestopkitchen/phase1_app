import 'package:flutter/material.dart';
import 'package:osk_dev_app/provider/authProvider.dart';
import 'package:provider/provider.dart';

import 'mobile_otp_screen.dart';

class MobileNumberScreen extends StatefulWidget {
  static String id = 'mobile_number-screen';
  @override
  _MobileNumberScreenState createState() => _MobileNumberScreenState();
}

class _MobileNumberScreenState extends State<MobileNumberScreen> {
  TextEditingController _phoneController = TextEditingController();

  showSnackBar(msg, color, context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(
          msg,
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        elevation: 3.0,
        backgroundColor: color,
      ),
    );
  }

  showErrorDialog(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('Error Occured'),
              content: Text(message),
              actions: [
                FlatButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text('OK!'),
                ),
              ],
            ));
  }

  registerPhone() async {
    try {
      final auth = Provider.of<AuthProvider>(context, listen: false);
      auth.setPhoneNo(_phoneController.text.toString().trim());
      final result = await auth.getOtp();

      result['success'] == 'otp send success'
          ? Navigator.pushReplacementNamed(context, MobileOtpScreen.id)
          : Navigator.pushReplacementNamed(context, MobileNumberScreen.id);
    } catch (err) {
      print("Error in Frontend Mobile Number Screen: ${err}");
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Center(
                          child: Container(
                              constraints: const BoxConstraints(maxHeight: 340),
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              child: Image.asset('assets/images/logo.png')),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('OTP Verification',
                              style: TextStyle(
                                  color: Color(0xfffec609),
                                  fontSize: 30,
                                  fontWeight: FontWeight.w800)))
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Container(
                          constraints: const BoxConstraints(maxWidth: 500),
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: 'We will send you an ',
                                  style: TextStyle(color: Colors.black54)),
                              TextSpan(
                                  text: 'One Time Password ',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: 'on this mobile number',
                                  style: TextStyle(color: Colors.black54)),
                            ]),
                          )),
                      Container(
                          height: 40,
                          constraints: const BoxConstraints(maxWidth: 500),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4))),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: TextField(
                              controller: _phoneController,
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                              decoration: InputDecoration(
                                  hintText: 'Your Mobile Number'),
                            ),
                          )),
                      Consumer<AuthProvider>(
                        builder: (_, auth, child) => Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          constraints: const BoxConstraints(maxWidth: 500),
                          child: RaisedButton(
                            onPressed: () {
                              registerPhone();
                            },
                            color: Color(0xfffec609),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(14))),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Next',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20)),
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
