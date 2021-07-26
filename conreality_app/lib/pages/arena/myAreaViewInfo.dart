import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const themeColor = Color(0xFF1D1E21);
const fieldDescr = Color(0xFF78797A);
const darkGrey = Color(0xFF424242);
const darkRed = Color(0xFFB71C1C);

class MyArenaViewInfo extends StatefulWidget {
  MyArenaViewInfo({Key? key}) : super(key: key);

  @override
  _MyArenaViewInfoState createState() => _MyArenaViewInfoState();
}

class _MyArenaViewInfoState extends State<MyArenaViewInfo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: themeColor,
            appBar: AppBar(
              leading: Container(),

              backgroundColor: themeColor,
              elevation: 0,
              toolbarHeight: 70, // Set this height
              flexibleSpace: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10.h,
                      ),
                      child: Container(
                        color: darkGrey,
                        height: 50.h,
                        width: 50.w,
                        child: TextButton(
                          child: Text(
                            'X',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 6.w, top: 10.h, right: 80.w),
                      child: Text(
                        'Viewing Arena',
                        style: TextStyle(
                            fontSize: 24.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: LayoutBuilder(builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return Container(
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                  ),
                  child: SingleChildScrollView(
                      child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: viewportConstraints.maxHeight,
                          ),
                          child: Column(
                            children: [
                              _buildAreanaVievInformaion(),
                              Container(
                                margin: EdgeInsets.only(top: 23.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        width: 145.w,
                                        height: 50.h,
                                        color: darkGrey,
                                        child: TextButton(
                                            onPressed: () {
                                              // перекидуватиме на сторінки аналогічні створенню карти тільки вже з даними з поточної і з можливістю зміни їх
                                            },
                                            child: Text(
                                              'EDIT',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w700),
                                            ))),
                                    Container(
                                      width: 145.w,
                                      height: 50.h,
                                      color: darkRed,
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('GO BACK',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14.sp,
                                                  fontWeight:
                                                      FontWeight.w700))),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ))));
            })));
  }

  Widget _buildAreanaVievInformaion() {
    return Container(
      height: 601.h,
      margin: EdgeInsets.only(top: 12.h),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 2.h),
            width: 334.w,
            height: 581.h,
            color: darkGrey,
          ),
          Container(
            margin: EdgeInsets.only(top: 15.h, left: 15.w),
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
            right: 15.w,
            top: 15.h,
            child: Container(
              width: 90.7.w,
              height: 24.h,
              color: themeColor,
              child: FlatButton(
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
            top: 113.h,
            left: 15.w,
            child: Container(
              width: 304.w,
              height: 216.h,
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Etiam dignissim diam quis enim lobortis. Leo vel orci porta non pulvinar. Auctor urna nunc id cursus metus aliquam eleifend mi.',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Positioned(
              top: 275.h,
              left: 15.w,
              child: _descriptionField('INFRASTRUSTURE')),
          Positioned(
              top: 291.h,
              left: 5.w,
              child: Container(
                margin: EdgeInsets.only(top: 16.h),
                child: Row(
                  children: [
                    //треба зробити в врап бо так шляпа
                    _suggestions('Rastaurant'),
                    _suggestions('Kids playground'),
                    _suggestions('Infrastrusture')
                  ],
                ),
              )),
          Positioned(
              top: 321.h,
              left: 5.w,
              child: Container(
                margin: EdgeInsets.only(top: 16.h),
                child: Row(
                  children: [
                    //треба зробити в врап бо так шляпа
                    _suggestions('Infrastrusture'),
                    _suggestions('Infrastrusture'),
                    _suggestions('Infrastrusture')
                  ],
                ),
              )),
          Positioned(
              top: 384.h, left: 15.w, child: _descriptionField('PHONE NUMBER')),
          Positioned(
              top: 414.h, left: 15.w, child: _redInfo('+380 66 000 0000')),
          Positioned(
              top: 444.h, left: 15.w, child: _descriptionField('WEBSITE')),
          Positioned(top: 474.h, left: 15.w, child: _redInfo('EXAMPLE.COM')),
          Positioned(
            left: 17.w,
            bottom: 51.h,
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
              ],
            ),
          ),
          Positioned(
            left: 17.w,
            bottom: 34.h,
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
          ),
          Positioned(
            right: 14.9.w,
            bottom: 33.h,
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
        ],
      ),
    );
  }

  Row _descriptionField(desc) {
    return Row(children: [
      Text(
        desc,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w700,
          color: fieldDescr,
        ),
      )
    ]);
  }

  Row _redInfo(desc) {
    return Row(children: [
      Text(
        desc,
        style: TextStyle(
          decoration: TextDecoration.underline,
          fontSize: 14.sp,
          fontWeight: FontWeight.w700,
          color: darkRed,
        ),
      )
    ]);
  }

  Container _suggestions(String sugDesc) {
    return Container(
        padding: EdgeInsets.only(left: 8.w, right: 8.w),
        margin: EdgeInsets.only(left: 8.w),
        height: 24.h,
        color: themeColor,
        child: Center(
          child: Text(sugDesc,
              style: TextStyle(
                  color: fieldDescr,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700)),
        ));
  }
}
