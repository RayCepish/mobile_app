import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:toggle_switch/toggle_switch.dart';

const themeColor = Color(0xFF1D1E21);
const fieldDescr = Color(0xFF78797A);
const darkGrey = Color(0xFF424242);
const darkRed = Color(0xFFB71C1C);

int inviteMembersindex = 0;
int inviteMembersToGame = 0;

class ClanSetting extends StatefulWidget {
  ClanSetting({Key? key}) : super(key: key);

  @override
  _ClanSetting createState() => _ClanSetting();
}

class _ClanSetting extends State<ClanSetting> {
  FocusNode _changeNicknameFocus = FocusNode();
  TextEditingController _changeNicknameController = TextEditingController();
  bool _isVisibleMembers = false;
  bool _isVisibleleadersSetting = false;
  bool _isVisileDissolveClan = false;

  void showToast() {
    setState(() {
      _isVisibleMembers = !_isVisibleMembers;
      if (_isVisibleMembers == true) {
        _isVisibleleadersSetting = false;
        _isVisileDissolveClan = false;
      } else if (_isVisibleMembers == false) {
        _isVisibleMembers = _isVisibleMembers;
      } else {}
    });
  }

  void showToast2() {
    setState(() {
      _isVisibleleadersSetting = !_isVisibleleadersSetting;
      if (_isVisibleleadersSetting == true) {
        _isVisibleMembers = false;
        _isVisileDissolveClan = false;
      } else if (_isVisibleMembers == false) {
        _isVisibleleadersSetting = _isVisibleleadersSetting;
      } else {}
    });
  }

  void showToast3() {
    setState(() {
      _isVisileDissolveClan = !_isVisileDissolveClan;
      if (_isVisileDissolveClan == true) {
        _isVisibleleadersSetting = false;
        _isVisibleMembers = false;
      } else if (_isVisileDissolveClan == false) {
        _isVisileDissolveClan = _isVisileDissolveClan;
      } else {}
    });
  }

  Color getColor() {
    if (_isVisibleMembers == false) {
      return darkGrey;
    } else {
      return darkRed;
    }
  }

