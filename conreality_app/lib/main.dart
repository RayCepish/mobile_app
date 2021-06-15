import 'package:conreality_app/profile/profile.dart';
import 'package:flutter/material.dart';
import 'introduce_part/splash_screen_page.dart';
import 'leagues/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
    primarySwatch: Colors.grey,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  
  ),
      home: MainLeaguesPage(),
    );
  }
}
