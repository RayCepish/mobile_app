import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reg_log_pages/bottom_tabBar.dart';
import 'package:reg_log_pages/pages/qr/qr_from_signup.dart';
import 'package:reg_log_pages/pages/reg_part/reg/sign_up/registration.dart';


const themeColor = Color(0xFF1D1E21);
const fieldDescr = Color(0xFF78797A);
const darkGrey = Color(0xFF424242);

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool _obscureText = true;
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  void validate() {
    if (_formkey.currentState!.validate()) {
      print("Validated");
    } else {
      print("Not validated");
    }
  }

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
          elevation: 0,
          toolbarHeight: 70, // Set this height
          flexibleSpace: Container(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 155.w, top: 5.h),
                  child: Text(
                    'Sign In',
                    style: TextStyle(fontSize: 24.sp, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 80.w, top: 25.h),
                  child: Container(
                    color: darkGrey,
                    height: 48.h,
                    width: 48.w,
                    child: TextButton(
                      child: Text(
                        'QR',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScannerQRFromSignIn()),
                        );
                      },
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
                          SizedBox(
                            height: 120.h,
                          ),
                          _descriptionField('EMAIL'),
                          Padding(
                            padding: EdgeInsets.only(top: 15.h, bottom: 25.h),
                            child: _buildLongField(),
                          ),
                          _descriptionField("PASSWORD"),
                          Padding(
                              padding: EdgeInsets.only(top: 15.h),
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
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 27.h,
                          ),
                          _buildForgot(),
                          Padding(
                            padding: EdgeInsets.only(top: 70.h),
                            child: Container(
                              height: 50.h,
                              width: 335.w,
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BottomTabBar(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "CONFIRM",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                                color: Colors.red,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 40.h),
                            child: _buildAnotherwaytoLoginContainers(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 70.h),
                            child: _buildIfYouDontHaveAnAccount(),
                          ),
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

  Widget _buildLongField() {
    // to email
    return Container(
      height: 50.h,
      width: 335.w,
      child: TextFormField(
        style: TextStyle(fontSize: 16.sp, color: Colors.white),
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        focusNode: _emailFocus,
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
        obscureText: _obscureText,
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

  Widget _buildIfYouDontHaveAnAccount() {
    return Container(
      width: 200.w,
      child: Column(
        children: [
          Text(
            "I don’t have an account",
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
                  builder: (context) => SignUpForm(),
                ),
              );
            },
            child: Text(
              "REGISTRATION",
              style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.red,
                  decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildForgot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
            onTap: () {},
            child: Text("FORGOT PASS",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.red,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                )))
      ],
    );
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
