import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reg_log_pages/leagues/arenas_teams/arenas_teams.dart';
import 'package:reg_log_pages/leagues/main_page.dart';

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
                        SizedBox(
                          height: 189.h,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 43.h,
                              width: 215.w,
                              child: Text(
                                "Sign in ",
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
                              "PASSWORD",
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white.withOpacity(0.5)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        _buildPassword(),
                        SizedBox(
                          height: 27.h,
                        ),
                        _buildForgot(),

                        SizedBox(
                          height: 25.h,
                        ),
                        Container(
                          height: 54.h,
                          width: 335.w,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainLeaguesPage(),
                                ),
                              );
                            },
                            child: Text(
                              "CONFIRM",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(59.r),
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
      child: Row(
        children: [
          Container(
            height: 100.h,
            width: 285.w,
            child: TextFormField(
              style: TextStyle(fontSize: 14.sp, color: Colors.white),
              obscureText: _obscureText,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              focusNode: _passwordFocus,
              onFieldSubmitted: (value) {
                _passwordFocus.unfocus();
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
          ),
          SizedBox(width: 10.w),
          InkWell(
            onTap: () {},
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: Colors.white.withOpacity(0.2),
                ),
                width: 40.w,
                height: 40.h,
                child: Image.asset("assets/images/fingerprint1.png")),
          )
        ],
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
              "You do not have an account,",
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
            FlatButton(
                onPressed: () {
                  return Navigator.pop(context);
                },
                child: Text(
                  "PLEASE REGISTER",
                  style: TextStyle(fontSize: 14.sp, color: Colors.white),
                ))
          ],
        ));
  }

  Widget _buildForgot() {
    return Row(
      children: [
        InkWell(
            onTap: () {},
            child: Text("Forgot password",
                style: TextStyle(
                  color: Color(0xFF78797A),
                  fontSize: 14.sp,
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
