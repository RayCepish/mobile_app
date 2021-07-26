import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'clanBattles.dart';
import 'clanMembers.dart';
import 'clanSetting .dart';
import 'clanSummary.dart';

const themeColor = Color(0xFF1D1E21);
const fieldDescr = Color(0xFF78797A);
const darkGrey = Color(0xFF424242);
const veryDarkGrey = Color(0xFF303030);
const darkRed = Color(0xFFB71C1C);

class ClanInfo extends StatefulWidget {
  ClanInfo({Key? key}) : super(key: key);

  @override
  _ClanInfoState createState() => _ClanInfoState();
}

class _ClanInfoState extends State<ClanInfo> {
  int? curPage;

  @override
  void initState() {
    super.initState();
    curPage = 0;
  }

  Color _getColor() {
    if (curPage == 0) {
      return darkRed;
    } else {
      return darkGrey;
    }
  }

  Color _getColor1() {
    if (curPage == 1) {
      return darkRed;
    } else {
      return darkGrey;
    }
  }

  Color _getColor2() {
    if (curPage == 2) {
      return darkRed;
    } else {
      return darkGrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: themeColor,
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: viewportConstraints.maxHeight),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: 20.w,
                        right: 20.w,
                      ),
                      child: Column(
                        children: [
                          _clanFlag(),
                          Padding(
                            padding: EdgeInsets.only(top: 24.h),
                            child: Center(
                              child: Text(
                                'Clan Name',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _navigation(
                                'SUMMARY',
                                _getColor(),
                                () {
                                  setState(
                                    () {
                                      curPage = 0;
                                    },
                                  );
                                },
                              ),
                              _navigation(
                                'BATTLES',
                                _getColor1(),
                                () {
                                  setState(
                                    () {
                                      curPage = 1;
                                    },
                                  );
                                },
                              ),
                              _navigation(
                                'FRIEND',
                                _getColor2(),
                                () {
                                  setState(
                                    () {
                                      curPage = 2;
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                          Container(
                            child: Column(
                              children: [
                                if (curPage == 0) ...[
                                  ClanSummaryTab()
                                ] else if (curPage == 1) ...[
                                  ClanBattlesTab()
                                ] else if (curPage == 2) ...[
                                  ClanMembers()
                                ]
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Container _clanFlag() {
    return Container(
      margin: EdgeInsets.only(top: 40.h),
      child: Stack(
        children: [
          Container(
              child: Image.asset('assets/images/prototype/second.png',
                  width: 334.w, height: 120.h)),
          Container(
            margin: EdgeInsets.only(left: 284.w),
            color: themeColor,
            width: 50.w,
            height: 50.h,
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ClanSetting()));
              },
              child: Text(
                "SET",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _navigation(text, Color color, onPressed) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      color: color,
      width: 107.w,
      height: 50.h,
      child: TextButton(
        child: Text(text,
            style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700)),
        onPressed: onPressed,
      ),
    );
  }
}
