import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryStatusScreen extends StatelessWidget {
  static String id = 'delivery_status_screen';

  Widget orderHeaderSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          maxRadius: 40.0,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage('assets/images/snack.png'),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Order Picked Up ( ID:45 )",
              style: GoogleFonts.montserrat(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Albert has picked up your order.",
              textAlign: TextAlign.center,
              maxLines: 2,
              softWrap: true,
              style: GoogleFonts.montserrat(
                fontSize: 14,
                color: Colors.white,
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget verticalDivider({double height, Color color}) {
    return Container(
      height: height,
      child: VerticalDivider(
        color: color,
      ),
    );
  }

  Widget deliveryIcon(IconData icon) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Icon(
        icon,
        size: 30,
        color: Colors.orange,
      ),
    );
  }

  Widget deliveryText({String title, String address}) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.montserrat(fontSize: 14, color: Colors.grey),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            address,
            style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(color: Colors.redAccent),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: _height * 0.5,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30.0))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: orderHeaderSection(),
                    ),
                    Expanded(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  deliveryIcon(Icons.access_time),
                                  verticalDivider(
                                      height: 60, color: Colors.orange),
                                  verticalDivider(
                                      height: 15, color: Colors.grey),
                                  verticalDivider(
                                      height: 15, color: Colors.grey),
                                  verticalDivider(
                                      height: 15, color: Colors.grey),
                                  deliveryIcon(Icons.location_on)
                                ],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, bottom: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    deliveryText(
                                        title: "Delivery Time",
                                        address: "40 minutes"),
                                    deliveryText(
                                        title: "Delivery Address",
                                        address: "56 Model Town,New Delhi"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
