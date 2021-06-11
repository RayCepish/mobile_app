import 'package:flutter/material.dart';
import 'introduce_part/splash_screen_page.dart';

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
      home: SplashScreenPage(),
    );
  }
}
