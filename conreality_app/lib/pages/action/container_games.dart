import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerInTheGamedTabOnAction extends StatelessWidget {
  final String invitedOrNot;
  const ContainerInTheGamedTabOnAction({
    required this.invitedOrNot,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 4.h),
              child: Container(
                decoration: BoxDecoration(color: Colors.grey[800]),
                height: 198.h,
                width: 334.w,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15.w),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Container(
                                  height: 24.h,
                                  width: 69.w,
                                  decoration:
                                      BoxDecoration(color: Colors.black),
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                      6.0.w,
                                    ),
                                    child: Text(
                                      "Game Tech",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 11.sp),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 130,
                              ),
                              Container(
                                height: 39.h,
                                width: 106.w,
                                child: Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        "April 25",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      child: Text(
                                        "14:30",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Padding(
                      padding: EdgeInsets.only(left: 15.w),
                      child: Container(
                        child: Text(
                          "Games Name is put in here (2 lanes possible)",
                          style: TextStyle(
                              fontFamily: "TTSquares-Italic",
                              color: Colors.white,
                              fontSize: 18.sp),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 15.w,
                        top: 16.h,
                      ),
                      child: Container(
                        child: Row(
                          children: [
                            Text(
                              "Team Deathmatch",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: "TTSquares-Italic",
                                  fontSize: 12.sp),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.w),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: _buildNumber(),
                          ),
                          SizedBox(
                            width: 144.w,
                          ),
                          _buildButtonFree()
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 11.03.h,
                    ),
                    Container(
                      decoration: BoxDecoration(color: Colors.black),
                      height: 24.h,
                      width: 334.w,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(invitedOrNot,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontFamily: "TTSquares-Italic",
                            )),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

Widget _buildNumber() {
  return Container(
    child: Row(
      children: [
        Icon(
          Icons.emoji_emotions,
          size: 15,
        ),
        SizedBox(
          width: 5.w,
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
  );
}

Widget _buildButtonFree() {
  return Container(
    height: 31.h,
    width: 90.w,
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
    ),
  );
}
