import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const themeColor = Color(0xFF1D1E21);
const fieldDescr = Color(0xFF78797A);
const darkGrey = Color(0xFF424242);
const veryDarkGrey = Color(0xFF303030);
const darkRed = Color(0xFFB71C1C);

class ClanSummaryTab extends StatefulWidget {
  ClanSummaryTab({Key? key}) : super(key: key);

  @override
  _ClanSummaryTabState createState() => _ClanSummaryTabState();
}

class _ClanSummaryTabState extends State<ClanSummaryTab> {
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
}
