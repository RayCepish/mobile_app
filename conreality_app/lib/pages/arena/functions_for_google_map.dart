import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

late BitmapDescriptor mapMarker;
Set<Marker> _markers = HashSet<Marker>();
Set<Polygon> _polygons = HashSet<Polygon>();
Set<Circle> _circles = HashSet<Circle>();
List<LatLng> polygonLatLngs = [];
late double radius;
int _polygonIdCounter = 1;
int _circleIdCounter = 1;
int _markerIdCounter = 1;

void setMarkers(LatLng point) {
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

void setCircles(LatLng point) {
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

Widget fabPolygon() {
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

void setPolygon() {
  final String polygonIdVal = 'polygon_id_$_polygonIdCounter';
  _polygons.add(
    Polygon(
      polygonId: PolygonId(polygonIdVal),
      points: polygonLatLngs,
      strokeWidth: 2,
      strokeColor: Colors.yellow,
      fillColor: Colors.yellow.withOpacity(0.15),
    ),
  );
}

void setState(Null Function() param0) {}
