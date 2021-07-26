import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const themeColor = Color(0xFF1D1E21);
const fieldDescr = Color(0xFF78797A);
const darkGrey = Color(0xFF424242);
const veryDarkGrey = Color(0xFF303030);
const darkRed = Color(0xFFB71C1C);

class MyMaps extends StatefulWidget {
  MyMaps({Key? key}) : super(key: key);

  @override
  _MyMapsState createState() => _MyMapsState();
}

class _MyMapsState extends State<MyMaps> {
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
                  'My Maps',
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
                        child: Column(children: [
                          _createNewMap(),
                          _mapInfo(),
                          _mapInfo()
                        ]),
                      )));
            })));
  }

  Widget _createNewMap() {
    return Container(
      margin: EdgeInsets.only(top: 12.h, bottom: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: 268.w,
              height: 50.h,
              color: darkRed,
              child: TextButton(
                  onPressed: () {},
                  child: Text('CREATE NEW MAP',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp)))),
          Container(
              width: 50.w,
              height: 50.h,
              color: darkGrey,
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'info',
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  )))
        ],
      ),
    );
  }

  Widget _mapInfo() {
    return Container(
      margin: EdgeInsets.only(top: 12.h),
      width: 334.w,
      height: 200.h,
      color: darkGrey,
      child: Column(
        children: [
          Container(
            width: 334.w,
            child: Image.asset('assets/images/MapPreview.png'),
          ),
          Container(
            margin: EdgeInsets.only(top: 12.h, left: 12.w, right: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Map Name here',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400),
                ),
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
