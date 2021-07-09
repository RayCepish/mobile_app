// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reg_log_pages/profile/profile.dart';
import 'package:reg_log_pages/reg_part/signIn.dart';

import 'arena_browser.dart/google_map.dart';
import 'introduce_part/splash_screen_page.dart';
import 'leagues/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GoogleMapScreen(location: null,),
      ),
    );
  }
}
