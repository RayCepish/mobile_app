import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'createNewArenaThirdScreen.dart';

const themeColor = Color(0xFF1D1E21);
const fieldDescr = Color(0xFF78797A);
const darkGrey = Color(0xFF424242);
const veryDarkGrey = Color(0xFF303030);
const darkRed = Color(0xFFB71C1C);

class CreateNewArenaSecondScreen extends StatefulWidget {
  CreateNewArenaSecondScreen({Key? key}) : super(key: key);

  @override
  _CreateNewArenaSecondScreenState createState() =>
      _CreateNewArenaSecondScreenState();
}

class _CreateNewArenaSecondScreenState
    extends State<CreateNewArenaSecondScreen> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  FocusNode _phoneNumberFocus = FocusNode();
  FocusNode _websiteFocus = FocusNode();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _websiteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: themeColor,
            appBar: AppBar(
              leading: Container(),
              backgroundColor: themeColor,
              centerTitle: true,
              title: Text(
                'Create Arena',
                style: TextStyle(fontSize: 24.sp, color: Colors.white),
              ),
              elevation: 0,
              toolbarHeight: 70, // Set this height
            ),
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
                      //tut tipa padingu
                      child: Form(
                          key: _formkey,
                          autovalidateMode: AutovalidateMode.always,
                          child: SingleChildScrollView(
                              child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minHeight: viewportConstraints.maxHeight,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      left: 20.w,
                                      right: 20.w,
                                    ),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/images/ArenaLocationPreview.png',
                                        ),
                                        Container(
                                          width: 333.5.w,
                                          height: 32.h,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 0.5.w,
                                                  color: Colors.grey)),
                                          child: Center(
                                              child: Text(
                                            'Arenas Adress',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400),
                                          )),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 24.h),
                                          child: _descriptionField(
                                              'GAMES TECHNOLOGY'),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 12.h),
                                          child: _gameTechnology(),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 12.h),
                                          child: _descriptionField(
                                              'PHONE NUMBER (OPTIONAL)'),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 12.h),
                                          child: _buildLongField(
                                              _phoneNumberController,
                                              TextInputType.number,
                                              _phoneNumberFocus,
                                              '+380 66 000 0000'),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 12.h),
                                          child: _descriptionField(
                                              'WEBSITE(OPTIONAL)'),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 12.h),
                                          child: _buildLongField(
                                              _websiteController,
                                              TextInputType.emailAddress,
                                              _websiteFocus,
                                              'example.com'),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 12.h),
                                          child: _descriptionField(
                                              'INFRASTRUCTURE'),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 12.h),
                                          child: _infrastructureInfo(),
                                        ),
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
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        'BACK',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ))),
                                              Container(
                                                width: 145.w,
                                                height: 50.h,
                                                color: darkRed,
                                                child: TextButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (c) =>
                                                                  CreateNewArenaThirdScreen()));
                                                    },
                                                    child: Text('NEXT',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700))),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )))));
                }))));
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

  Widget _gameTechnology() {
    return Container(
      height: 60.h,
      width: 335.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _variantTechnology("PAINTBALL"),
          _variantTechnology("AIRSOFT"),
          _variantTechnology("LASERTAG")
        ],
      ),
    );
  }

  InkWell _variantTechnology(String variant) {
    return InkWell(
      onTap: () {
        print("object");
      },
      child: Container(
        height: 50.h,
        width: 106.w,
        color: darkGrey,
        child: Center(
            child: Text(
          variant,
          style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w700),
        )),
      ),
    );
  }

  _fieldFocusChange(BuildContext context, FocusNode currentFocus) {
    currentFocus.unfocus();
  }

  Widget _buildLongField(TextEditingController curController,
      TextInputType type, FocusNode curFocus, String hint) {
    // to email
    return Container(
      height: 50.h,
      width: 335.w,
      child: TextFormField(
        style: TextStyle(fontSize: 16.sp, color: Colors.white),
        controller: curController,
        keyboardType: type,
        cursorColor: darkRed,
        textInputAction: TextInputAction.next,
        focusNode: curFocus,
        onFieldSubmitted: (term) {
          _fieldFocusChange(context, curFocus);
        },
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400),
            contentPadding: EdgeInsets.all(10.w),
            filled: true,
            fillColor: darkGrey,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: darkRed),
            )),
      ),
    );
  }

  Widget _infrastructureInfo() {
    return Stack(
      children: [
        Container(
          height: 147.h,
          width: 333.5,
          decoration: BoxDecoration(
              color: darkGrey,
              border: Border.all(width: 0.5.w, color: Colors.grey)),
        ),
        Container(
          margin: EdgeInsets.only(top: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [_infrastructure(), _infrastructure(), _infrastructure()],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 95.h, left: 8.w),
          child: _descriptionField('SUGGESTIONS:'),
        ),
        Container(
          margin: EdgeInsets.only(top: 114.h),
          child: Row(
            children: [
              _suggestions('Toilets'),
              _suggestions('Restaurant'),
              _suggestions('Bar')
            ],
          ),
        )
      ],
    );
  }

  Container _infrastructure() {
    return Container(
        width: 102.w,
        height: 24.h,
        color: themeColor,
        child: Center(
          child: RichText(
              text: TextSpan(
                  style:
                      TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w700),
                  children: <TextSpan>[
                TextSpan(
                    text: 'Infrastructure ',
                    style: TextStyle(color: Colors.white)),
                TextSpan(text: ' X', style: TextStyle(color: darkRed))
              ])),
        ));
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
