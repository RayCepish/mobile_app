import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reg_log_pages/pages/onb/onb.dart';
import 'package:reg_log_pages/pages/reg_part/reg/sign_up/registration.dart';


const themeColor = Color(0xFF1D1E21);
const fieldDescr = Color(0xFF78797A);
const darkGrey = Color(0xFF424242);

class RegistrationProfileInfo extends StatefulWidget {
  RegistrationProfileInfo({Key? key}) : super(key: key);

  @override
  _RegistrationProfileInfoState createState() =>
      _RegistrationProfileInfoState();
}

class _RegistrationProfileInfoState extends State<RegistrationProfileInfo> {
  FocusNode _nicknameFocus = FocusNode();
  TextEditingController _nicknameController = TextEditingController();
  int pageIndex = 0;

  List imgList = [
    'assets/images/Portrait.png',
    'assets/images/Portrait.png',
    'assets/images/Portrait.png'
  ];
  List descriptionList = [
    'First Portrait name',
    'Second Portrait name',
    'Third  Portrait name'
  ];
  CarouselController _caruselController = CarouselController();

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
            'Profile Info',
            style: TextStyle(fontSize: 24.sp, color: Colors.white),
          )),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(
            new FocusNode(),
          );
        },
        child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return Container(
            child: SingleChildScrollView(
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
                          SizedBox(
                            height: 110.h,
                          ),
                          _descriptionField('NAME OR NICK NAME'),
                          Padding(
                            padding: EdgeInsets.only(top: 15.h),
                            child: _buildLongField(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 55.h, left: 100.w),
                            child: _descriptionField("CHOISE YOUR PORTRAIT"),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50.h, bottom: 17),
                      child: Container(
                        color: themeColor,
                        child: CarouselSlider(
                          carouselController: _caruselController,
                          options: CarouselOptions(
                              aspectRatio: 16 / 9,
                              pageSnapping: true,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false,
                              initialPage: 0,
                              viewportFraction: 0.6,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  pageIndex = index;
                                  print('$pageIndex');
                                });
                              }),
                          items: imgList.map((img) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                    width: MediaQuery.of(context).size.width.w,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 5.0.w),
                                    decoration:
                                        BoxDecoration(color: Colors.grey),
                                    child: Image.asset(
                                      img,
                                      fit: BoxFit.fill,
                                    ));
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            '${descriptionList[pageIndex]}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 80),
                      child: _backOrFinish(context),
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    ));
  }

  _fieldFocusChange(BuildContext context, FocusNode currentFocus) {
    currentFocus.unfocus();
  }

  Widget _buildLongField() {
    return Container(
      height: 50.h,
      width: 335.w,
      child: TextFormField(
        style: TextStyle(fontSize: 16.sp, color: Colors.white),
        controller: _nicknameController,
        textInputAction: TextInputAction.next,
        focusNode: _nicknameFocus,
        onFieldSubmitted: (term) {
          _fieldFocusChange(context, _nicknameFocus);
        },
        decoration: InputDecoration(
            filled: true,
            fillColor: darkGrey,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.red),
            )),
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
}

Row _backOrFinish(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Container(
          width: 145.w,
          height: 50.h,
          color: darkGrey,
          child: TextButton(
              onPressed: () {
                Navigator.pop(
                    context, MaterialPageRoute(builder: (c) => SignUpForm()));
              },
              child: Text(
                'BACK',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700),
              ))),
      Container(
        width: 145.w,
        height: 50.h,
        color: Colors.red[900],
        child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OnBoardingPage(),
                ),
              );
            },
            child: Text('FINISH',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700))),
      )
    ],
  );
}
