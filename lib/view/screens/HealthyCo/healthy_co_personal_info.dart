import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:osk_dev_app/view/screens/HealthyCo/healthy_co_meal_preference.dart';
import 'package:osk_dev_app/view/widgets/customClipper.dart';

class HealthyCoPersonalInfo extends StatefulWidget {
  static String id = 'healthy_co_personal_info_screen';
  @override
  _HealthyCoPersonalInfoState createState() => _HealthyCoPersonalInfoState();
}

class _HealthyCoPersonalInfoState extends State<HealthyCoPersonalInfo> {
  TextEditingController _ageController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  TextEditingController _heightController = TextEditingController();

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

  var gender = ['Select Listing', 'Male', 'Female', 'Prefer Not to say'];

  var currentItemSelected = "Select Listing";

  Widget enterField(TextEditingController controller, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        cursorColor: Color(0xfffec609),
        decoration: InputDecoration(
          hintText: text,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black45),
          ),
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        title: 'Personal Info', size: 18, color: Colors.black),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    child: Center(
                      child: SingleChildScrollView(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              showText(
                                  title: 'Gender',
                                  size: 16,
                                  color: Colors.black),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, right: 25.0),
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color: Colors.black //Hex Color
                                              .withOpacity(0.4),
                                          offset: const Offset(1.1, 4.0),
                                          blurRadius: 6.0),
                                    ],
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      value: this.currentItemSelected,
                                      onChanged: (String newValueSelected) {
                                        setState(() {
                                          this.currentItemSelected =
                                              newValueSelected;
                                        });
                                      },
                                      items: gender
                                          .map((String dropDownStringItem) {
                                        return DropdownMenuItem<String>(
                                          value: dropDownStringItem,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              dropDownStringItem,
                                              style: TextStyle(
                                                  decoration:
                                                      TextDecoration.none),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                              showText(
                                  title: 'Age', size: 16, color: Colors.black),
                              enterField(_ageController, "Enter age in years"),
                              showText(
                                  title: 'Height',
                                  size: 16,
                                  color: Colors.black),
                              enterField(
                                  _heightController, "Enter height in cm"),
                              showText(
                                  title: 'Weight',
                                  size: 16,
                                  color: Colors.black),
                              enterField(
                                  _weightController, "Enter weight in kg"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
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
                            context, HealthyCoMealPreference.id),
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
