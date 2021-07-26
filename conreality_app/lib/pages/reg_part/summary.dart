import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const themeColor = Color(0xFF1D1E21);
const fieldDescr = Color(0xFF78797A);
const darkGrey = Color(0xFF424242);
const veryDarkGrey = Color(0xFF303030);
const darkRed = Color(0xFFB71C1C);

class SummaryTab extends StatefulWidget {
  @override
  _SummaryTabState createState() => _SummaryTabState();
}

class _SummaryTabState extends State<SummaryTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380.h,
      padding: EdgeInsets.only(top: 8.h),
      child: Column(
        children: [
          Row(
            children: [
              Text('STATISTICS',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: fieldDescr,
                  )),
            ],
          ),
          _infoContainer('Winrate', '65%'),
          _infoContainer('Last game', 'April 25, 14:30'),
          _infoContainer('Victories', '100'),
          _infoContainer('Defeats', '27'),
          _infoContainer('Draws', '2'),
          _mapArenaNavigation()
        ],
      ),
    );
  }

  Container _infoContainer(String title, String currentInfo) {
    return Container(
      margin: EdgeInsets.only(top: 9.w),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.7.w),
          color: darkGrey),
      padding: EdgeInsets.all(14.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white)),
          Text(
            currentInfo,
            style: TextStyle(
                color: fieldDescr,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }

  Container _mapArenaNavigation() {
    return Container(
      margin: EdgeInsets.only(top: 7.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _currentButton('12', () {}, ' MY MAPS'),
          _currentButton('12', () {}, ' MY ARENAS')
        ],
      ),
    );
  }

  Container _currentButton(String score, onPressed, String title) {
    return Container(
        color: darkGrey,
        width: 160.w,
        height: 48.h,
        child:
            // ignore: deprecated_member_use
            FlatButton(
                onPressed: onPressed,
                child: RichText(
                  text: TextSpan(
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
                    children: <TextSpan>[
                      TextSpan(text: score, style: TextStyle(color: darkRed)),
                      TextSpan(
                          text: title, style: TextStyle(color: Colors.white))
                    ],
                  ),
                )));
  }
}
