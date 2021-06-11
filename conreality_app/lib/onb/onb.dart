import 'package:conreality_app/introduce_part/allow_location.dart';
import 'package:conreality_app/onb/1.dart';
import 'package:conreality_app/onb/2.dart';
import 'package:conreality_app/onb/3.dart';
import 'package:flutter/material.dart';

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
    width: 5,
    height: 5,
    decoration: BoxDecoration(
        color: isCurrentPage ? Colors.white : Colors.grey[500],
        borderRadius: BorderRadius.circular(100)),
  );
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(children: [
          Container(
            height: 590,
            width: 568,
            child: PageView(
              controller: pageController,
              onPageChanged: (val) {
                setState(() {
                  currentIndex = val;
                });
              },
              children: [First(), Second(), Third()],
            ),
          ),
          Container(
            width: 40,
            height: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 0; i < 3; i++)
                  currentIndex == i
                      ? pageIndexIndicator(true)
                      : pageIndexIndicator(false)
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          currentIndex != 3 - 1
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 66,
                        ),
                        Container(
                          color: Colors.transparent,
                          width: 24,
                          height: 14,
                          child: InkWell(
                            onTap: () {
                              pageController.animateToPage(3 - 1,
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.bounceIn);
                            },
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Color(0xFFFFFFFF),
                                  height: 1.16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 66,
                        ),
                        Container(
                          width: 150,
                          height: 54,
                          child: RaisedButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(59)),
                            onPressed: () {
                              pageController.nextPage(
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.bounceIn);
                            },
                            child: Text(
                              "NEXT",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Color(0xFF000000),
                                  height: 1.16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ],
                )
              : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 66,
                      ),
                      Container(
                        color: Colors.transparent,
                        width: 24,
                        height: 14,
                        child: InkWell(
                          onTap: () {
                            pageController.jumpToPage(
                              3 - 1,
                            );
                          },
                          child: Text(
                            "Skip",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color(0xFFFFFFFF),
                                height: 1.16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 66,
                      ),
                      Container(
                        width: 150,
                        height: 54,
                        child: RaisedButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(59)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AllowLocationPage(),
                              ),
                            );

                            // nextPage(
                            //     duration: Duration(milliseconds: 15),
                            //     curve: Curves.bounceIn);
                          },
                          child: Text(
                            "Finish",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color(0xFF000000),
                                height: 1.16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ]),
        ]));
  }
}
