import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:osk_dev_app/view/screens/HealthyCo/healthy_co_plan_details.dart';
import 'package:osk_dev_app/view/widgets/customClipper.dart';

class HealthyCoMealPreference extends StatefulWidget {
  static String id = 'healthy_co_meal_preference_screen';
  @override
  _HealthyCoMealPreferenceState createState() =>
      _HealthyCoMealPreferenceState();
}

class _HealthyCoMealPreferenceState extends State<HealthyCoMealPreference>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  final GlobalKey _tabKey = new GlobalKey();

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

  int _radioValue = 0;
  bool value = false;

  void _handleRadioValueChanged(int value) {
    setState(() {
      _radioValue = value;
    });
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

  Widget vegetarianSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 10.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Are you okay with eggs in desserts and breads?",
              style:
                  GoogleFonts.montserrat(color: Colors.black87, fontSize: 16),
            ),
            Row(
              children: [
                Radio(
                  value: 0,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChanged,
                  activeColor: Color(0xff38f9d7),
                ),
                Text(
                  "Yes",
                  style: GoogleFonts.montserrat(
                      color: Colors.black87, fontSize: 14),
                ),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 1,
                  groupValue: _radioValue,
                  activeColor: Color(0xff38f9d7),
                  onChanged: _handleRadioValueChanged,
                ),
                Text(
                  "No",
                  style: GoogleFonts.montserrat(
                      color: Colors.black87, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget eggetarianSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 10.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "I don't eat egg on",
              style:
                  GoogleFonts.montserrat(color: Colors.black87, fontSize: 16),
            ),
            Wrap(
              children: [
                chipText("Mon"),
                SizedBox(
                  width: 10,
                ),
                chipText("Tue"),
                SizedBox(
                  width: 10,
                ),
                chipText("Wed"),
                SizedBox(
                  width: 10,
                ),
                chipText("Thu"),
                SizedBox(
                  width: 10,
                ),
                chipText("Fri"),
                SizedBox(
                  width: 10,
                ),
                chipText("Sat"),
                SizedBox(
                  width: 10,
                ),
                chipText("Sun"),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  value: value,
                  onChanged: (bool newValue) {
                    setState(() {
                      this.value = newValue;
                    });
                  },
                  activeColor: Color(0xff38f9d7),
                ),
                Text(
                  "I eat egg on all days",
                  style: GoogleFonts.montserrat(
                      color: Colors.black87, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget nonvegSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 10),
      child: Container(
        child: ListView(
          children: [
            Text(
              "I don't eat the following meats",
              style:
                  GoogleFonts.montserrat(color: Colors.black87, fontSize: 16),
            ),
            Wrap(
              children: [
                chipText("Chicken"),
                SizedBox(
                  width: 10,
                ),
                chipText("Egg"),
                SizedBox(
                  width: 10,
                ),
                chipText("Fish"),
                SizedBox(
                  width: 10,
                ),
                chipText("Mutton"),
                SizedBox(
                  width: 10,
                ),
                chipText("Shell Fish"),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  value: value,
                  onChanged: (bool newValue) {
                    setState(() {
                      this.value = newValue;
                    });
                  },
                  activeColor: Color(0xff38f9d7),
                ),
                Text(
                  "I eat all kind of meats",
                  style: GoogleFonts.montserrat(
                      color: Colors.black87, fontSize: 16),
                ),
              ],
            ),
            Text(
              "I don't eat non-veg on",
              style:
                  GoogleFonts.montserrat(color: Colors.black87, fontSize: 16),
            ),
            Wrap(
              children: [
                chipText("Mon"),
                SizedBox(
                  width: 10,
                ),
                chipText("Tue"),
                SizedBox(
                  width: 10,
                ),
                chipText("Wed"),
                SizedBox(
                  width: 10,
                ),
                chipText("Thu"),
                SizedBox(
                  width: 10,
                ),
                chipText("Fri"),
                SizedBox(
                  width: 10,
                ),
                chipText("Sat"),
                SizedBox(
                  width: 10,
                ),
                chipText("Sun"),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  value: value,
                  onChanged: (bool newValue) {
                    setState(() {
                      this.value = newValue;
                    });
                  },
                  activeColor: Color(0xff38f9d7),
                ),
                Text(
                  "I eat non-veg on all days",
                  style: GoogleFonts.montserrat(
                      color: Colors.black87, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
                        title: 'Select Your Meal Preference',
                        size: 18,
                        color: Colors.black),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.local_dining,
                      color: Colors.black,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.transparent,
                  labelColor: Colors.black87,
                  isScrollable: true,
                  labelPadding: EdgeInsets.only(left: 20, right: 10),
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      child: Text(
                        "Vegetarian",
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Eggetarian",
                        style: GoogleFonts.montserrat(
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Non-Veg",
                        style: GoogleFonts.montserrat(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                    child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        vegetarianSection(),
                        eggetarianSection(),
                        nonvegSection(),
                      ],
                    ),
                  ),
                )),
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
                            context, HealthyCoPlanDetails.id),
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
