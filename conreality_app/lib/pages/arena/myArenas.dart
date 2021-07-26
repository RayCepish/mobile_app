import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';

import 'createNewArenaFirstScreen.dart';
import 'myAreaViewInfo.dart';

const themeColor = Color(0xFF1D1E21);
const fieldDescr = Color(0xFF78797A);
const darkGrey = Color(0xFF424242);
const veryDarkGrey = Color(0xFF303030);
const darkRed = Color(0xFFB71C1C);

class MyArenas extends StatefulWidget {
  MyArenas({Key? key}) : super(key: key);

  @override
  _MyArenasState createState() => _MyArenasState();
}

class _MyArenasState extends State<MyArenas> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: themeColor,
            appBar: AppBar(
                leading: Container(),
                backgroundColor: themeColor,
                centerTitle: true,
                elevation: 0,
                title: Text(
                  'My Arenas',
                  style: TextStyle(fontSize: 24.sp, color: Colors.white),
                )),
            body: LayoutBuilder(builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                          minHeight: viewportConstraints.maxHeight),
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 20.w,
                          right: 20.w,
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 12.h, bottom: 12.h),
                              width: 335.w,
                              height: 50.h,
                              color: darkRed,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (c) =>
                                              CreateNewArenaFirstScreen()));
                                },
                                child: Text('CREATE NEW ARENA',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14.sp)),
                              ),
                            ),
                            _arenaCardInfo(),
                            _arenaCardInfo()
                          ],
                        ),
                      )));
            })));
  }

  Widget _arenaCardInfo() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => MyArenaViewInfo()));
      },
      child: Container(
        height: 208.h,
        margin: EdgeInsets.only(top: 12.h),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 2.h),
              width: 334.w,
              height: 198.h,
              color: darkGrey,
            ),
            Container(
              margin: EdgeInsets.only(top: 17.h, left: 15.w),
              width: 150.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 69.w,
                    height: 24.h,
                    color: themeColor,
                    child: Center(
                      child: Text(
                        'Game Tech',
                        style: TextStyle(
                            color: fieldDescr,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Container(
                    width: 69.w,
                    height: 24.h,
                    color: themeColor,
                    child: Center(
                      child: Text(
                        'Game Tech',
                        style: TextStyle(
                            color: fieldDescr,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              left: 230.w,
              bottom: 167.5.h,
              child: Container(
                width: 106.w,
                height: 39.h,
                color: themeColor,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'LIKE',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 45.h,
              left: 15.w,
              child: Container(
                padding: EdgeInsets.only(top: 10.h, right: 40.w),
                width: 304.w,
                child: Text('Arenas Name is put in here (2 lanes possible)',
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            Positioned(
              right: 14.9.w,
              bottom: 16.5.h,
              child: Container(
                width: 90.7.w,
                height: 37.h,
                color: themeColor,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Free',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.cyan,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 17.w,
              top: 155.h,
              child: Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 8.w),
                        child: Image.asset(
                          'assets/images/PlayerIcon.png',
                          width: 10.w,
                          height: 11.h,
                        ),
                      ),
                      Text('80-100',
                          style: TextStyle(
                              color: fieldDescr,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 8.w),
                          child: Image.asset(
                            'assets/images/PlayerIcon.png',
                            width: 10.w,
                            height: 11.h,
                          ),
                        ),
                        Text('12 maps',
                            style: TextStyle(
                                color: fieldDescr,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 17.w,
              top: 175.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 8.w),
                    child: Image.asset(
                      'assets/images/PlayerIcon.png',
                      width: 10.w,
                      height: 11.h,
                    ),
                  ),
                  Text('Lviv, Kulparkivska 12... (1.5km)',
                      style: TextStyle(
                          color: fieldDescr,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
