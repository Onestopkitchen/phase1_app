import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:osk_dev_app/model/core/osk_category.dart';
import 'package:osk_dev_app/model/core/osk_item.dart';
import 'package:osk_dev_app/view/widgets/bezierContainer.dart';

class OskMenuScreen extends StatefulWidget {
  static String id = 'osk_menu_screen';
  @override
  _OskMenuScreenState createState() => _OskMenuScreenState();
}

class _OskMenuScreenState extends State<OskMenuScreen> {
  TextEditingController _searchController = TextEditingController();

  int _categorySelectedIndex = 0;
  bool isAddToCartSelected = false;
  Color cartBackgroundColor = Color(0xFFFF9B00);
  Color cartIconColor = Colors.white;

  _onCategorySelected(int index) {
    setState(() {
      _categorySelectedIndex = index;
    });
  }

  List<OskItem> osk_items = [
    OskItem(
        title: 'Margerita Pizza', img: 'assets/images/lunch.png', price: '300'),
    OskItem(title: 'Burger', img: 'assets/images/breakfast.png', price: '250'),
    OskItem(
        title: 'Chinese Items Rice Bowl',
        img: 'assets/images/snack.png',
        price: '150'),
    OskItem(title: 'Rice Bowl', img: 'assets/images/dinner.png', price: '200'),
  ];

  List<OskCategory> osk_categories = [
    OskCategory(title: 'Pizza', img: 'assets/images/lunch.png'),
    OskCategory(title: 'Burgers', img: 'assets/images/breakfast.png'),
    OskCategory(title: 'Chinese', img: 'assets/images/snack.png'),
    OskCategory(title: 'Rice Bowls', img: 'assets/images/dinner.png'),
  ];

  //TODO : Implement Provider in Categories section while selecting because setSate is not useful because it rebuilds the widget tree.
  Widget HCard({int index, String title, String img}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 5.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        decoration: BoxDecoration(
          color:
              _categorySelectedIndex != null && _categorySelectedIndex == index
                  ? Color(0xFFFF9B00)
                  : Colors.white,
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              img,
              height: MediaQuery.of(context).size.height * 0.12,
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              title,
              style: GoogleFonts.montserrat(
                  color: _categorySelectedIndex != null &&
                          _categorySelectedIndex == index
                      ? Colors.white
                      : Colors.black,
                  fontSize: 16.0),
            ),
            SizedBox(
              height: 7.0,
            ),
            CircleAvatar(
              maxRadius: 15.0,
              backgroundColor: _categorySelectedIndex != null &&
                      _categorySelectedIndex == index
                  ? Colors.white
                  : Colors.redAccent,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 15.0,
                color: _categorySelectedIndex != null &&
                        _categorySelectedIndex == index
                    ? Colors.black
                    : Colors.white,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget VCard({int index, String title, String img, String price}) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black //Hex Color
                      .withOpacity(0.4),
                  offset: const Offset(1.1, 4.0),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 14.0, top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 18,
                        color: Color(0xFFFF9B00),
                      ),
                      Text(
                        "200 times ordered",
                        style: GoogleFonts.montserrat(
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Text(
                    title,
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w400,
                        fontSize: 18.0,
                        color: Colors.black87),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "Weight 540gr",
                    textAlign: TextAlign.end,
                    style: GoogleFonts.montserrat(
                      color: Colors.black54,
                      fontSize: 12.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, bottom: 18.0),
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.height * 0.04,
                          decoration: BoxDecoration(
                            color: Color(0xFFFF9B00),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              qtyButton(icon: Icons.remove),
                              SizedBox(
                                width: 4.0,
                              ),
                              Text(
                                "4",
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 4.0,
                              ),
                              qtyButton(icon: Icons.add),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.08,
                        ),
                        Text(
                          "Rs. $price",
                          textAlign: TextAlign.end,
                          style: GoogleFonts.montserrat(
                            color: Colors.black87,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: -20,
          bottom: -4,
          child: Image.asset(
            img,
            height: MediaQuery.of(context).size.height * 0.30,
            width: MediaQuery.of(context).size.width * 0.35,
          ),
        ),
      ],
    );
  }

  Widget qtyButton({IconData icon}) {
    return Icon(
      icon,
      color: Colors.white,
      size: 14.0,
    );
  }

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

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(),
      body: Builder(
        builder: (context) => Stack(
          children: [
            Positioned(
                top: -_height * .15,
                right: -MediaQuery.of(context).size.width * .4,
                child: BezierContainer()),
            Container(
              child: ListView(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  headerSection(context),
                  SizedBox(
                    height: 10.0,
                  ),
                  showText('One Stop Kitchen', 22),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, bottom: 10.0, top: 10.0),
                    child: Container(
                      child: Row(
                        children: [
                          Icon(Icons.search),
                          Container(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0),
                            width: MediaQuery.of(context).size.width * 0.80,
                            child: TextField(
                              controller: _searchController,
                              cursorColor: Color(0xFFFF9B00),
                              decoration: InputDecoration(
                                hintText: "Search your food...",
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black45),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  showText('Categories', 18),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 5.0, bottom: 5.0),
                          child: InkWell(
                            onTap: () => _onCategorySelected(index),
                            child: HCard(
                              index: index,
                              title: osk_categories[index].title,
                              img: osk_categories[index].img,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  showText('Popular', 18),
                  ListView.builder(
                    itemCount: osk_items.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: VCard(
                            index: index,
                            title: osk_items[index].title,
                            img: osk_items[index].img,
                            price: osk_items[index].price),
                      );
                    },
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
