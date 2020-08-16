import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OskPlusDetailScreen extends StatefulWidget {
  static String id = 'osk_plus_detail_screen';
  @override
  _OskPlusDetailScreenState createState() => _OskPlusDetailScreenState();
}

class _OskPlusDetailScreenState extends State<OskPlusDetailScreen> {
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
    return Expanded(
      flex: 2,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: BoxDecoration(
          color: Color(0xffF8E0B9),
          shape: BoxShape.circle,
          image: DecorationImage(fit: BoxFit.scaleDown, image: AssetImage(img)),
        ),
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
              ? Color(0xfffec609)
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

  Widget variantsCard({String title}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          color: Color(0xfffec609),
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.montserrat(
                color: Colors.black87,
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  Widget buildBottomSheet(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 10.0, top: 10, bottom: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              "Variants 1",
              style: GoogleFonts.montserrat(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            height: 80,
            child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return variantsCard(title: "variants $index");
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              "Variants 2",
              style: GoogleFonts.montserrat(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            height: 80,
            child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return variantsCard(title: "variants $index");
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              "Variants 3",
              style: GoogleFonts.montserrat(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            height: 80,
            child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return variantsCard(title: "variants $index");
                }),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Builder(
          builder: (context) => Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(
                  height: 5.0,
                ),
                headerSection(context),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Column(
                      children: [
                        titleSection("Banana"),
                        descriptionSection("Tasty Fruit"),
                      ],
                    ),
                  ),
                ),
                imageSection("assets/images/banana.png"),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context, builder: buildBottomSheet);
                          },
                          child: Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Color(0xfffec609),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Center(
                                child: Text(
                              "+ Add Variants",
                              style: GoogleFonts.montserrat(
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            )),
                          ),
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
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20.0),
                              child: Text(
                                "0",
                                style: GoogleFonts.montserrat(
                                  fontSize: 20,
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
                        Align(
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
                                      "Rs. 120",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 16,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                InkWell(
//                                  onTap: () {
//                                    Navigator.pushNamed(context, CartScreen.id);
//                                  },
                                  child: Container(
                                    height: 50,
                                    width: 150,
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    decoration: BoxDecoration(
                                        color: Color(0xfffec609),
                                        borderRadius:
                                            BorderRadius.circular(16.0)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
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
                                ),
                              ],
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
        ),
      ),
    );
  }
}
