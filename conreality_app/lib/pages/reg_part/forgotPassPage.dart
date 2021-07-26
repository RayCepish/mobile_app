import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reg_log_pages/pages/reg_part/reg/sign_up/signIn.dart';

const themeColor = Color(0xFF1D1E21);
const fieldDescr = Color(0xFF78797A);
const darkGrey = Color(0xFF424242);
const darkRed = Color(0xFFB71C1C);

class ForgotPass extends StatefulWidget {
  ForgotPass({Key? key}) : super(key: key);

  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  FocusNode _recoveryFocus = FocusNode();
  TextEditingController _recoveryController = TextEditingController();
  bool getResetLink = false;
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
          'Password Recovery',
          style: TextStyle(fontSize: 24.sp, color: Colors.white),
        ),
        elevation: 0,
        toolbarHeight: 70, // Set this height
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(
            FocusNode(),
          );
        },
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
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
                          SizedBox(height: 120.h),
                          _descriptionField(
                              getResetLink == false ? 'Email' : ''),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 15.h,
                            ),
                            child: getResetLink == false
                                ? _buildLongField()
                                : _linkSend(),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 55.h),
                              child: _curentButtonContainer(
                                  getResetLink == false
                                      ? "SEND A RESET LINK TO MY EMAIL"
                                      : "GO TO SIGN PAGE")),
                          Padding(
                            padding: EdgeInsets.only(top: 340.h),
                            child: Row(
                              children: [
                                getResetLink == false
                                    ? Container(
                                        color: darkGrey,
                                        width: 93.w,
                                        height: 50.h,
                                        child: TextButton(
                                          child: Text(
                                            'BACK',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginForm(),
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    : Container()
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
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
        controller: _recoveryController,
        textInputAction: TextInputAction.next,
        focusNode: _recoveryFocus,
        onFieldSubmitted: (term) {
          _fieldFocusChange(context, _recoveryFocus);
        },
        decoration: InputDecoration(
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

  Container _linkSend() {
    return Container(
      padding: EdgeInsets.only(left: 35.w),
      child: _descriptionField('RESET LINK HAS BEEN SEND TO YOUR EMAIL'),
    );
  }

  Container _curentButtonContainer(String curentButtonDescription) {
    return Container(
      height: 50.h,
      width: 335.w,
      child: RaisedButton(
          onPressed: () {
            setState(() {
              getResetLink == false
                  ? getResetLink = true
                  : Navigator.pop(context);
            });
          },
          child: Text(
            curentButtonDescription,
            style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700),
          ),
          color: darkRed),
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
