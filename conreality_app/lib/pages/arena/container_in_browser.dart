import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ContainersInArenaBrowser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black),
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 20.w, right: 20.w, top: 4.h),
            child: Container(
              height: 198.h,
              width: 334.w,
              decoration: BoxDecoration(color: Colors.grey[800]),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(top: 15.h , left: 15.w),
                        child: Row(
                          children: [
                            Container(
                              height: 24.h,
                              width: 69.w,
                              decoration: BoxDecoration(color: Colors.black),
                              child: Padding(
                                padding:  EdgeInsets.all(6.0.w,),
                                child: Text(
                                  "Game Tech",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 11.sp
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            Container(
                              height: 24.h,
                              width: 69.w,
                              decoration: BoxDecoration(color: Colors.black),
                              child: Padding(
                                padding: EdgeInsets.all(6.0.w),
                                child: Text(
                                  "Game Tech",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 11.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 50.w,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 39.h,
                          width: 106.w,
                          child: RaisedButton(
                            onPressed: () {},
                            child: Text('LIKED',
                                style: TextStyle(fontSize: 20.sp)),
                            color: Colors.red[700],
                            textColor: Colors.white,
                            elevation: 5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.h
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 15.w),
                    child: Container(
                      child: Text(
                        "Fav Arenas Name is put in here (2 lanes possible)",
                        style: TextStyle(
                            fontFamily: "TTSquares-Italic",
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 15.w,),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.emoji_emotions,
                                      ),
                                      Text(
                                        "10-100",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: "TTSquares-Italic",
                                            fontSize: 12.sp),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.line_style,
                                      ),
                                      Text(
                                        "12 Maps",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: "TTSquares-Italic",
                                            fontSize: 12.sp),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.circle_rounded,
                                  ),
                                  Text(
                                    "Lviv, Kulparkivska 12... (1.5km)",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: "TTSquares-Italic",
                                        fontSize: 12.sp),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Container(
                            height: 37.h,
                            width: 76.w,
                            child: RaisedButton(
                              color: Colors.black,
                              onPressed: () {},
                              child: Text(
                                "Free",
                                style: TextStyle(
                                  color: Colors.blue[200],
                                  fontFamily: "TTSquares-Italic",
                                ),
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
