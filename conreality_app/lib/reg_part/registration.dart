import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reg_log_pages/home_screen.dart';
import 'package:reg_log_pages/onb/onb.dart';

import 'signIn.dart';

const themeColor = Color(0xFF1D1E21);
const fieldDescr = Color(0xFF78797A);
const darkGrey = Color(0xFF424242);

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool _checkboxValue = false;
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmpasswordFocus = FocusNode();

  void validate() {
    if (_formkey.currentState!.validate()) {
      print("Validated");
    } else {
      print("Not validated");
    }
  }

  TextEditingController _confirmPass = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _emailController = TextEditingController();

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
            'Registration',
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
          child: LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return Container(
                padding: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                ),
                child: Form(
                  key: _formkey,
                  autovalidateMode: AutovalidateMode.always,
                  child: SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: viewportConstraints.maxHeight,
                      ),
                      child: Column(
                        children: [
                          //  _buildUnion(),
                          SizedBox(
                            height: 40.h,
                          ),
                          _descriptionField('EMAIL'),
                          Padding(
                            padding: EdgeInsets.only(top: 15.h, bottom: 25.h),
                            child:
                                _buildLongField(_emailController, _emailFocus),
                          ),
                          _descriptionField("PASSWORD"),
                          Padding(
                              padding: EdgeInsets.only(top: 15.h, bottom: 25.h),
                              child: Row(
                                children: [
                                  _buildShortField(),
                                  SizedBox(width: 15.w),
                                  Container(
                                    color: darkGrey,
                                    height: 48.h,
                                    width: 48.w,
                                    child: TextButton(
                                      child: Text(
                                        'show',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              )),
                          _descriptionField("REPEAT PASSWORD"),
                          Padding(
                            padding: EdgeInsets.only(top: 15.h, bottom: 25.h),
                            child: _buildLongField(
                                _confirmPass, _confirmpasswordFocus),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                            child: _confirmTermsAnConditions(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 25.h),
                            child: Container(
                              height: 50.h,
                              width: 335.w,
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          OnBoardingPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "CONFIRM",
                                  style: TextStyle(
                                      color: getTextButtonColor(),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                                color: getButtonColor(),
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(top: 35.h, bottom: 25.h),
                            child: _buildAnotherwaytoLoginContainers(),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          _buildIfYouHaveAnAccount(),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLongField(curentController, focus) {
    // to email
    return Container(
      height: 50.h,
      width: 335.w,
      child: TextFormField(
        style: TextStyle(fontSize: 16.sp, color: Colors.white),
        controller: curentController,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        focusNode: focus,
        onFieldSubmitted: (term) {
          _fieldFocusChange(context, _emailFocus, _passwordFocus);
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

  Widget _buildShortField() {
    return Container(
      height: 50.h,
      width: 270.w,
      child: TextFormField(
        style: TextStyle(fontSize: 16.sp, color: Colors.white),
        obscureText: true,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        focusNode: _passwordFocus,
        onFieldSubmitted: (value) {
          _passwordFocus.unfocus();
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
        controller: _pass,
      ),
    );
  }

  Color getTextButtonColor() {
    if (_checkboxValue == false) {
      return Colors.white.withOpacity(0.2);
    } else {
      return Colors.white;
    }
  }

  Color getButtonColor() {
    if (_checkboxValue == false) {
      return darkGrey;
    } else {
      return Colors.red;
    }
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.red;
    }
    return Colors.red;
  }

  Widget _confirmTermsAnConditions() {
    return Container(
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              color: darkGrey,
            ),
            width: 20.w,
            height: 20.h,
            child: Checkbox(
                side: BorderSide(color: Colors.grey, width: 0.5.w),
                checkColor: Colors.red,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: _checkboxValue,
                onChanged: (value) {
                  setState(() {
                    _checkboxValue = value!;
                  });
                }),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'I confirm that I’ve read and agree to',
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "Terms and Conditions",
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.red,
                      decoration: TextDecoration.underline),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAnotherwaytoLoginContainers() {
    return Container(
      height: 60.h,
      width: 335.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _variantToLogin("FACEBOOK"),
          _variantToLogin("GOOGLE"),
          _variantToLogin("APPLE")
        ],
      ),
    );
  }

  InkWell _variantToLogin(String variant) {
    return InkWell(
      onTap: () {
        print("object");
      },
      child: Container(
        height: 50.h,
        width: 110.w,
        color: darkGrey,
        child: Center(
            child: Text(
          variant,
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),
        )),
      ),
    );
  }

  Widget _buildIfYouHaveAnAccount() {
    return Container(
        width: 200.w,
        child: Column(
          children: [
            Text(
              "I already have an account",
              style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
            FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginForm(),
                    ),
                  );
                },
                child: Text(
                  "SIGN IN",
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.red,
                      decoration: TextDecoration.underline),
                ))
          ],
        ));
  }
}

_fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
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
