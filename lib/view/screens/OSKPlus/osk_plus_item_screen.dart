import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:osk_dev_app/model/core/osk_plus_item.dart';
import 'package:osk_dev_app/view/screens/OSKPlus/osk_plus_detail_screen.dart';
import 'package:osk_dev_app/view/widgets/bezierContainer.dart';

import '../cart_screen.dart';

class OskPlusItemScreen extends StatefulWidget {
  static String id = 'osk_plus_item_screen';
  @override
  _OskPlusItemScreenState createState() => _OskPlusItemScreenState();
}

class _OskPlusItemScreenState extends State<OskPlusItemScreen> {
  List<OskPlusItem> osk_plus_items = [
    OskPlusItem(title: "Milk", img: "assets/images/dairy.png", weight: "1 kg"),
    OskPlusItem(
        title: "Veggies", img: "assets/images/veggies.png", weight: "2 Kg"),
    OskPlusItem(title: "Milk", img: "assets/images/dairy.png", weight: "1 kg"),
    OskPlusItem(
        title: "Veggies", img: "assets/images/veggies.png", weight: "2 Kg"),
  ];

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

  Widget itemCard({String img, String title, String weight}) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, OskPlusDetailScreen.id),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                img,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87),
                  ),
                  Text(
                    weight,
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Color(0xfffec609),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.remove,
                            size: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Text(
                          "0",
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Color(0xfffec609),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.add,
                            size: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
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
                  showText('Items available', 18),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      primary: false,
                      itemCount: osk_plus_items.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 15,
                        childAspectRatio: 0.8,
                      ),
                      itemBuilder: (context, index) {
                        return itemCard(
                            title: osk_plus_items[index].title,
                            img: osk_plus_items[index].img,
                            weight: osk_plus_items[index].weight);
                      },
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
