import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:osk_dev_app/view/widgets/bezierContainer.dart';

class OskMenuScreen extends StatefulWidget {
  static String id = 'osk_menu_screen';
  @override
  _OskMenuScreenState createState() => _OskMenuScreenState();
}

class _OskMenuScreenState extends State<OskMenuScreen> {
  TextEditingController _searchController = TextEditingController();

  Widget HCard({String title, String img}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 15.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black //Hex Color
                    .withOpacity(0.4),
                offset: const Offset(1.1, 4.0),
                blurRadius: 6.0),
          ],
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(img),
            SizedBox(
              height: 5.0,
            ),
            Text(title),
            SizedBox(
              height: 7.0,
            ),
            CircleAvatar(
              maxRadius: 15.0,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 15.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget VCard({String title, String img, String price}) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width / 1.2,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                Text(price),
              ],
            ),
          ),
        ),
        Positioned(
          right: -30,
          bottom: -8,
          child: Image.asset(
            img,
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width / 2,
          ),
        ),
      ],
    );
  }

  Widget showText(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 10.0, top: 10.0),
      child: Text(
        title,
        style: GoogleFonts.lato(
          color: Colors.brown[800],
          fontSize: 22.0,
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
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Icon(Icons.menu),
                          ),
                          onTap: () => Scaffold.of(context).openDrawer(),
                        ),
                        InkWell(
                          child: Container(
                            height: 50.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
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
                  showText('One Stop Kitchen'),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, bottom: 10.0, top: 10.0),
                    child: Container(
                      child: Row(
                        children: [
                          Icon(Icons.search),
//                        TextField(
//                          controller: _searchController,
//
//                        ),
                        ],
                      ),
                    ),
                  ),
                  showText('Categories'),
                  Container(
                    height: MediaQuery.of(context).size.height / 3.8,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 5.0, bottom: 5.0),
                          child: HCard(
                            title: 'Osk Products',
                            img: 'assets/images/breakfast.png',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 5.0, bottom: 5.0),
                          child: HCard(
                            title: 'Osk Products',
                            img: 'assets/images/breakfast.png',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 5.0, bottom: 5.0),
                          child: HCard(
                            title: 'Osk Products',
                            img: 'assets/images/breakfast.png',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 5.0, bottom: 5.0),
                          child: HCard(
                            title: 'Osk Products',
                            img: 'assets/images/breakfast.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                  showText('Popular'),
                  Container(
                    child: ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        VCard(
                            title: 'Primavera Pizza',
                            img: 'assets/images/breakfast.png',
                            price: '500'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
