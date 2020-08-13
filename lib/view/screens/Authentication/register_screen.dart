import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:osk_dev_app/model/services/authService.dart';
import 'package:osk_dev_app/view/screens/OnBoarding/brand_home_screen.dart';
import 'package:osk_dev_app/view/widgets/bezierContainer.dart';
import 'package:provider/provider.dart';

import 'file:///E:/ONE_STOP_KITCHEN/osk_dev_app/lib/view/screens/Authentication/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static String id = 'register_screen';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  TextEditingController nameEditingController = new TextEditingController();
  TextEditingController contactEditingController = new TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  Future<void> registerUser(context) async {
    try {
      if (formKey.currentState.validate()) {
        setState(() {
          isLoading = true;
        });
        final auth = Provider.of<AuthService>(context, listen: false);
        auth.setUserName = nameEditingController.text;
        auth.setUserEmail = emailEditingController.text;
        auth.setUserPassword = passwordEditingController.text;
        auth.setUserPhone = contactEditingController.text;
        final user = await auth.registerUserRequest();
        nameEditingController.clear();
        emailEditingController.clear();
        passwordEditingController.clear();
        contactEditingController.clear();
        Navigator.pushNamed(context, BrandHomeScreen.id);
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (err) {
      print("UI Register error: ${err}");
    }
  }

  Future<void> registerUserWithGoogle(context) async {
    try {
      setState(() {
        isLoading = true;
      });
      final auth = Provider.of<AuthService>(context, listen: false);
      final user = await auth.signInWithGoogle();
      print("{${user.id}, ${user.name}");
      Navigator.pushNamed(context, BrandHomeScreen.id);
    } catch (err) {
      print("UI Register error with Google: ${err}");
    }
  }

  Widget _usernameEmailPasswordWidget({bool isPassword = false}) {
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
                  "Username",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: nameEditingController,
                  validator: (val) {
                    return val.isEmpty || val.length < 3
                        ? "Enter Username 3+ characters"
                        : null;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter Username",
                      hintStyle: TextStyle(color: Colors.black54),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      fillColor: Colors.white,
                      filled: true),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Email id",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: emailEditingController,
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
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Mobile No.",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: contactEditingController,
                  decoration: InputDecoration(
                      hintText: "Enter your Contact No.",
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
                    return val.length < 10 && val.length > 10
                        ? "Enter correct Contact No."
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
                            height: height * .10,
                          ),
                          Text(
                            "Register",
                            style: GoogleFonts.lato(
                                fontSize: 24,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          ),
                          _usernameEmailPasswordWidget(isPassword: true),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              registerUser(context);
                            },
                            child: _authButton(
                              text: 'Register',
                              buttonColor: Color(0xfffec609),
                              textColor: Colors.white,
                            ),
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
                              registerUserWithGoogle(context);
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
                                  context, LoginScreen.id);
                            },
                            child: _authSwitchLabel(
                                text: 'Already have an account ?',
                                actionText: 'Login Now'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
