import 'dart:collection';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:reg_log_pages/arena_browser.dart/tab_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../bottom_tabBar.dart';
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
  late GoogleMapController _googleMapController;
  late BitmapDescriptor _markerIcon;
  // ignore: deprecated_member_use
  List<LatLng> polygonLatLngs = [];
  late double radius;

  //ids
  int _polygonIdCounter = 1;
  int _circleIdCounter = 1;
  int _markerIdCounter = 1;

  // Type controllers
  bool _isPolygon = true; //Default
  bool _isMarker = false;
  bool _isCircle = false;

  @override
  void initState() {
    super.initState();
    _locationData = widget.location;
  }

  // void _setMarkerIcon() async {
  //   _markerIcon = await BitmapDescriptor.fromAssetImage(
  //       ImageConfiguration(), 'assets/images/Ellipse81.png');
  // }

  void _setPolygon() {
    final String polygonIdVal = 'polygon_id_$_polygonIdCounter';
    _polygons.add(Polygon(
      polygonId: PolygonId(polygonIdVal),
      points: polygonLatLngs,
      strokeWidth: 2,
      strokeColor: Colors.yellow,
      fillColor: Colors.yellow.withOpacity(0.15),
    ));
  }

  void _setCircles(LatLng point) {
    final String circleIdVal = 'circle_id_$_circleIdCounter';
    _circleIdCounter++;
    print(
        'Circle | Latitude: ${point.latitude}  Longitude: ${point.longitude}  Radius: $radius');
    _circles.add(Circle(
        circleId: CircleId(circleIdVal),
        center: point,
        radius: radius,
        fillColor: Colors.redAccent.withOpacity(0.5),
        strokeWidth: 3,
        strokeColor: Colors.redAccent));
  }

  void _setMarkers(LatLng point) {
    final String markerIdVal = 'marker_id_$_markerIdCounter';
    _markerIdCounter++;
    setState(() {
      print(
          'Marker | Latitude: ${point.latitude}  Longitude: ${point.longitude}');
      _markers.add(
        Marker(
          markerId: MarkerId(markerIdVal),
          position: point,
        ),
      );
    });
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

  Widget _fabPolygon() {
    return FloatingActionButton.extended(
      onPressed: () {
        //Remove the last point setted at the polygon
        setState(() {
          polygonLatLngs.removeLast();
        });
      },
      icon: Icon(Icons.undo),
      label: Text('Undo point'),
      backgroundColor: Colors.orange,
    );
  }

  @override
  Widget build(BuildContext context) {
    final panelController = PanelController();
    final double tabBarHeight = 80;
    return Scaffold(
      bottomNavigationBar: BottomTabBar(),
      floatingActionButton:
          polygonLatLngs.length > 0 && _isPolygon ? _fabPolygon() : null,
      body: SlidingUpPanel(
        // controller: panelController,

        backdropEnabled: true,
        panel: Center(
          child: Text("default"),
        ),
        collapsed: Container(
          decoration: BoxDecoration(
            color: Colors.grey[800],
          ),
          child: Center(
            child: Text("Slide for more features"),
          ),
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
                    _setPolygon();
                  });
                } else if (_isMarker) {
                  setState(() {
                    _markers.clear();
                    _setMarkers(point);
                  });
                } else if (_isCircle) {
                  setState(
                    () {
                      _circles.clear();
                      _setCircles(point);
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
