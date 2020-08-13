import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:osk_dev_app/view/widgets/customClipper.dart';
import 'package:osk_dev_app/view/widgets/diet_view.dart';
import 'package:osk_dev_app/view/widgets/water_view.dart';

class HealthyCoDashboard extends StatefulWidget {
  static String id = 'healthy_co_dashboard';
  @override
  _HealthyCoDashboardState createState() => _HealthyCoDashboardState();
}

class _HealthyCoDashboardState extends State<HealthyCoDashboard> {
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

  Widget HCard(
      {Color start,
      Color end,
      String title,
      String img,
      String i1,
      String i2,
      String i3}) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 10.0,
            top: 15.0,
          ),
          child: Container(
            height: MediaQuery.of(context).size.height / 3.4,
            width: MediaQuery.of(context).size.width / 3,
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: end //Hex Color
                        .withOpacity(0.6),
                    offset: const Offset(1.1, 4.0),
                    blurRadius: 8.0),
              ],
              gradient: LinearGradient(
                colors: [start, end],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(54.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 60.0, left: 16, right: 16, bottom: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white)),
                  SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Wrap(
                        children: [
                          Text(
                            "$i1,$i2,$i3",
                            style: GoogleFonts.fredokaOne(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.0,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: -14,
          left: 14,
          child: Container(
            width: 84.0,
            height: 84.0,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: -14,
          left: 14,
          child: SizedBox(
            width: 80.0,
            height: 80.0,
            child: Image.asset(img),
          ),
        ),
      ],
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
              ListView(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  headerSection(),
                  SizedBox(
                    height: 10.0,
                  ),
                  showText(
                      title: 'Healthy Co Dashboard',
                      size: 22,
                      color: Colors.black87),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DietView(),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 5.0),
                          child: InkWell(
                            onTap: () => null,
                            child: HCard(
                                start: Color(0xffFA7D82),
                                end: Color(0xffFFB295),
                                title: 'Osk Products',
                                img: 'assets/images/breakfast.png',
                                i1: 'Bread',
                                i2: 'Peanut butter',
                                i3: 'Apple'),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 5.0),
                          child: HCard(
                              start: Color(0xff738AE6),
                              end: Color(0xff5C5EDD),
                              title: 'House of Biryani',
                              img: 'assets/images/lunch.png',
                              i3: 'Avocado',
                              i2: 'Veggies',
                              i1: 'Salmon'),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 5.0),
                          child: HCard(
                            start: Color(0xffFE95B6),
                            end: Color(0xffFF5287),
                            title: 'Healthy Co',
                            img: 'assets/images/snack.png',
                            i1: 'Recommended',
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 5.0),
                          child: HCard(
                              start: Color(0xff6F72CA),
                              end: Color(0xff1E1466),
                              title: 'Dabbaco',
                              img: 'assets/images/dinner.png',
                              i2: 'Recommended'),
                        ),
                      ],
                    ),
                  ),
                  showText(title: 'Water', size: 22, color: Colors.black87),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: WaterView(),
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