  Color getColor2() {
    if (_isVisibleleadersSetting == false) {
      return darkGrey;
    } else {
      return darkRed;
    }
  }

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
                    'Clan Settings',
                    style: TextStyle(fontSize: 24.sp, color: Colors.white),
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
            FocusScope.of(context).requestFocus(new FocusNode());
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
                  autovalidateMode: AutovalidateMode.always,
                  child: SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: viewportConstraints.maxHeight,
                      ),
                      child: Column(
                        children: [
                          Container(
                            child: Center(
                              child: Stack(
                                children: [
                                  Container(
                                    child: Image.asset(
                                        'assets/images/prototype/second.png'),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 275.w, top: 75.h),
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
                          _buildLongField(),
                          Container(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 25.h),
                                    width: 335.w,
                                    height: 50.h,
                                    color: getColor(),
                                    child: TextButton(
                                      child: Text(
                                        'MEMBERS PERMISION',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      onPressed: showToast,
                                    ),
                                  ),
                                  Visibility(
                                      visible: _isVisibleMembers,
                                      child: _membersSetting()),
                                  Container(
                                    margin: EdgeInsets.only(top: 3.h),
                                    width: 335.w,
                                    height: 50.h,
                                    color: getColor2(),
                                    child: TextButton(
                                      child: Text(
                                        'LEADERS',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      onPressed: showToast2,
                                    ),
                                  ),
                                  Visibility(
                                      visible: _isVisibleleadersSetting,
                                      child: _leadersSetting()),
                                  Container(
                                    margin: EdgeInsets.only(top: 23.h),
                                    width: 335.w,
                                    height: 50.h,
                                    color: darkGrey,
                                    child: TextButton(
                                      child: Text(
                                        'DISSOLVE CLAN',
                                        style: TextStyle(
                                            color: darkRed,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      onPressed: showToast3,
                                    ),
                                  ),
                                  Visibility(
                                      visible: _isVisileDissolveClan,
                                      child: _dissolveClan()),
                                ],
                              ),
                            ),
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

  _fieldFocusChange(
    BuildContext context,
    FocusNode currentFocus,
  ) {
    currentFocus.unfocus();
  }

  Widget _buildLongField() {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      height: 50.h,
      width: 335.w,
      child: TextFormField(
        style: TextStyle(fontSize: 16.sp, color: Colors.white),
        controller: _changeNicknameController,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        focusNode: _changeNicknameFocus,
        onFieldSubmitted: (term) {
          _fieldFocusChange(context, _changeNicknameFocus);
        },
        decoration: InputDecoration(
            filled: true,
            labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400),
            labelText: "Clan Name",
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

  Widget _membersSetting() {
    return Container(
      height: 155.h,
      decoration:
          BoxDecoration(border: Border.all(width: 0.3.w, color: Colors.grey)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Text(
              'WHAT CAN MEMBERS OF THIS CLAN DO?',
              style: TextStyle(
                  color: fieldDescr,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: EdgeInsets.only(right: 35.w),
                child: Text(
                  "Invite new members",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700),
                ),
              ),
              ToggleSwitch(
                initialLabelIndex: inviteMembersindex,
                minWidth: 20.w,
                minHeight: 20.h,
                borderWidth: 0.5.w,
                borderColor: [Colors.grey],
                cornerRadius: 1,
                activeBgColors: [
                  [darkRed],
                  [darkRed]
                ],
                inactiveBgColor: themeColor,
                totalSwitches: 2,
                icons: [null, null],
                onToggle: (value) {
                  inviteMembersindex = value;
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Invite members to games",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700),
              ),
              ToggleSwitch(
                initialLabelIndex: inviteMembersToGame,
                minWidth: 20.w,
                minHeight: 20.h,
                borderWidth: 0.5.w,
                borderColor: [Colors.grey],
                cornerRadius: 1,
                activeBgColors: [
                  [darkRed],
                  [darkRed]
                ],
                inactiveBgColor: themeColor,
                totalSwitches: 2,
                icons: [null, null],
                onToggle: (value) {
                  inviteMembersToGame = value;
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _leadersSetting() {
    return Container(
      height: 255.h,
      decoration:
          BoxDecoration(border: Border.all(width: 0.3.w, color: Colors.grey)),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 0.3.w, color: Colors.grey))),
            width: 334.w,
            height: 50.h,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'ADD NEW LEADER',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Container(
            height: 140.h,
            child: ListView(
              children: [
                _friendInfo('User Name'),
                _friendInfo('User Name'),
                _friendInfo('User Name'),
                _friendInfo('User Name'),
                _friendInfo('User Name'),
                _friendInfo('User Name'),
                _friendInfo('User Name'),
                _friendInfo('User Name'),
                _friendInfo('User Name'),
                _friendInfo('User Name'),
              ],
            ),
          ),
          Container(
            height: 50.h,
            margin: EdgeInsets.all(5.w),
            child: Text(
              'You can add leaders to help you to manage Clan. Long press to remove them.',
              style: TextStyle(
                  color: fieldDescr,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }

  Container _friendInfo(friendName) {
    return Container(
      padding: EdgeInsets.all(5.w),
      width: 335.w,
      height: 66.h,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 0.3.w, color: Colors.grey))),
      child: Row(
        children: [
          Container(
              margin: EdgeInsets.only(left: 10.w, right: 10.w),
              width: 50.w,
              height: 50.h,
              child: Image.asset('assets/images/prototype/second.png')),
          Text(
            friendName,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }

  Widget _dissolveClan() {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(width: 0.3.w, color: Colors.grey)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 45.h),
            child: Center(
              child: Text(
                "Are you sure you want to dissolve the Clan?",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 40.h),
            child: Center(
              child: Text(
                "This action is unreversable",
                style: TextStyle(
                    color: darkRed,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: 145.w,
                    height: 50.h,
                    color: darkGrey,
                    child: TextButton(
                      onPressed: () {},
                      child: Text('CANSEL',
                          style: TextStyle(
                              color: darkRed,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700)),
                    )),
                Container(
                  width: 145.w,
                  height: 50.h,
                  color: darkRed,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "YES, I'M SURE",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
