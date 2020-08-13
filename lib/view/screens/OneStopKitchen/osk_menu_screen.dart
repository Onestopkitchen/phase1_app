import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:osk_dev_app/model/core/osk_category.dart';
import 'package:osk_dev_app/provider/storeProvider.dart';
import 'package:osk_dev_app/view/widgets/bezierContainer.dart';
import 'package:provider/provider.dart';

import '../cart_screen.dart';
import '../food_detail_screen.dart';

class OskMenuScreen extends StatefulWidget {
  static String id = 'osk_menu_screen';
  @override
  _OskMenuScreenState createState() => _OskMenuScreenState();
}

class _OskMenuScreenState extends State<OskMenuScreen> {
  TextEditingController _searchController = TextEditingController();

  int _categorySelectedIndex = 0;
  bool isAddToCartSelected = false;
  Color cartBackgroundColor = Color(0xfffec609);
  Color cartIconColor = Colors.white;

  _onCategorySelected(int index) {
    setState(() {
      _categorySelectedIndex = index;
    });
  }

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
                  ? Color(0xfffec609)
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

  Widget VCard(
      {int index,
      String title,
      String img,
      double price,
      int qty,
      MyStore store}) {
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
              padding: const EdgeInsets.only(left: 14.0, top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 18,
                            color: Color(0xfffec609),
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
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            maxLines: 2,
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontSize: 18.0,
                                color: Colors.black87),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Weight 540gr",
                            textAlign: TextAlign.end,
                            style: GoogleFonts.montserrat(
                              color: Colors.black54,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: MediaQuery.of(context).size.height * 0.04,
                            decoration: BoxDecoration(
                              color: Color(0xfffec609),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                    onTap: () {
                                      //remove product from cart based on qty
                                      store.removeProductToCart(
                                          store.products[index]);
                                    },
                                    child: qtyButton(icon: Icons.remove)),
                                SizedBox(
                                  width: 4.0,
                                ),
                                Text(
                                  qty.toString(),
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 4.0,
                                ),
                                InkWell(
                                    onTap: () {
                                      //add product to cart
                                      store.addProductToCart(
                                          store.products[index]);
                                    },
                                    child: qtyButton(icon: Icons.add)),
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
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: -5,
          child: Hero(
            tag: store.products[index].id,
            child: Image.asset(
              img,
              height: MediaQuery.of(context).size.height * 0.30,
              width: MediaQuery.of(context).size.width * 0.35,
            ),
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

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    var store = Provider.of<MyStore>(context); //listener
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
                              cursorColor: Color(0xfffec609),
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
                    itemCount: store.products.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: InkWell(
                          onTap: () {
                            //TODO: Try to implement in pushNamed way
                            //Setting the active product
                            store.setActiveProduct(store.products[index]);
                            //Moving to detail page
                            Navigator.pushNamed(context, FoodDetailScreen.id);
                          },
                          child: VCard(
                              index: index,
                              store: store,
                              title: store.products[index].name,
                              img: store.products[index].img,
                              price: store.products[index].price,
                              qty: store.products[index].qty),
                        ),
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
