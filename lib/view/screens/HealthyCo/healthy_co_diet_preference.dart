import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:osk_dev_app/view/screens/HealthyCo/healthy_co_auth.dart';
import 'package:osk_dev_app/view/widgets/customClipper.dart';

class HealthyCoDietPreference extends StatefulWidget {
  static String id = 'healthy_co_diet_preference_screen';
  @override
  _HealthyCoDietPreferenceState createState() =>
      _HealthyCoDietPreferenceState();
}

class _HealthyCoDietPreferenceState extends State<HealthyCoDietPreference> {
  int _SelectedIndex;

  _onSelected(int index) {
    setState(() {
      _SelectedIndex = index;
    });
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

  Widget healthyCard({int index, String img, String title}) {
    return InkWell(
      onTap: () => _onSelected(index),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          decoration: BoxDecoration(
            color: _SelectedIndex != null && _SelectedIndex == index
                ? Colors.greenAccent.withOpacity(0.9)
                : Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black //Hex Color
                      .withOpacity(0.4),
                  offset: const Offset(1.1, 4.0),
                  blurRadius: 6.0),
            ],
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Image.asset(
                  img,
                ),
              ),
              Expanded(
                child: Container(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87),
                  ),
                ),
              ),
            ],
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
        drawer: Drawer(),
        backgroundColor: Colors.white,
        body: Builder(
          builder: (context) => Stack(
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
                          title: 'Select Your Diet Preference',
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
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        crossAxisCount: 2,
                        primary: false,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 15,
                        childAspectRatio: 1.2,
                        children: [
                          healthyCard(
                            index: 0,
                            title: "Ketogenic",
                            img: "assets/images/dairy.png",
                          ),
                          healthyCard(
                            index: 1,
                            title: "Low Carb",
                            img: "assets/images/veggies.png",
                          ),
                          healthyCard(
                            index: 2,
                            title: "Flexible",
                            img: "assets/images/veggies.png",
                          ),
                          healthyCard(
                            index: 3,
                            title: "Balanced",
                            img: "assets/images/veggies.png",
                          ),
                          healthyCard(
                            index: 4,
                            title: "Vegan",
                            img: "assets/images/veggies.png",
                          ),
                        ],
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
                          onTap: () =>
                              Navigator.pushNamed(context, HealthyCoAuth.id),
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
      ),
    );
  }
}
