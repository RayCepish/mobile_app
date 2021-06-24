import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageOfArenaTeam extends StatefulWidget {
  PageOfArenaTeam({Key? key}) : super(key: key);

  @override
  _PageOfArenaTeamState createState() => _PageOfArenaTeamState();
}

class _PageOfArenaTeamState extends State<PageOfArenaTeam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
            onPressed: () => Navigator.of(context).pop(),
          ),
          SizedBox(
            width: 250.w,
          ),
          IconButton(
            icon: Icon(
              Icons.settings,
              size: 27.sp,
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 107.w, top: 5.h),
                child: Container(
                  width: 160,
                  height: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/area51.png"),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 93.w, top: 180.h),
            child: Column(
              children: [
                Container(
                  width: 36.w,
                  height: 16.h,
                  child:
                      Text("Team", style: TextStyle(color: Colors.grey[800])),
                ),
                Container(
                  width: 188.w,
                  height: 27.h,
                ),
                Row(
                  children: [
                    Container(
                      width: 37.w,
                      height: 22.h,
                    ),
                    Container(
                      width: 32.w,
                      height: 18.h,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
