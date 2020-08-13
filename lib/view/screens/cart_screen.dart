import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:osk_dev_app/provider/storeProvider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  static String id = 'cart_screen';
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  TextEditingController _couponController = TextEditingController();

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
              ),
              child: Icon(Icons.arrow_back_ios),
            ),
            onTap: () => Navigator.pop(context),
          ),
          Text(
            "My Cart",
            style: GoogleFonts.lato(
              color: Colors.brown[800],
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          InkWell(
            child: Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Icon(Icons.more_vert),
            ),
          ),
        ],
      ),
    );
  }

  Widget qtyButton({IconData icon}) {
    return Icon(
      icon,
      color: Colors.white,
      size: 14.0,
    );
  }

  Widget VOrderCard(
      {int index,
      String title,
      String img,
      double price,
      int qty,
      MyStore store}) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.145,
      padding:
          EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.20,
            width: MediaQuery.of(context).size.width * 0.20,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(img),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              // width: MediaQuery.of(context).size.width * 0.6,
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      maxLines: 2,
                      softWrap: true,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontSize: 15.0,
                          color: Colors.black87)),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Container(
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
                                store
                                    .removeProductToCart(store.products[index]);
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
                                store.addProductToCart(store.products[index]);
                              },
                              child: qtyButton(icon: Icons.add)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                width: MediaQuery.of(context).size.width * 0.2,
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  "Rs.$price",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: 15.0,
                      color: Colors.black87),
                )),
          ),
        ],
      ),
    );
  }

  Widget _chargesText({String title, String price}) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.montserrat(
              fontSize: 12,
              color: Colors.black87,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            price,
            style: GoogleFonts.montserrat(
              fontSize: 12,
              color: Colors.black87,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBottomSheet(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Text(
          "Apply Coupon here",
          style: GoogleFonts.montserrat(
              fontSize: 24.0,
              color: Colors.black87,
              fontWeight: FontWeight.w600),
        ),
        Container(
          padding:
              EdgeInsets.only(top: 40, bottom: 20, left: 10.0, right: 10.0),
          width: MediaQuery.of(context).size.width * 0.80,
          child: TextField(
            controller: _couponController,
            cursorColor: Colors.black87,
            decoration: InputDecoration(
              hintText: "Enter Coupon Code here..",
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black45),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        InkWell(
          onTap: null,
          child: Container(
            height: 40,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Center(
              child: Text(
                "Apply",
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        FlatButton(
          onPressed: null,
          child: Text(
            "Cancel",
            style: GoogleFonts.montserrat(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context); //listener
    final _height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Builder(
          builder: (context) => Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              headerSection(context),
              Container(
                height: _height * 0.45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                )),
                child: ListView.separated(
                  itemCount: store.cartProducts.length,
                  itemBuilder: (_, index) {
                    return VOrderCard(
                      index: index,
                      title: store.cartProducts[index].name,
                      img: store.cartProducts[index].img,
                      price: store.cartProducts[index].price,
                      qty: store.cartProducts[index].qty,
                      store: store,
                    );
                  },
                  separatorBuilder: (_, index) => Divider(
                    indent: 20,
                    endIndent: 20,
                    color: Colors.black12,
                  ),
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context, builder: buildBottomSheet);
                },
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.local_play,
                        size: 16,
                        color: Color(0xfffec609),
                      ),
                      Text(
                        "Apply Coupons",
                        style: GoogleFonts.montserrat(
                            fontSize: 15.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 16,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Divider(
                indent: 20,
                endIndent: 20,
                color: Colors.black87,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _chargesText(title: 'Item Total', price: 'Rs.300'),
                      _chargesText(title: 'Delivery Charge', price: 'Rs.300'),
                      _chargesText(title: 'GST Charge', price: 'Rs.300'),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: GoogleFonts.montserrat(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87),
                            ),
                            Text(
                              "Rs.900",
                              style: GoogleFonts.montserrat(
                                  fontSize: 15, color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Color(0xfffec609),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Center(
                            child: Text(
                          "Confirm Order",
                          style: GoogleFonts.montserrat(
                              fontSize: 15.0,
                              color: Colors.black87,
                              fontWeight: FontWeight.w400),
                        )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
