import 'package:flutter/material.dart';
import 'package:location/location.dart';

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

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }
  // Check Location Permissions, and get my location

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
    );
  }
}
