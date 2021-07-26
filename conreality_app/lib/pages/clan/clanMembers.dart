import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const themeColor = Color(0xFF1D1E21);
const fieldDescr = Color(0xFF78797A);
const darkGrey = Color(0xFF424242);
const veryDarkGrey = Color(0xFF303030);
const darkRed = Color(0xFFB71C1C);

class ClanMembers extends StatefulWidget {
  ClanMembers({Key? key}) : super(key: key);

  @override
  _ClanMembersState createState() => _ClanMembersState();
}

class _ClanMembersState extends State<ClanMembers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.h),
      child: Column(
        children: [
          Row(
            children: [
              Text('MEMBERLIST',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: fieldDescr,
                  )),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Container(
              color: darkGrey,
              width: 335.w,
              height: 50.h,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'SEND INVITATION',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.h),
            height: 280.h,
            child: ListView(
              children: [
                _friendInfo('User Name'),
                _friendInfo('User Name'),
                _friendInfo('User Name'),
                _friendInfo('User Name'),
                _friendInfo('User Name'),
                _friendInfo('User Name'),
                _friendInfo('User Name'),
                _friendInfo('User Name'),
                _friendInfo('User Name'),
                _friendInfo('User Name'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _friendInfo(friendName) {
    return Container(
      margin: EdgeInsets.only(top: 8.h),
      padding: EdgeInsets.all(5),
      width: 335.w,
      height: 66.h,
      decoration: BoxDecoration(
          color: darkGrey,
          border: Border.all(width: 0.7.w, color: Colors.grey)),
      child: Row(
        children: [
          Container(
              width: 80.w,
              height: 80.w,
              child: Image.asset('assets/images/Portrait.png')),
          Text(
            friendName,
            style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
