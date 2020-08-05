import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodDetailScreen extends StatefulWidget {
  static String id = 'food_detail_screen';
  @override
  _FoodDetailScreenState createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  int _sizeSelectedIndex = 0;

  _onSizeSelected(int index) {
    setState(() {
      _sizeSelectedIndex = index;
    });
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
              ),
              child: Icon(Icons.arrow_back_ios),
            ),
            onTap: () => Navigator.pop(context),
          ),
          InkWell(
            child: Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Icon(Icons.favorite_border),
            ),
          ),
        ],
      ),
    );
  }

  Widget titleSection(String title) {
    return Text(
      title,
      style: GoogleFonts.lato(
          fontWeight: FontWeight.w600, color: Colors.black87, fontSize: 20),
    );
  }

  Widget descriptionSection(String description) {
    return Padding(
      padding: const EdgeInsets.only(left: 60.0, right: 60),
      child: Text(
        description,
        maxLines: 3,
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
            fontWeight: FontWeight.w400, color: Colors.black87, fontSize: 16),
      ),
    );
  }

  Widget imageSection(String img) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        color: Color(0xffF8E0B9),
        shape: BoxShape.circle,
        image: DecorationImage(fit: BoxFit.scaleDown, image: AssetImage(img)),
      ),
    );
  }

  Widget sizeButton({int index, String text}) {
    return InkWell(
      onTap: () => _onSizeSelected(index),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: _sizeSelectedIndex != null && _sizeSelectedIndex == index
              ? Color(0xFFf9d660)
              : Colors.white30,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Center(
            child: Text(
          text,
          style: GoogleFonts.montserrat(
              color: _sizeSelectedIndex != null && _sizeSelectedIndex == index
                  ? Colors.black87
                  : Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        )),
      ),
    );
  }

  Widget qtyButton(IconData icon) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: Color(0xFFf9d660),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Icon(
        icon,
        size: 20,
        color: Colors.orange,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              height: 10.0,
            ),
            headerSection(context),
            titleSection("Bacon Burger"),
            SizedBox(height: 10),
            descriptionSection(
                "A Signature flame-grilled beef patty topped with smoked bacon."),
            SizedBox(height: 20),
            imageSection("assets/images/HOB.png"),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                sizeButton(text: "S", index: 0),
                sizeButton(text: "M", index: 1),
                sizeButton(text: "L", index: 2),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                qtyButton(Icons.remove),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    "2",
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                    ),
                  ),
                ),
                qtyButton(Icons.add),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Price",
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            "Rs.300",
                            style: GoogleFonts.montserrat(
                                fontSize: 16,
                                color: Colors.black87,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Container(
                        height: 50,
                        width: 150,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            color: Color(0xFFf9d660),
                            borderRadius: BorderRadius.circular(16.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.shopping_cart),
                            Text(
                              "Go to Cart",
                              style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600),
                            ),
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
    );
  }
}
