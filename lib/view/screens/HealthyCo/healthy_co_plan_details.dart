import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:osk_dev_app/view/screens/HealthyCo/healthy_co_dashboard.dart';
import 'package:osk_dev_app/view/widgets/customClipper.dart';

class HealthyCoPlanDetails extends StatefulWidget {
  static String id = 'healthy_co_plan_details_screen';
  @override
  _HealthyCoPlanDetailsState createState() => _HealthyCoPlanDetailsState();
}

class _HealthyCoPlanDetailsState extends State<HealthyCoPlanDetails> {
  TextEditingController addressController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();

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

  Widget chipText(String text) {
    return Chip(
      elevation: 8,
      padding: EdgeInsets.only(left: 10, right: 10),
      label: Text(
        text,
        style: GoogleFonts.montserrat(fontSize: 14, color: Colors.black87),
      ),
    );
  }

  DateTime _dateTime;

  pickDate() {
    showDatePicker(
            context: context,
            initialDate: _dateTime == null ? DateTime.now() : _dateTime,
            firstDate: DateTime(2020),
            lastDate: DateTime(2022))
        .then((date) {
      setState(() {
        _dateTime = date;
      });
    });
  }

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
            ListView(
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
                showText(title: 'Plan Details', size: 18, color: Colors.black),
                SizedBox(
                  height: 10,
                ),
                showText(title: 'No. of days', size: 16, color: Colors.black87),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 10),
                  child: Wrap(
                    children: [
                      chipText("5"),
                      SizedBox(
                        width: 10,
                      ),
                      chipText("14"),
                      SizedBox(
                        width: 10,
                      ),
                      chipText("30"),
                      SizedBox(
                        width: 10,
                      ),
                      chipText("60"),
                      SizedBox(
                        width: 10,
                      ),
                      chipText("90"),
                      SizedBox(
                        width: 10,
                      ),
                      chipText("Other"),
                    ],
                  ),
                ),
                showText(
                    title: 'Types of meals', size: 16, color: Colors.black87),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 10),
                  child: Wrap(
                    children: [
                      chipText("Breakfast"),
                      SizedBox(
                        width: 10,
                      ),
                      chipText("Lunch"),
                      SizedBox(
                        width: 10,
                      ),
                      chipText("Snack"),
                      SizedBox(
                        width: 10,
                      ),
                      chipText("Dinner"),
                    ],
                  ),
                ),
                showText(title: 'Start Date', size: 16, color: Colors.black87),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: InkWell(
                    onTap: () => pickDate(),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(0xff22e4ac),
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(
                        child: Text(_dateTime == null
                            ? 'Pick Start Date'
                            : _dateTime.toString()),
                      ),
                    ),
                  ),
                ),
                showText(title: 'Price', size: 16, color: Colors.black87),
                showText(
                    title: 'Rs. 5500 for 5 days | Rs. 275 per meal',
                    size: 16,
                    color: Colors.redAccent),
                showText(title: 'Address', size: 16, color: Colors.black87),
                enterField(addressController, "Flat No., Building, Road, Area"),
                showText(title: 'Pincode', size: 16, color: Colors.black87),
                enterField(pincodeController, "6 Digit Pincode"),
                showText(title: 'City', size: 16, color: Colors.black87),
                enterField(cityController, "Enter City Name"),
                showText(title: 'State', size: 16, color: Colors.black87),
                enterField(stateController, "Enter State"),
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
                        onTap: () => () =>
                            Navigator.pushNamed(context, HealthyCoDashboard.id),
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
