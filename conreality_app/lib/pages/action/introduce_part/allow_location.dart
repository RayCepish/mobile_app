import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:reg_log_pages/bottom_tabBar.dart';
import 'package:reg_log_pages/pages/onb/onb.dart';

class AllowLocationPage extends StatefulWidget {
  @override
  _AllowLocationPageState createState() => _AllowLocationPageState();
}

class _AllowLocationPageState extends State<AllowLocationPage> {
  late Position _currentPosition;
  late String _currentAddress;

  void _getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then(
      (Position position) {
        setState(
          () {
            _currentPosition = position;
            if (_currentPosition == position) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (BuildContext context) => BottomTabBar(),
                ),
              );
            } else {
              Timer(
                Duration(seconds: 1),
                () => {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => OnBoardingPage(),
                  )),
                },
              );
            }
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
    );
  }
}
