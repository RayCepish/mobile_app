import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool _obscureText = true;
  bool _obscureText2 = true;
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
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(
            new FocusNode(),
          );
        },
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
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
                          height: 119.h,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 43.h,
                              width: 215.w,
                              child: Text(
                                "Registration",
                                style: TextStyle(
                                    fontSize: 36.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 46.h,
                        ),
                        Row(
                          children: [
                            Text(
                              "EMAIL",
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        _buildEmail(),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            Text(
                              "CREATE PASSWORD",
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        _buildPassword(),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            Text("REPEAD PASSWORD",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white.withOpacity(0.5),
                                )),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        _buildRepeatPassword(),
                        SizedBox(
                          height: 39.h,
                        ),
                        Container(
                          height: 54.h,
                          width: 335.w,
                          child: RaisedButton(
                            onPressed: () {
                              // if (_formkey.currentState!.validate()) {

                                // return Keys.navKey.currentState
                                //     .pushNamed("/sign_in");
                               Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginForm(),
                              ),
                            );
                            },
                            child: Text(
                              "CONFIRM",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 12.sp),
                            ),
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(58.r),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 36.h,
                        ),
                        _buildOr(),
                        SizedBox(
                          height: 30.h,
                        ),
                        _buildAnotherwaytoLoginContainers(),
                        SizedBox(
                          height: 40.h,
                        ),
                        _buildIfYouHaveAnAccount(),
                        // SizedBox(
                        //   height: 39.h,
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      backgroundColor: Color(0xFF1D1E21),
    );
  }

  Widget _buildEmail() {
    return Container(
      height: 40.h,
      width: 335.w,
      child: TextFormField(
        style: TextStyle(fontSize: 14.sp, color: Colors.white),
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        focusNode: _emailFocus,
        onFieldSubmitted: (term) {
          _fieldFocusChange(context, _emailFocus, _passwordFocus);
        },
        decoration: InputDecoration(
          // isDense: true,
          // helperText: ' ',
          // counterText: ' ',
          filled: true,
          fillColor: Colors.white.withOpacity(0.2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4.0.r),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPassword() {
    return Container(
      height: 40.h,
      width: 335.w,
      child: TextFormField(
        style: TextStyle(fontSize: 14.sp, color: Colors.white),
        obscureText: _obscureText,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        focusNode: _passwordFocus,
        onFieldSubmitted: (term) {
          _fieldFocusChange(context, _passwordFocus, _confirmpasswordFocus);
        },
        decoration: InputDecoration(
          //isDense: true,
          // helperText: ' ',
          // counterText: ' ',
          filled: true,
          fillColor: Colors.white.withOpacity(0.2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4.0.r),
            ),
          ),
        ),
        controller: _pass,
        // validator: (value) {
        //   if (value!.isEmpty) {
        //     return "Requiered";
        //   } else if (value.length < 6) {
        //     return "Should Be At Least 6 characters";
        //   } else if (value.length > 15) {
        //     return "Should Not Be More Than 15 Characters";
        //   } else {
        //     return null;
        //   }
        // },
      ),
    );
  }

  Widget _buildRepeatPassword() {
    return Container(
      height: 40.h,
      width: 335.w,
      child: TextFormField(
        style: TextStyle(fontSize: 14.sp, color: Colors.white),
        obscureText: _obscureText2,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        focusNode: _confirmpasswordFocus,
        onFieldSubmitted: (value) {
          _confirmpasswordFocus.unfocus();
        },
        decoration: InputDecoration(
          isDense: true,
          // helperText: ' ',
          // counterText: ' ',
          filled: true,
          fillColor: Colors.white.withOpacity(0.2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4.0.r),
            ),
          ),
        ),
        controller: _confirmPass,
        // validator: (val) {
        //   if (val!.isEmpty) return 'Empty';
        //   if (val != _pass.text) return 'Not Match';
        //   return null;
        // },
      ),
    );
  }

  Widget _buildOr() {
    return Container(
      height: 18.h,
      width: 335.w,
      child: Row(
        children: [
          Container(
              height: 0.h, width: 126.w, child: Divider(color: Colors.white)),
          SizedBox(width: 34.w),
          Container(
              height: 18.h,
              width: 15.w,
              child: Text(
                "or",
                style: TextStyle(fontSize: 18.sp, color: Colors.white),
              )),
          SizedBox(width: 31.w),
          Container(
              height: 0.h, width: 126.w, child: Divider(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildAnotherwaytoLoginContainers() {
    return Container(
      height: 60.h,
      width: 335.w,
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: Colors.white.withOpacity(0.2),
                ),
                height: 60.h,
                width: 105.w,
                child: Image.asset("assets/images/reg_part/google.png")),
          ),
          SizedBox(width: 10.w),
          InkWell(
            onTap: () {},
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: Colors.white.withOpacity(0.2),
                ),
                height: 60.h,
                width: 105.w,
                child: Image.asset("assets/images/reg_part/apple.png")),
          ),
          SizedBox(width: 10.w),
          InkWell(
            onTap: () {},
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: Colors.white.withOpacity(0.2),
                ),
                height: 60.h,
                width: 105.w,
                child: Image.asset("assets/images/reg_part/facebook.png")),
          ),
        ],
      ),
    );
  }

  Widget _buildIfYouHaveAnAccount() {
    return Container(
        // height: 56.h,
        width: 156.w,
        color: Colors.transparent,
        child: Column(
          children: [
            Text(
              "You have an account,",
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
            FlatButton(
                onPressed: () {
                   Navigator.of(context).pushNamed("/login");
                },
                child: Text(
                  "LOG IN",
                  style: TextStyle(fontSize: 14.sp, color: Colors.white),
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
