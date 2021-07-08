import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const backgroundArenaBrowserPageBottomAppBar = Color(0xFF000000);
const isSelectedIconColor = Color(0xFFAA0000);
const colorForBottomIcons = Color(0xFF6D6A6A);
Widget bottomAppBarTextForProfileButton = Text(
  "Profile",
  style: TextStyle(
    color: Color(0xFF989898),
    fontSize: ScreenUtil().setSp(12),
    fontWeight: FontWeight.w500,
    height: ScreenUtil().setHeight(1.17),
  ),
  textAlign: TextAlign.center,
);
Widget bottomAppBarTextForProfileButtonWithSelected = Text(
  "Profile",
  style: TextStyle(
    color:  Color(0xFFAA0000),
    fontSize: ScreenUtil().setSp(12),
    fontWeight: FontWeight.w500,
    height: ScreenUtil().setHeight(1.17),
  ),
  textAlign: TextAlign.center,
);
Widget bottomAppBarTextForArenaButton = Text(
  "Arena",
  style: TextStyle(
    color: Color(0xFF989898),
    fontSize: ScreenUtil().setSp(12),
    fontWeight: FontWeight.w500,
    height: ScreenUtil().setHeight(1.17),
  ),
  textAlign: TextAlign.center,
);

Widget bottomAppBarTextForArenaButtonWithSelected  = Text(
  "Arena",
  style: TextStyle(
    color:  Color(0xFFAA0000),
    fontSize: ScreenUtil().setSp(12),
    fontWeight: FontWeight.w500,
    height: ScreenUtil().setHeight(1.17),
  ),
  textAlign: TextAlign.center,
);
Widget bottomAppBarTextForGamesButton = Text(
  "Leagues",
  style: TextStyle(
    color: Color(0xFF989898),
    fontSize: ScreenUtil().setSp(12),
    fontWeight: FontWeight.w500,
    height: ScreenUtil().setHeight(1.17),
  ),
  textAlign: TextAlign.center,
);
Widget bottomAppBarTextForGamesButtonWithSelected = Text(
  "Leagues",
  style: TextStyle(
    color: Color(0xFFAA0000),
    fontSize: ScreenUtil().setSp(12),
    fontWeight: FontWeight.w500,
    height: ScreenUtil().setHeight(1.17),
  ),
  textAlign: TextAlign.center,
);
Widget bottomAppBarTextForChatsButton = Text(
  "QR Scanner",
  style: TextStyle(
    color: Color(0xFF989898),
    fontSize: ScreenUtil().setSp(12),
    fontWeight: FontWeight.w500,
    height: ScreenUtil().setHeight(1.17),
  ),
  textAlign: TextAlign.center,
);