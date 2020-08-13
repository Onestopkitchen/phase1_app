import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:osk_dev_app/view/widgets/bezierContainer.dart';

import 'file:///E:/ONE_STOP_KITCHEN/osk_dev_app/lib/view/screens/OSKPlus/osk_plus_item_screen.dart';

import '../cart_screen.dart';

class OskPlusCategoryScreen extends StatefulWidget {
  static String id = 'osk_plus_category_screen';
  @override
  _OskPlusCategoryScreenState createState() => _OskPlusCategoryScreenState();
}

class _OskPlusCategoryScreenState extends State<OskPlusCategoryScreen> {
  Widget headerSection(BuildContext context) {
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
            onTap: () => Navigator.pushNamed(context, CartScreen.id),
            child: Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
    );
  }

  Widget showText(String title, double size) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 10.0, top: 10.0),
      child: Text(
        title,
        style: GoogleFonts.lato(
          color: Colors.brown[800],
          fontSize: size,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget categoriesCard({String img, String title, String subtitle}) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, OskPlusItemScreen.id),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
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
              child: Column(
                children: [
                  Text(
                    title,
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87),
                  ),
                  Text(
                    subtitle,
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                        color: Colors.black87),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(),
        backgroundColor: Colors.white,
        body: Builder(
          builder: (context) => Stack(
            children: [
              Positioned(
                  top: -_height * .15,
                  right: -MediaQuery.of(context).size.width * .4,
                  child: BezierContainer()),
              ListView(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  headerSection(context),
                  SizedBox(
                    height: 10.0,
                  ),
                  showText('Osk Plus', 22),
                  SizedBox(
                    height: 10.0,
                  ),
                  showText('Categories', 18),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      primary: false,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 15,
                      childAspectRatio: 1.0,
                      children: [
                        categoriesCard(
                            title: "Dairy",
                            img: "assets/images/dairy.png",
                            subtitle: "4 items"),
                        categoriesCard(
                            title: "Veggies",
                            img: "assets/images/veggies.png",
                            subtitle: "2 items"),
                        categoriesCard(
                            title: "Fruits",
                            img: "assets/images/fruits.png",
                            subtitle: "1 items"),
                        categoriesCard(
                            title: "Essentials",
                            img: "assets/images/Essentials.png",
                            subtitle: "0 items"),
                        categoriesCard(
                            title: "Fruits",
                            img: "assets/images/fruits.png",
                            subtitle: "1 items"),
                        categoriesCard(
                            title: "Essentials",
                            img: "assets/images/Essentials.png",
                            subtitle: "0 items"),
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

//
//GridView.builder(
//itemCount: osk_plus_categories.length,
//gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//crossAxisCount: 2,
//mainAxisSpacing: 10,
//crossAxisSpacing: 10,
//childAspectRatio: 1.0),
//itemBuilder: (context, index) {
//return categoriesCard(
//title: osk_plus_categories[index].title,
//subtitle: osk_plus_categories[index].subtitle,
//img: osk_plus_categories[index].img);
//},
//),
