import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reg_log_pages/bottom_tabBar.dart';
import 'package:reg_log_pages/pages/clan/ClanInfo%20.dart';
import 'package:reg_log_pages/pages/reg_part/summary.dart';

import '../reg_part/battles.dart';
import '../reg_part/friends.dart';

const themeColor = Color(0xFF1D1E21);
const fieldDescr = Color(0xFF78797A);
const darkGrey = Color(0xFF424242);
const veryDarkGrey = Color(0xFF303030);
const darkRed = Color(0xFFB71C1C);

class UserProfile extends StatefulWidget {
  UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  int? curPage;
  int? curColor;

  @override
  void initState() {
    super.initState();
    curPage = 0;
    curColor = 0;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
         
            backgroundColor: themeColor,
            body: LayoutBuilder(builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                          minHeight: viewportConstraints.maxHeight),
                      child: Column(children: [
                        Container(
                            padding: EdgeInsets.only(
                              left: 20.w,
                              right: 20.w,
                            ),
                            child: Column(children: [
                              Padding(
                                padding: EdgeInsets.only(top: 40.h),
                                child: _userInfoContainer(),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10.h),
                                child: _clanInfoContainer(),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  _navigation('SUMMARY', () {
                                    setState(() {
                                      curPage = 0;
                                      curColor = curPage;
                                    });
                                  }),
                                  _navigation('BATTLES', () {
                                    setState(() {
                                      curPage = 1;
                                    });
                                  }),
                                  _navigation('FRIEND', () {
                                    setState(() {
                                      curPage = 2;
                                      // curColor = curPage;
                                      // curColor == curPage
                                      //     ? Colors.white
                                      //     : Colors.amber;
                                    });
                                  }),
                                ],
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    if (curPage == 0) ...[
                                      SummaryTab()
                                    ] else if (curPage == 1) ...[
                                      BattlesTab()
                                    ] else if (curPage == 2) ...[
                                      FriendsTab()
                                    ]
                                  ],
                                ),
                              )
                            ]))
                      ])));
            })));
  }

  Widget _userInfoContainer() {
    return  Container(
        child: Stack(
          children: [
            Container(
              width: 120.w,
              height: 120.h,
              child: Image.asset('assets/images/Portrait.png'),
            ),
            Container(
              margin: EdgeInsets.only(left: 130.w),
              width: 240.w,
              height: 70.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'User Nickname',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '#1234',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: fieldDescr,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 130.w, top: 70.h),
              width: 240.w,
              height: 50.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    color: darkGrey,
                    height: 50.h,
                    width: 50.w,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'SET',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      
     
    );
  }

  Widget _clanInfoContainer() {
    return InkWell(
       onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ClanInfo(),
          ),
        );
      },
      child: Container(
        width: 330.w,
        height: 110.h,
        decoration: BoxDecoration(
            color: darkGrey,
            border: Border.all(width: 0.7.w, color: Colors.grey.shade600)),
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Padding(
              padding: EdgeInsets.all(9.w),
              child: Container(
                width: 93.w,
                height: 93.h,
                child: Image.asset('assets/images/prototype/clan_flag.png'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 215.w, top: 5.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Clan Name',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '24 members',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: fieldDescr,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _navigation(
    text,
    onPressed,
  ) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      color: darkGrey,
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
