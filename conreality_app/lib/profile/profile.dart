import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bottom_tabBar.dart';
import '../constans.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //  int selectedIndex = 0;
  // void updateTabSelection(int index) {
  //   setState(() {
  //     selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D1E21),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Row(
                  children: [
                    SizedBox(width: 20.w),
                    Container(
                      width: 292.w,
                      height: 130.h,
                      child: Row(
                        children: [
                          Container(
                              width: 130.w,
                              height: 130.h,
                              decoration: BoxDecoration(
                                color: Color(0xFF2A2B30),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.r),
                                ),
                              ),
                              child:
                                  Image.asset("assets/images/Mask_group.png")),
                          SizedBox(
                            width: 33.w,
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                ),
                                child: Container(
                                  width: 129.w,
                                  height: 84.h,
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Text(
                                          "Piter  Parker",
                                          style: TextStyle(
                                              fontSize: 30.sp,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Text(
                                      "SNIREP",
                                      style: TextStyle(
                                          fontSize: 14.sp, color: Colors.grey),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 80.w,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 25,
                    right: 20,
                  ),
                  child: Container(
                    width: 335.w,
                    height: 102.h,
                    decoration: BoxDecoration(
                      color: Color(0xFF2A2B30),
                      borderRadius: BorderRadius.all(
                        Radius.circular(7),
                      ),
                    ),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20, left: 20),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 14.h,
                                      child: Text(
                                        "My Team",
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Container(
                                      height: 28.h,
                                      child: Text(
                                        "Area 51",
                                        style: TextStyle(
                                            fontSize: 24.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7.h,
                                    ),
                                    Container(
                                      width: 205.w,
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Text(
                                              "309 items",
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colors.grey[700],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 30.w,
                                          ),
                                          Container(
                                            child: Text(
                                              "24 players",
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colors.grey[700],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 17.w,
                        ),
                        Container(
                          width: 90.w,
                          height: 90.h,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.6),
                            image: DecorationImage(
                              image: AssetImage("assets/images/area51.png"),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(4.r),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    SizedBox(width: 20.w),
                    Text(
                      "Statistics",
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white.withOpacity(0.54)),
                    ),
                  ],
                ),
                Container(
                  height: 202.h,
                  width: 202.w,
                  child: SfRadialGauge(
                    axes: <RadialAxis>[
                      RadialAxis(
                        showLabels: false,
                        showTicks: false,
                        startAngle: 180,
                        endAngle: 0,
                        radiusFactor: 1,
                        canScaleToFit: true,
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                              widget: Container(
                                  child: Text(' 65 % \n wins',
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w200,
                                          color: Colors.white))),
                              angle: 90,
                              positionFactor: 0)
                        ],
                        axisLineStyle: AxisLineStyle(
                          thickness: 0.1,
                          color: Color(0xFF83858B).withOpacity(0.2),
                          thicknessUnit: GaugeSizeUnit.factor,
                          cornerStyle: CornerStyle.startCurve,
                        ),
                        pointers: <GaugePointer>[
                          RangePointer(
                              color: Color(0xFF83858B),
                              value: 65,
                              width: 0.1,
                              sizeUnit: GaugeSizeUnit.factor,
                              cornerStyle: CornerStyle.bothCurve)
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 27.h),
                Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      "Last game",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      width: 203.w,
                    ),
                    Text(
                      "April 25, 14:30",
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF83858B)),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 0.h,
                  width: 335.w,
                  child: Divider(
                    color: Colors.white.withOpacity(0.1),
                    thickness: 2,
                  ),
                ),
                SizedBox(height: 17.h),
                Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Container(
                      height: 17.h,
                      width: 58.w,
                      child: Text(
                        "Victories",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    SizedBox(
                      width: 261.w,
                    ),
                    Container(
                      height: 12.h,
                      width: 17.w,
                      child: Text(
                        "100",
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF83858B)),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15.h),
                Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Container(
                      height: 17.h,
                      width: 86.w,
                      child: Text(
                        "Defeats",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    SizedBox(
                      width: 238.w,
                    ),
                    Text(
                      "27",
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF83858B)),
                    )
                  ],
                ),
                SizedBox(height: 15.h),
                Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Container(
                      height: 17.h,
                      width: 86.w,
                      child: Text(
                        "Draws",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    SizedBox(
                      width: 238.w,
                    ),
                    Text(
                      "20",
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF83858B)),
                    )
                  ],
                ),
                SizedBox(height: 33.h),
                Container(
                  height: 63.h,
                  width: 334.w,
                  color: Color(0xFF83858B).withOpacity(0.15),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 83.w),
                      Container(
                        height: 29.h,
                        width: 29.w,
                        child: Image.asset('assets/images/icon_profile.png'),
                      ),
                      SizedBox(width: 22.w),
                      Container(
                        height: 28.h,
                        width: 156.w,
                        child: Row(
                          children: [
                            Text(
                              "12",
                              style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "My Maps",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.sp),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomTabBar(),
    );
//   }
//    Widget _buildBottomNavBar() {
//     return Container(
//       width: ScreenUtil().setWidth(374.74),
//       height: ScreenUtil().setHeight(73.6),
//       child: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: backgroundArenaBrowserPageBottomAppBar,
//         currentIndex: selectedIndex,
//         items: [
//           BottomNavigationBarItem(
//               icon: Container(
//                   width: ScreenUtil().setWidth(37),
//                   height: ScreenUtil().setHeight(40),
//                   child: IconButton(
//                       onPressed: () {
//                         updateTabSelection(0);
//                       },
//                       icon: Icon(Icons.panorama_fish_eye,
//                           color: colorForBottomIcons))),
//               title: bottomAppBarTextForProfileButton),
//           BottomNavigationBarItem(
//               icon: Container(
//                   width: ScreenUtil().setWidth(37),
//                   height: ScreenUtil().setHeight(40),
//                   child: IconButton(
//                       onPressed: () {
//                         updateTabSelection(1);

//                       },
//                       icon: Icon(Icons.panorama_fish_eye,
//                           color: colorForBottomIcons))),
//               title: bottomAppBarTextForArenaButton),
//           BottomNavigationBarItem(
//               icon: Container(
//                   width: ScreenUtil().setWidth(37),
//                   height: ScreenUtil().setHeight(40),
//                   child: IconButton(
//                       onPressed: () {
//                         updateTabSelection(2);
//                       },
//                       icon: Icon(Icons.panorama_fish_eye,
//                           color: colorForBottomIcons))),
//               title: bottomAppBarTextForTeamsButton),
//           BottomNavigationBarItem(
//               icon: Container(
//                   width: ScreenUtil().setWidth(37),
//                   height: ScreenUtil().setHeight(40),
//                   child: IconButton(
//                       onPressed: () {
//                         updateTabSelection(3);
//                       },
//                       icon: Icon(Icons.panorama_fish_eye,
//                           color: colorForBottomIcons))),
//               title: bottomAppBarTextForChatsButton),
//         ],
//         onTap: (index) {
//           // print("1");
//           setState(() {
//             selectedIndex = index;
//           });
//         },
//       ),
//     );
//   }
// }
  }
}
