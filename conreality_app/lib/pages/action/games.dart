import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'container_games.dart';

class GamesPageOfAction extends StatefulWidget {
  GamesPageOfAction({Key? key}) : super(key: key);

  @override
  _GamesPageOfActionState createState() => _GamesPageOfActionState();
}

class _GamesPageOfActionState extends State<GamesPageOfAction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 22.w,
              ),
              _buildButton()
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          Container(
            height: 535,
            child: ListView(
              children: [
               ContainerInTheGamedTabOnAction(invitedOrNot: "YOU ARE CREATOR",),
               ContainerInTheGamedTabOnAction(invitedOrNot: "YOU`VE BEEN INVITED",),
               ContainerInTheGamedTabOnAction(invitedOrNot: "YOU`VE BEEN INVITED",),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildButton() {
  return Container(
    width: 335.w,
    height: 50.h,
    child: RaisedButton(
      color: Colors.red[800],
      shape: RoundedRectangleBorder(),
      onPressed: () {},
      child: Text(
        "CREATE NEW GAME ",
        style: TextStyle(
            fontFamily: "TTSquares-Italic",
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
            color: Colors.white,
            height: 1.16.h),
        textAlign: TextAlign.center,
      ),
    ),
  );
}