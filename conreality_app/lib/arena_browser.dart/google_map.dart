import 'dart:collection';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:reg_log_pages/arena_browser.dart/tab_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../bottom_tabBar.dart';
import 'collapsed_container.dart';
import 'functions_for_google_map.dart';
import 'mapStyle.dart';

class GoogleMapScreen extends StatefulWidget {
  final LocationData location;
  const GoogleMapScreen({required this.location});

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  late LocationData _locationData;
  // Set<Marker> _markers = {};
  late BitmapDescriptor mapMarker;
  // Maps
  Set<Marker> _markers = HashSet<Marker>();
  Set<Polygon> _polygons = HashSet<Polygon>();
  Set<Circle> _circles = HashSet<Circle>();

  // Type controllers
  bool _isPolygon = true; //Default
  bool _isMarker = false;
  bool _isCircle = false;

  @override
  void initState() {
    super.initState();
    _locationData = widget.location;
  }

  void _onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(Utils.mapStyle);
    setState(
      () {
        _markers.add(
          Marker(
            markerId: MarkerId("0"),
            position: LatLng(49.842957, 24.031111),
            // icon: mapMarker,
            infoWindow: InfoWindow(
              title: "Lviv",
              snippet: "Your default city!",
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomTabBar(),
      floatingActionButton:
          polygonLatLngs.length > 0 && _isPolygon ? fabPolygon() : null,
      body: SlidingUpPanel(
        minHeight: 300,
        maxHeight: 550,
        backdropEnabled: true,
        panel: Center(
          child: Text("More featureus"),
        ),
        color: Colors.black,
        collapsed: Container(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child:CollapsedContainer(),
        ),
        body: Stack(
          children: [
            GoogleMap(
              mapToolbarEnabled: false,
              myLocationButtonEnabled: false,
              zoomGesturesEnabled: true,
              rotateGesturesEnabled: false,
              zoomControlsEnabled: false,
              initialCameraPosition: CameraPosition(
                target: LatLng(49.842957, 24.031111),
                zoom: 10,
              ),
              onMapCreated: _onMapCreated,
              markers: _markers,
              circles: _circles,
              polygons: _polygons,
              myLocationEnabled: true,
              onTap: (point) {
                if (_isPolygon) {
                  setState(() {
                    polygonLatLngs.add(point);
                    setPolygon();
                  });
                } else if (_isMarker) {
                  setState(() {
                    _markers.clear();
                    setMarkers(point);
                  });
                } else if (_isCircle) {
                  setState(
                    () {
                      _circles.clear();
                      setCircles(point);
                    },
                  );
                }
              },
            ),
            _buildSearchTextField(),
            _buildButtonForFilter(),
          ],
        ),
      ),
    );
  }
}

Widget _buildSearchTextField() {
  return Positioned(
    top: 39,
    right: 83,
    left: 20,
    child: Container(
      width: 272.0,
      height: 50,
      child: TextField(
        cursorColor: Colors.black,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.go,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[800],
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2.0),
          ),
          hintText: "Search",
          hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
        ),
      ),
    ),
  );
}

Widget _buildButtonForFilter() {
  return Positioned(
    top: 39,
    right: 20,
    child: Container(
      width: 50,
      height: 50,
      child: RaisedButton(
        onPressed: () {},
        child: Container(
          child: Text(
            "FIL TER",
            maxLines: 2,
            overflow: TextOverflow.clip,
            style: TextStyle(color: Colors.red, fontSize: 10),
          ),
        ),
        color: Colors.grey[800],
      ),
    ),
  );
}
