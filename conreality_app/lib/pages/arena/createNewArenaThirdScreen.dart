import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'myArenas.dart';

const themeColor = Color(0xFF1D1E21);
const fieldDescr = Color(0xFF78797A);
const darkGrey = Color(0xFF424242);
const veryDarkGrey = Color(0xFF303030);
const darkRed = Color(0xFFB71C1C);

class CreateNewArenaThirdScreen extends StatefulWidget {
  CreateNewArenaThirdScreen({Key? key}) : super(key: key);

  @override
  _CreateNewArenaThirdScreenState createState() =>
      _CreateNewArenaThirdScreenState();
}

class _CreateNewArenaThirdScreenState extends State<CreateNewArenaThirdScreen> {
  FocusNode _descriptionFocus = FocusNode();
  TextEditingController _descriptionController = TextEditingController();
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
                                      child: Column(children: [
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
                                                child: Text('Arenas Adress',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w400)))),
                                        Container(
                                          margin: EdgeInsets.only(top: 24.h),
                                          child:
                                              _descriptionField('DESCRIPTION'),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 12.h),
                                          child: _buildDescriptionField(
                                              _descriptionController,
                                              TextInputType.text,
                                              _descriptionFocus,
                                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Etiam dignissim diam quis enim lobortis. Leo vel orci porta non pulvinar. Auctor urna nunc id cursus metus aliquam eleifend mi.'),
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
                                                                  MyArenas()));
                                                    },
                                                    child: Text('SAVE',
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
                                      ]))))));
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

  _fieldFocusChange(BuildContext context, FocusNode currentFocus) {
    currentFocus.unfocus();
  }

  Widget _buildDescriptionField(TextEditingController curController,
      TextInputType type, FocusNode curFocus, String hint) {
    final maxLines = 24;
    // to email
    return Container(
      height: 427.h,
      width: 335.w,
      child: TextFormField(
        style: TextStyle(fontSize: 16.sp, color: Colors.white),
        controller: curController,
        keyboardType: type,
        cursorColor: darkRed,
        maxLines: maxLines,
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
            contentPadding: EdgeInsets.all(16.w), //всюди впихнути
            filled: true,
            fillColor: darkGrey,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.w, color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2.w, color: darkRed),
            )),
      ),
    );
  }
}
