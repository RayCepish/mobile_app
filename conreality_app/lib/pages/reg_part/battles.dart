import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const themeColor = Color(0xFF1D1E21);
const fieldDescr = Color(0xFF78797A);
const darkGrey = Color(0xFF424242);
const veryDarkGrey = Color(0xFF303030);
const darkRed = Color(0xFFB71C1C);

class BattlesTab extends StatefulWidget {
  @override
  _BattlesTab createState() => _BattlesTab();
}

class _BattlesTab extends State<BattlesTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360.h,
      padding: EdgeInsets.only(top: 10.h),
      child: Column(
        children: [
          Row(
            children: [
              Text('MATCH HISTORY',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: fieldDescr,
                  )),
            ],
          ),
          Container(
            height: 330.h,
            child: ListView(
              children: [
                _matchHistory('Game Mode', 'Defeat', '00:00', '3 days ago'),
                _matchHistory('Game Mode', 'Defeat', '00:00', '3 days ago'),
                _matchHistory('Game Mode', 'Defeat', '00:00', '3 days ago'),
                _matchHistory('Game Mode', 'Defeat', '00:00', '3 days ago'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _matchHistory(gamemode, gameresult, gametime, days) {
    return Container(
      height: 60.h,
      margin: EdgeInsets.only(top: 9.w),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.7.w),
          color: darkGrey),
      padding: EdgeInsets.all(7.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(gamemode,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white)),
              Text(gameresult,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                gametime,
                style: TextStyle(
                    color: fieldDescr,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                days,
                style: TextStyle(
                    color: fieldDescr,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400),
              )
            ],
          )
        ],
      ),
    );
  }
}