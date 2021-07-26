import 'dart:collection';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'collapsed_container.dart';
import 'functions_for_google_map.dart';
import 'mapStyle.dart';
import 'opened_sliding_panel.dart';

class GoogleMapScreen extends StatefulWidget {
  late final LocationData? location;
  GoogleMapScreen({
    required this.location,
  });

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  late LocationData _locationData;
  late BitmapDescriptor mapMarker;
  Set<Marker> _markers = HashSet<Marker>();
  Set<Polygon> _polygons = HashSet<Polygon>();
  Set<Circle> _circles = HashSet<Circle>();

  bool _isPolygon = true;
  bool _isMarker = false;
  bool _isCircle = false;

  @override
  void initState() {
    super.initState();

    if (widget.location != null) {
      _locationData = widget.location!;
    }
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
      floatingActionButton:
          polygonLatLngs.length > 0 && _isPolygon ? fabPolygon() : null,
      body: SlidingUpPanel(
        backdropColor: Colors.red,
        minHeight: 270.h,
        maxHeight: MediaQuery.of(context).size.height,
        backdropEnabled: true,
        panel: Padding(
          padding: const EdgeInsets.only(top:20),
          child: OpenedSlidingPanel(),
        ),
        
        color: Colors.black,
        collapsed: Container(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: CollapsedContainer(),
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
            _buildButtonForFilter()
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
