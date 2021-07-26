import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'createNewArenaSecondScreen.dart';

const themeColor = Color(0xFF1D1E21);
const fieldDescr = Color(0xFF78797A);
const darkGrey = Color(0xFF424242);
const veryDarkGrey = Color(0xFF303030);
const darkRed = Color(0xFFB71C1C);
int paidArenaindex = 0;

class CreateNewArenaFirstScreen extends StatefulWidget {
  CreateNewArenaFirstScreen({Key? key}) : super(key: key);

  @override
  _CreateNewArenaFirstScreenState createState() =>
      _CreateNewArenaFirstScreenState();
}

class _CreateNewArenaFirstScreenState extends State<CreateNewArenaFirstScreen> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  FocusNode _arenanameFocus = FocusNode();
  FocusNode _addresFocus = FocusNode();
  TextEditingController _arenanameController = TextEditingController();
  TextEditingController _addresController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: themeColor,
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
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Image.asset(
                                            'assets/images/MapFrame.png',
                                            // width: 375.w,
                                            // height: 375.h,
                                          ),
                                          Positioned(
                                            top: 20, //no adaptive
                                            left: 115, //no adaptive
                                            child: Text(
                                              'Create Arena',
                                              style: TextStyle(
                                                  fontSize: 24, //no adaptive
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          )
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 20.w, right: 20.w),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 12.h),
                                              child: _descriptionField(
                                                  'ARENA NAME'),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 12.h),
                                              child: _buildLongField(
                                                  _arenanameController,
                                                  _arenanameFocus,
                                                  'BNB Arena - 10% discount for 4+ members'),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 12.h),
                                              child: _descriptionField(
                                                  'ADDRESS OR COORDINATES'),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 12.h),
                                              child: _buildLongField(
                                                  _addresController,
                                                  _addresFocus,
                                                  '49.792029 24.079274'),
                                            ),
                                            Container(
                                              margin:
                                                  EdgeInsets.only(top: 36.h),
                                              padding: EdgeInsets.only(
                                                  right: 16.w, left: 16.w),
                                              width: 335.w,
                                              height: 50.h,
                                              color: darkGrey,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text('Paid arena',
                                                      style: TextStyle(
                                                          fontSize: 16.sp,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                  ToggleSwitch(
                                                    initialLabelIndex:
                                                        paidArenaindex,
                                                    minWidth: 20.w,
                                                    minHeight: 20.h,
                                                    borderWidth: 0.5.w,
                                                    cornerRadius: 1,
                                                    activeBgColors: [
                                                      [Colors.grey],
                                                      [Colors.grey]
                                                    ],
                                                    inactiveBgColor: themeColor,
                                                    totalSwitches: 2,
                                                    icons: [null, null],
                                                    onToggle: (value) {
                                                      paidArenaindex = value;
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  EdgeInsets.only(top: 83.h),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                      width: 145.w,
                                                      height: 50.h,
                                                      color: darkGrey,
                                                      child: TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                            'CANCEL',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
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
                                                                  builder: (c) =>
                                                                      CreateNewArenaSecondScreen()));
                                                        },
                                                        child: Text('NEXT',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
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
                                      ),
                                    ],
                                  )))));
                }))));
  }

  _fieldFocusChange(BuildContext context, FocusNode currentFocus) {
    currentFocus.unfocus();
  }

  Widget _buildLongField(
      TextEditingController curController, FocusNode curFocus, String hint) {
    return Container(
      height: 50.h,
      width: 335.w,
      child: TextFormField(
        style: TextStyle(fontSize: 16.sp, color: Colors.white),
        controller: curController,
        cursorColor: Colors.red,
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
