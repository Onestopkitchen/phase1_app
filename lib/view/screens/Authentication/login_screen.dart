import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:osk_dev_app/model/services/authService.dart';
import 'package:osk_dev_app/view/screens/OnBoarding/brand_home_screen.dart';
import 'package:osk_dev_app/view/widgets/bezierContainer.dart';
import 'package:provider/provider.dart';

import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  Future<void> loginUser(context) async {
    try {
      if (formKey.currentState.validate()) {
        setState(() {
          isLoading = true;
        });
        final auth = Provider.of<AuthService>(context, listen: false);
        auth.setUserEmail = emailEditingController.text;
        auth.setUserPassword = passwordEditingController.text;
        final user = await auth.loginUserRequest();
        emailEditingController.clear();
        passwordEditingController.clear();
        Navigator.pushNamed(context, BrandHomeScreen.id);
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (err) {
      print("UI Login error: ${err}");
    }
  }

  Future<void> loginUserWithGoogle(context) async {
    try {
      setState(() {
        isLoading = true;
      });
      final auth = Provider.of<AuthService>(context, listen: false);
      final user = await auth.signInWithGoogle();
      print("{${user.id}, ${user.email}");
      Navigator.pushNamed(context, BrandHomeScreen.id);
    } catch (err) {
      print("UI Register error with Google: ${err}");
    }
  }

  Widget _authButton(
      {String text, Color buttonColor, Color textColor, Border border}) {
    return Container(
      width: MediaQuery.of(context).size.width,
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

  Widget _emailPasswordWidget({bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email id",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: emailEditingController,
                  cursorColor: Color(0xfffec609),
                  decoration: InputDecoration(
                      hintText: "Enter your Email",
                      hintStyle: TextStyle(color: Colors.black54),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      fillColor: Colors.white,
                      filled: true),
                  validator: (val) {
                    return RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val)
                        ? null
                        : "Enter correct email";
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Password",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: isPassword,
                  controller: passwordEditingController,
                  decoration: InputDecoration(
                      hintText: "Enter your Password",
                      hintStyle: TextStyle(color: Colors.black54),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      fillColor: Colors.white,
                      filled: true),
                  validator: (val) {
                    return val.length < 6
                        ? "Enter Password 6+ characters"
                        : null;
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _authSwitchLabel({String text, String actionText}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.all(15),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            actionText,
            style: TextStyle(
                color: Color(0xfffec609),
                fontSize: 15,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xfffec609),
                  ),
                ),
              ),
            )
          : Container(
              child: Stack(
                children: [
                  Positioned(
                      top: -height * .15,
                      right: -MediaQuery.of(context).size.width * .4,
                      child: BezierContainer()),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height * .30,
                          ),
                          Text(
                            "Login",
                            style: GoogleFonts.lato(
                                fontSize: 24,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          ),
                          _emailPasswordWidget(isPassword: true),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              loginUser(context);
                            },
                            child: _authButton(
                              text: 'Login',
                              buttonColor: Color(0xfffec609),
                              textColor: Colors.white,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            alignment: Alignment.centerRight,
                            child: Text('Forgot Password ?',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Or",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              loginUserWithGoogle(context);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(vertical: 13),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.black //Hex Color
                                        .withOpacity(0.2),
                                    offset: const Offset(1.1, 4.0),
                                    blurRadius: 6.0,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Login with Google",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black54),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset(
                                    'assets/images/google.jpg',
                                    width: 25,
                                    height: 25,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, RegisterScreen.id);
                            },
                            child: _authSwitchLabel(
                                text: 'Don\'t have an account ?',
                                actionText: 'Register Now'),
                          ),
                        ],
                      ),
                    ),
                  ),
//                  Positioned(top: 40, left: 0, child: _backButton()),
                ],
              ),
            ),
    );
  }
}
