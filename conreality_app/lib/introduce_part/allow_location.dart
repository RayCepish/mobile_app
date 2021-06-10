import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../home_screen.dart';
import 'enter_adress.dart';

class AllowLocationPage extends StatefulWidget {
  @override
  _AllowLocationPageState createState() => _AllowLocationPageState();
}

class _AllowLocationPageState extends State<AllowLocationPage> {
  Location location = new Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  // ignore: unused_field
  late LocationData _locationData;
  // late bool _confirmNextPage;
  // late bool _enterMannualy;

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  void _checkLocationPermission() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
  }

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
                  onPressed: () {},
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
