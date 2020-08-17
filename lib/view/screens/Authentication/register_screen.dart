import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:osk_dev_app/provider/authProvider.dart';
import 'package:osk_dev_app/view/screens/OnBoarding/brand_home_screen.dart';
import 'package:osk_dev_app/view/widgets/bezierContainer.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static String id = 'register_screen';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameEditingController = new TextEditingController();
  TextEditingController emailEditingController = new TextEditingController();

  final formKey = GlobalKey<FormState>();

//  Future<void> registerUser(context) async {
//    try {
//      if (formKey.currentState.validate()) {
//        setState(() {
//          isLoading = true;
//        });
//        final auth = Provider.of<AuthService>(context, listen: false);
//        auth.setUserName = nameEditingController.text;
//        auth.setUserEmail = emailEditingController.text;
//        auth.setUserPassword = passwordEditingController.text;
//        auth.setUserPhone = contactEditingController.text;
//        final user = await auth.registerUserRequest();
//        nameEditingController.clear();
//        emailEditingController.clear();
//        passwordEditingController.clear();
//        contactEditingController.clear();
//        user == null
//            ? Navigator.pushReplacementNamed(context, RegisterScreen.id)
//            : Navigator.pushReplacementNamed(context, BrandHomeScreen.id);
//      } else {
//        setState(() {
//          isLoading = false;
//        });
//      }
//    } catch (err) {
//      print("UI Register error: ${err}");
//    }
//  }

//  Future<void> registerUser(context) async {
//    try {
//      final auth = Provider.of<AuthProvider>(context, listen: false);
//      auth.verifyPhone('+91${contactEditingController.text.toString()}')
//          .then((value) {
//        Navigator.pushNamed(context, MobileOtpScreen.id);
//      }).catchError((e) {
//        String errorMsg = 'Cant Authenticate you, Try Again Later';
//        if (e.toString().contains(
//            'We have blocked all requests from this device due to unusual activity. Try again later.')) {
//          errorMsg = 'Please wait as you have used limited number request';
//        }
//        showErrorDialog(context, errorMsg);
//      });
//    } catch (err) {
//      print("registerUser Error frontend: ${err}");
//    }
//  }

  registerUser() async {
    try {
      final auth = Provider.of<AuthProvider>(context, listen: false);
      if (formKey.currentState.validate()) {
        auth.setName(nameEditingController.text);
        auth.setEmail(emailEditingController.text);
        final user = await auth.addtoUser();
        print(user);
        user == null
            ? Navigator.pushNamed(context, RegisterScreen.id)
            : Navigator.pushReplacementNamed(context, BrandHomeScreen.id);
      }
    } catch (err) {
      print("Error in Frontend Register: ${err}");
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
                  "Name",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: nameEditingController,
                  validator: (val) {
                    return val.isEmpty || val.length < 3
                        ? "Enter Proper Name"
                        : null;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter Name",
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

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Positioned(
                top: -height * .15,
                right: -MediaQuery.of(context).size.width * .4,
                child: BezierContainer()),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 1.1,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
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
                    _usernameEmailPasswordWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        registerUser();
                      },
                      child: _authButton(
                        text: 'Register',
                        buttonColor: Color(0xfffec609),
                        textColor: Colors.white,
                      ),
                    ),
//                    SizedBox(
//                      height: 5,
//                    ),
//                    Text(
//                      "Or",
//                      style: TextStyle(
//                        fontSize: 16,
//                        color: Colors.grey,
//                      ),
//                    ),
//                    SizedBox(
//                      height: 10,
//                    ),
//                    InkWell(
//                      onTap: () {
//                      //  registerUserWithGoogle(context);
//                      },
//                      child: Container(
//                        width: MediaQuery.of(context).size.width,
//                        padding: EdgeInsets.symmetric(vertical: 13),
//                        decoration: BoxDecoration(
//                          color: Colors.white,
//                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                          boxShadow: <BoxShadow>[
//                            BoxShadow(
//                              color: Colors.black //Hex Color
//                                  .withOpacity(0.2),
//                              offset: const Offset(1.1, 4.0),
//                              blurRadius: 6.0,
//                            ),
//                          ],
//                        ),
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          children: [
//                            Text(
//                              "Login with Google",
//                              style: TextStyle(
//                                  fontSize: 20, color: Colors.black54),
//                            ),
//                            SizedBox(
//                              width: 10,
//                            ),
//                            Image.asset(
//                              'assets/images/google.jpg',
//                              width: 25,
//                              height: 25,
//                            ),
//                          ],
//                        ),
//                      ),
//                    ),
//                    InkWell(
//                      onTap: () {
//                        Navigator.pushReplacementNamed(context, LoginScreen.id);
//                      },
//                      child: _authSwitchLabel(
//                          text: 'Already have an account ?',
//                          actionText: 'Login Now'),
//                    ),
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
