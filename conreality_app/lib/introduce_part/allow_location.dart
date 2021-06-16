import 'package:flutter/material.dart';
import '../home_screen.dart';
import 'enter_adress.dart';
// import 'package:geocoding/geocoding.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:geolocator/geolocator.dart';
import 'package:flutter/services.dart';

class AllowLocationPage extends StatefulWidget {
  @override
  _AllowLocationPageState createState() => _AllowLocationPageState();
}

class _AllowLocationPageState extends State<AllowLocationPage> {
  late Position _currentPosition;
  late String _currentAddress;

  // @override
  // void initState() {
  //   super.initState();
  //   _getCurrentLocation();
  // }

  void _getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    });
  }

  // _getAddressFromLatLng() async {
  //   try {
  //     List<Placemark> p = await geolocator.placemarkFromCoordinates(
  //         _currentPosition.latitude, _currentPosition.longitude);

  //     Placemark place = p[0];

  //     setState(() {
  //       _currentAddress =
  //           "${place.locality}, ${place.postalCode}, ${place.country}";
  //     });
  //   } catch (e) {
  // //     print(e);
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 188,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 133,
                  ),
                  Container(
                    height: 109,
                    width: 109,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/images/Vector.png"),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 107,
              ),
              Container(
                width: 274,
                height: 81,
                child: Text(
                  "Please let me see your location so you can effectively use the app's features for a fun game ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 320,
                height: 54,
                child: RaisedButton(
                  onPressed: () {
                    _getCurrentLocation();
                  },
                  child: Text("ALLOW LOCATION"),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 320,
                height: 54,
                child: FlatButton(
                  color: Colors.transparent,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConfirmAdress(),
                      ),
                    );
                  },
                  child: Text(
                    "ENTER MANUALLY",
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.white,
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
