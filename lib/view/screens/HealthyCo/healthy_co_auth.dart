import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:osk_dev_app/view/screens/HealthyCo/healthy_co_personal_info.dart';
import 'package:osk_dev_app/view/widgets/customClipper.dart';

class HealthyCoAuth extends StatefulWidget {
  static String id = 'healthy_co_auth_screen';
  @override
  _HealthyCoAuthState createState() => _HealthyCoAuthState();
}

class _HealthyCoAuthState extends State<HealthyCoAuth> {
  TextEditingController nameEditingController = new TextEditingController();
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController phoneEditingController = new TextEditingController();

  final formKey = GlobalKey<FormState>();

  Widget BezierContainer() {
    return Container(
        child: Transform.rotate(
      angle: -pi / 3.5,
      child: ClipPath(
        clipper: ClipPainter(),
        child: Container(
          height: MediaQuery.of(context).size.height * .5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff43e97b), Color(0xff38f9d7)])),
        ),
      ),
    ));
  }

  Widget _nameEmailPhoneWidget() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 10),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                          controller: nameEditingController,
                          validator: (val) {
                            return val.isEmpty || val.length < 3
                                ? "Enter Username 3+ characters"
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
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
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
                          "Contact No.",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: phoneEditingController,
                          decoration: InputDecoration(
                              hintText: "70XXXXX78X",
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
                            return val.length == 10
                                ? null
                                : "Enter correct Contact No.";
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget showText({String title, double size, Color color}) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 10.0, top: 10.0),
      child: Text(
        title,
        style: GoogleFonts.lato(
          fontSize: size,
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget headerSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            child: Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                  scale: 5.0,
                  image: AssetImage('assets/images/ham_icon.png'),
                ),
              ),
            ),
            onTap: () => Scaffold.of(context).openDrawer(),
          ),
          InkWell(
            child: Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Icon(Icons.person_outline),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
                top: -height * .15,
                right: -MediaQuery.of(context).size.width * .4,
                child: BezierContainer()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.0,
                ),
                headerSection(),
                SizedBox(
                  height: 10.0,
                ),
                showText(title: 'Healthy Co', size: 22, color: Colors.green),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    showText(
                        title: 'Select Your Goal',
                        size: 18,
                        color: Colors.black),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.golf_course,
                      color: Colors.black,
                    )
                  ],
                ),
                _nameEmailPhoneWidget(),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Color(0xff22e4ac),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Center(
                              child: Text(
                            "Back",
                            style: GoogleFonts.montserrat(
                                fontSize: 16, color: Colors.white),
                          )),
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.pushNamed(
                            context, HealthyCoPersonalInfo.id),
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Color(0xff22e4ac),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Center(
                              child: Text(
                            "Next",
                            style: GoogleFonts.montserrat(
                                fontSize: 16, color: Colors.white),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
