import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:osk_dev_app/model/core/Category.dart';
import 'package:osk_dev_app/provider/prodProvider.dart';
import 'package:osk_dev_app/view/screens/food_detail_screen.dart';
import 'package:osk_dev_app/view/widgets/bezierContainer.dart';
import 'package:provider/provider.dart';

class OskMenuScreen extends StatefulWidget {
  static String id = 'osk_menu_screen';
  @override
  _OskMenuScreenState createState() => _OskMenuScreenState();
}

class _OskMenuScreenState extends State<OskMenuScreen> {
  TextEditingController _searchController = TextEditingController();

  List<Category> _categories = [
    Category(title: 'Popular', img: 'assets/images/snack.png'),
    Category(title: 'Biryani', img: 'assets/images/lunch.png'),
    Category(title: 'Rice', img: 'assets/images/breakfast.png'),
    Category(title: 'Chicken', img: 'assets/images/snack.png'),
  ];

  //TODO : Implement Provider in Categories section while selecting because setSate is not useful because it rebuilds the widget tree.
  Widget HCard({int index, String title, String img, ProdProvider prod}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 5.0),
      child: Consumer<ProdProvider>(
        builder: (_, prod, child) => Container(
          width: MediaQuery.of(context).size.width * 0.3,
          decoration: BoxDecoration(
            color: prod.activeCategory == _categories[index]
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
                    color: prod.activeCategory == _categories[index]
                        ? Colors.white
                        : Colors.black,
                    fontSize: 16.0),
              ),
              SizedBox(
                height: 7.0,
              ),
              CircleAvatar(
                maxRadius: 15.0,
                backgroundColor: prod.activeCategory == _categories[index]
                    ? Colors.white
                    : Colors.redAccent,
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 15.0,
                  color: prod.activeCategory == _categories[index]
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
                            "$timesOrdered times ordered",
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
                            "Weight $weight",
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
                                    //TODO: Remove Cart feature
                                    onTap: () {
                                      //remove product from cart based on qty
                                      prod.removeProductFromCart(
                                          prod.oskProducts[index]);
                                    },
                                    child: qtyButton(icon: Icons.remove)),
                                SizedBox(
                                  width: 4.0,
                                ),
                                Consumer<ProdProvider>(
                                  builder: (_, prod, child) => Text(
                                    prod.oskProducts[index].qty.toString(),
                                    style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 4.0,
                                ),
                                InkWell(
                                    //TODO: Add Cart feature
                                    onTap: () {
                                      //add product to cart
                                      prod.addProductToCart(
                                          prod.oskProducts[index]);
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
          //TODO: HEro widget
          child: CachedNetworkImage(
            imageUrl:
                'http://api.onestopkitchen.in/upload/featured_image/$img-b.png',
            height: MediaQuery.of(context).size.height * 0.30,
            width: MediaQuery.of(context).size.width * 0.35,
          ),
          //  tag: prod.oskProducts[index].id,
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
            //  onTap: () => Navigator.pushNamed(context, CartScreen.id),
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

  // ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    var prodOsk = Provider.of<ProdProvider>(context, listen: false);

//TODO: Try to implement scrollController
//    void getMore() {
//      _scrollController.addListener(() {
//        if (_scrollController.position.pixels ==
//            _scrollController.position.maxScrollExtent) {
//          prod.getTenOskProducts();
//        }
//      });
//    }

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
                          Icon(Icons
                              .search), //For search when user enters his wish a new page will open displaying all his favorite items filtered from backend.
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
                            onTap: () => {
                              prodOsk.setActiveCategory(_categories[index]),
                            },
                            child: HCard(
                              index: index,
                              title: _categories[index].title,
                              img: _categories[index].img,
                              prod: prodOsk,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  showText('Popular', 18),
                  Consumer<ProdProvider>(
                    builder: (_, prod, child) => FutureBuilder(
                      future: prodOsk.activeCategory != null
                          ? prodOsk.getProductsonCategory()
                          : prodOsk.getTenOskProducts(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return ListView.builder(
                            itemCount: prodOsk.activeCategory != null
                                ? prodOsk.cateProducts.length
                                : prodOsk.oskProducts.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0),
                                child: InkWell(
                                  onTap: () {
                                    prodOsk
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
                                    prod: prodOsk,
                                    img: snapshot.data[index].img,
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
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
