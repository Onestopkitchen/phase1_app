import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:osk_dev_app/view/widgets/bezierContainer.dart';

class BrandHomeScreen extends StatefulWidget {
  static String id = 'brand_home_screen';
  @override
  _BrandHomeScreenState createState() => _BrandHomeScreenState();
}

class _BrandHomeScreenState extends State<BrandHomeScreen> {
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

  Widget VCard({Color start, Color end, String title, String img}) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Container(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
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
          ),
        ),
        Positioned(
          bottom: 14,
          right: 18,
          child: Text(title,
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white)),
        ),
        Positioned(
          top: -16,
          left: -2,
          child: Container(
            width: 184.0,
            height: 184.0,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: -16,
          left: 4,
          child: SizedBox(
            width: 180.0,
            height: 180.0,
            child: Image.asset(img),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          drawer: Drawer(),
          body: Builder(
            builder: (context) => Stack(
              children: [
                Positioned(
                    top: -height * .15,
                    right: -MediaQuery.of(context).size.width * .4,
                    child: BezierContainer()),
                Container(
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      Padding(
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
                                    image: AssetImage(
                                        'assets/images/ham_icon.png'),
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
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20.0, bottom: 10.0),
                        child: Text(
                          "Our Products",
                          style: GoogleFonts.lato(
                            color: Colors.brown[800],
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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
                              child: HCard(
                                  start: Color(0xffFA7D82),
                                  end: Color(0xffFFB295),
                                  title: 'Osk Products',
                                  img: 'assets/images/breakfast.png',
                                  i1: 'Bread',
                                  i2: 'Peanut butter',
                                  i3: 'Apple'),
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
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, bottom: 10.0, top: 10.0),
                        child: Text(
                          "Our Brands",
                          style: GoogleFonts.lato(
                            color: Colors.brown[800],
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: VCard(
                                start: Color(0xfff9d660),
                                end: Color(0xfffceca8),
                                title: 'One Stop Kitchen',
                                img: 'assets/images/logo.png'),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: VCard(
                                start: Color(0xfff1d884),
                                end: Color(0xffd3a13c),
                                title: 'House of Biryani',
                                img: 'assets/images/HOB.png'),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: VCard(
                                start: Color(0xffc7fa7d),
                                end: Color(0xff92f38e),
                                title: 'Healthy Co',
                                img: 'assets/images/Healthyco.png'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
