import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reg_log_pages/pages/action/introduce_part/allow_location.dart';
import '1.dart';
import '2.dart';
import '3.dart';
import '4.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

int currentIndex = 0;
PageController pageController = PageController(
  initialPage: 0,
);

Widget pageIndexIndicator(bool isCurrentPage) {
  return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.red : Colors.grey,
      )
      // borderRadius: BorderRadius.circular(100)),
      );
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(children: [
        Container(
          height: 590.h,
          width: 568.w,
          child: PageView(
            controller: pageController,
            onPageChanged: (val) {
              setState(
                () {
                  currentIndex = val;
                },
              );
            },
            children: [First(), Second(), Third(), Four()],
          ),
        ),
        Container(
          width: 82,
          height: 16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < 4; i++)
                currentIndex == i
                    ? pageIndexIndicator(true)
                    : pageIndexIndicator(false)
            ],
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        currentIndex != 4 - 1
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 20.w,
                      ),
                      Container(
                        // color: Colors.transparent,
                        width: 146,
                        height: 50,
                        child: RaisedButton(
                          color: Colors.grey[700],
                          shape: RoundedRectangleBorder(),
                          onPressed: () {
                            pageController.animateToPage(4 - 1,
                                duration: Duration(milliseconds: 400),
                                curve: Curves.bounceIn);
                          },
                          child: Text(
                            "SKIP",
                            style: TextStyle(
                                fontFamily: "TTSquares-Italic",
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp,
                                color: Colors.white,
                                height: 1.16.h),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 23.h,
                      ),
                      Container(
                        width: 146.w,
                        height: 50.h,
                        child: RaisedButton(
                          color: Colors.red[800],
                          shape: RoundedRectangleBorder(),
                          onPressed: () {
                            pageController.nextPage(
                                duration: Duration(milliseconds: 400),
                                curve: Curves.bounceIn);
                          },
                          child: Text(
                            "NEXT",
                            style: TextStyle(
                                fontFamily: "TTSquares-Italic",
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp,
                                color: Colors.white,
                                height: 1.16.h),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                    ],
                  ),
                ],
              )
            : Row(
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  Container(
                    width: 315.w,
                    height: 50.h,
                    child: RaisedButton(
                      color: Colors.red[800],
                      shape: RoundedRectangleBorder(),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AllowLocationPage()
                          ),
                        );
                      },
                      child: Text(
                        "ALLOW LOCATION",
                        style: TextStyle(
                            fontFamily: "TTSquares-Italic",
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: Colors.white,
                            height: 1.16.h),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
      ]),
    );
  }
}
