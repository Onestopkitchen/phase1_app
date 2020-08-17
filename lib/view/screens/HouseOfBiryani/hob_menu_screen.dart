import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:osk_dev_app/provider/prodProvider.dart';
import 'package:osk_dev_app/view/screens/food_detail_screen.dart';
import 'package:osk_dev_app/view/widgets/bezierContainer.dart';
import 'package:provider/provider.dart';

class HobMenuScreen extends StatefulWidget {
  static String id = 'hob_menu_screen';
  @override
  _HobMenuScreenState createState() => _HobMenuScreenState();
}

class _HobMenuScreenState extends State<HobMenuScreen> {
  TextEditingController _searchController = TextEditingController();

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
            //   onTap: () => Navigator.pushNamed(context, CartScreen.id),
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

  Widget VCard(
      {int index,
      String title,
      String img,
      int price,
      int qty,
      int weight,
      int timesOrdered,
      ProdProvider prod}) {
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
                        color: Color(0xfffec609),
                      ),
                      Text(
                        "$timesOrdered times ordered",
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
                    "Weight $weight gr",
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
                            color: Color(0xfffec609),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                  onTap: () {
                                    prod.removeProductFromCart(
                                        prod.hobProducts[index]);
                                  },
                                  child: qtyButton(icon: Icons.remove)),
                              SizedBox(
                                width: 4.0,
                              ),
                              Consumer<ProdProvider>(
                                builder: (_, prod, child) => Text(
                                  prod.hobProducts[index].qty.toString(),
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 4.0,
                              ),
                              InkWell(
                                  onTap: () {
                                    prod.addProductToCart(
                                        prod.hobProducts[index]);
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
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: -5,
          child: CachedNetworkImage(
            imageUrl:
                'http://api.onestopkitchen.in/upload/featured_image/$img-b.png',
            height: MediaQuery.of(context).size.height * 0.30,
            width: MediaQuery.of(context).size.width * 0.35,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    var prodHob = Provider.of<ProdProvider>(context, listen: false);
    return Scaffold(
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
                  showText('House of Biryani', 22),
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
                  showText('Popular', 18),
                  FutureBuilder(
                    future: prodHob.getTenHobProducts(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return ListView.builder(
                          itemCount: prodHob.hobProducts.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                              child: InkWell(
                                onTap: () {
                                  prodHob
                                      .setActiveProduct(snapshot.data[index]);
                                  Navigator.pushNamed(
                                      context, FoodDetailScreen.id);
                                },
                                child: VCard(
                                  index: index,
                                  title: '${snapshot.data[index].name}',
                                  price: snapshot.data[index].price,
                                  qty: snapshot.data[index].qty,
                                  weight: snapshot.data[index].weight,
                                  timesOrdered:
                                      snapshot.data[index].timesOrdered,
                                  prod: prodHob,
                                  img: snapshot.data[index].img,
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
