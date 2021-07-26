import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const themeColor = Color(0xFF1D1E21);
const fieldDescr = Color(0xFF78797A);
const darkGrey = Color(0xFF424242);
const darkRed = Color(0xFFB71C1C);

class ProfileSetting extends StatefulWidget {
  ProfileSetting({Key? key}) : super(key: key);

  @override
  _ProfileSettingState createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  FocusNode _changeClanNameFocus = FocusNode();
  TextEditingController _changeClanNameController = TextEditingController();
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
                      padding: EdgeInsets.only(top: 10.h),
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
                      padding: EdgeInsets.only(left: 10.w, top: 10.h),
                      child: Text(
                        'Profile Settings',
                        style: TextStyle(
                            fontSize: 24.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w, top: 10.h),
                      child: Container(
                        color: darkGrey,
                        height: 50.h,
                        width: 50.w,
                        child: TextButton(
                          child: Text(
                            'save',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                ),
              ),
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
                      padding: EdgeInsets.only(
                        left: 20.w,
                        right: 20.w,
                      ),
                      child: Form(
                          autovalidateMode: AutovalidateMode.always,
                          child: SingleChildScrollView(
                              child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minHeight: viewportConstraints.maxHeight,
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 10.w),
                                        child: Center(
                                          child: Stack(
                                            children: [
                                              Container(
                                                height: 120.h,
                                                width: 120.w,
                                                child: Image.asset(
                                                    'assets/images/UserPortrait.png'),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 75.w, top: 75.h),
                                                padding: EdgeInsets.only(),
                                                child: IconButton(
                                                    splashRadius: 1,
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.edit,
                                                      color: Colors.white,
                                                    )),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      _buildLongField('User Nickname'),
                                      _curentButtonContainer(
                                          'READ TERMS AND AGRREMENT',
                                          Colors.white,
                                          () {}),
                                      _curentButtonContainer(
                                          'DELETE PROFILE', darkRed, () {}),
                                      Container(
                                        margin: EdgeInsets.only(top: 280.h),
                                        child: _curentButtonContainer(
                                            'LOG OUT', Colors.white, () {}),
                                      )
                                    ],
                                  )))));
                }))));
  }

  _fieldFocusChange(
    BuildContext context,
    FocusNode currentFocus,
  ) {
    currentFocus.unfocus();
  }

  Widget _buildLongField(hint) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      height: 50.h,
      width: 335.w,
      child: TextFormField(
        style: TextStyle(fontSize: 16.sp, color: Colors.white),
        controller: _changeClanNameController,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        cursorColor: darkRed,
        focusNode: _changeClanNameFocus,
        onFieldSubmitted: (term) {
          _fieldFocusChange(context, _changeClanNameFocus);
        },
        decoration: InputDecoration(
            filled: true,
            contentPadding: EdgeInsets.all(10.w),
            labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400),
            hintText: hint,
            hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400),
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

  Container _curentButtonContainer(
      String curentButtonDescription, Color textColor, onPresed) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      height: 50.h,
      width: 335.w,
      child: RaisedButton(
          onPressed: onPresed,
          child: Text(
            curentButtonDescription,
            style: TextStyle(
                color: textColor, fontSize: 14.sp, fontWeight: FontWeight.w700),
          ),
          color: darkGrey),
    );
  }
}
