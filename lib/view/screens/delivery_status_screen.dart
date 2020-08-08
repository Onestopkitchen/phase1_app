import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DeliveryStatusScreen extends StatefulWidget {
  static String id = 'delivery_status_screen';

  @override
  _DeliveryStatusScreenState createState() => _DeliveryStatusScreenState();
}

class _DeliveryStatusScreenState extends State<DeliveryStatusScreen> {
  final Geolocator _geolocator = Geolocator();

  Position _currentPosition;

  CameraPosition _initialLocation =
      CameraPosition(target: LatLng(26.124737, 91.798388));

  GoogleMapController mapController;

  _getCurrentLocation() async {
    await _geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        // Store the position in the variable
        _currentPosition = position;

        print('CURRENT POS: $_currentPosition');

        // For moving the camera to current location
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 18.0,
            ),
          ),
        );
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

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
        color: Color(0xfffec609),
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
            Container(
              child: GoogleMap(
                initialCameraPosition: _initialLocation,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                mapType: MapType.normal,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: false,
                onMapCreated: (GoogleMapController controller) {
                  mapController = controller;
                },
              ),
            ),
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
                                      height: 60, color: Color(0xfffec609)),
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
            Positioned(
              top: 30,
              right: 10,
              child: ClipOval(
                child: Material(
                  color: Colors.orange[100], // button color
                  child: InkWell(
                    splashColor: Color(0xfffec609), // inkwell color
                    child: SizedBox(
                      width: 56,
                      height: 56,
                      child: Icon(Icons.my_location),
                    ),
                    onTap: () {
                      // TODO: Add the operation to be performed
                      _getCurrentLocation();
                      // on button tap
                    },
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
