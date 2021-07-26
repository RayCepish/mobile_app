// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:reg_log_pages/action/games.dart';
// import 'package:reg_log_pages/reg_part/forgotPassPage.dart';

// import 'tbd.dart';

// class ActionMenuPage extends StatefulWidget {
//   @override
//   _ActionMenuPageState createState() => _ActionMenuPageState();
// }

// class _ActionMenuPageState extends State<ActionMenuPage>
//     with TickerProviderStateMixin {
//   late TabController _controller;

//   late AnimationController _animationControllerOn;

//   late AnimationController _animationControllerOff;

//   late Animation _colorTweenBackgroundOn;
//   late Animation _colorTweenBackgroundOff;

//   late Animation _colorTweenForegroundOn;
//   late Animation _colorTweenForegroundOff;

//   int _currentIndex = 0;

//   int _prevControllerIndex = 0;

//   double _aniValue = 0.0;

//   double _prevAniValue = 0.0;

//   List labels = ["GAMES", "TBD", "TBD"];

//   Color _foregroundOn = Colors.white;
//   Color _foregroundOff = Colors.white;

//   Color _backgroundOn = Color(0xFFAA0000);
//   Color _backgroundOff = Color(0xFF272525);

//   ScrollController _scrollController = new ScrollController();

//   List _keys = [];

//   bool _buttonTap = false;

//   @override
//   void initState() {
//     super.initState();

//     for (int index = 0; index < labels.length; index++) {
//       _keys.add(new GlobalKey());
//     }

//     _controller = TabController(vsync: this, length: labels.length);
//     _controller.animation!.addListener(_handleTabAnimation);
//     _controller.addListener(_handleTabChange);

//     _animationControllerOff =
//         AnimationController(vsync: this, duration: Duration(milliseconds: 75));
//     _animationControllerOff.value = 1.0;
//     _colorTweenBackgroundOff =
//         ColorTween(begin: _backgroundOn, end: _backgroundOff)
//             .animate(_animationControllerOff);
//     _colorTweenForegroundOff =
//         ColorTween(begin: _foregroundOn, end: _foregroundOff)
//             .animate(_animationControllerOff);

//     _animationControllerOn =
//         AnimationController(vsync: this, duration: Duration(milliseconds: 150));
//     _animationControllerOn.value = 1.0;
//     _colorTweenBackgroundOn =
//         ColorTween(begin: _backgroundOff, end: _backgroundOn)
//             .animate(_animationControllerOn);
//     _colorTweenForegroundOn =
//         ColorTween(begin: _foregroundOff, end: _foregroundOn)
//             .animate(_animationControllerOn);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor:Colors. black,
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//              height: 90,
             
//               child: ListView.builder(
//                   physics: BouncingScrollPhysics(),
//                   controller: _scrollController,
//                   scrollDirection: Axis.horizontal,
//                   itemCount: labels.length,
//                   itemBuilder: (
//                     BuildContext context,
//                     int index,
//                   ) {
//                     return Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Padding(
//                           key: _keys[index],
//                           padding: EdgeInsets.only(
//                             left: 15.w,
//                             top: 20.h,
//                           ),
//                           child: Container(
//                             height: 50.h,
//                             width:106.w,
//                             child: ButtonTheme(
//                               child: AnimatedBuilder(
//                                 animation: _colorTweenBackgroundOn,
//                                 builder: (context, child) => FlatButton(
//                                   color: _getBackgroundColor(index),
//                                   onPressed: () {
//                                     setState(() {
//                                       _buttonTap = true;
//                                       _controller.animateTo(index);
//                                       _setCurrentIndex(index);
//                                       _scrollTo(index);
//                                     });
//                                   },
//                                   child: Text(
//                                     labels[index],
//                                     style: TextStyle(
//                                       color: _getForegroundColor(index),
//                                       fontFamily: "TTSquares-Italic",
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   }),
//             ),
//             Flexible(
//               child: TabBarView(
//                 controller: _controller,
//                 children: <Widget>[
//                   GamesPageOfAction(),
//                   TBDOfActiion(),
//                   TBDOfActiion(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   _handleTabAnimation() {
//     _aniValue = _controller.animation!.value;

//     if (!_buttonTap && ((_aniValue - _prevAniValue).abs() < 1)) {
//       _setCurrentIndex(_aniValue.round());
//     }

//     _prevAniValue = _aniValue;
//   }

//   _handleTabChange() {
//     if (_buttonTap) _setCurrentIndex(_controller.index);

//     if ((_controller.index == _prevControllerIndex) ||
//         (_controller.index == _aniValue.round())) _buttonTap = false;

//     _prevControllerIndex = _controller.index;
//   }

//   _setCurrentIndex(int index) {
//     if (index != _currentIndex) {
//       setState(() {
//         _currentIndex = index;
//       });

//       _triggerAnimation();
//       _scrollTo(index);
//     }
//   }

//   _triggerAnimation() {
//     _animationControllerOn.reset();
//     _animationControllerOff.reset();

//     _animationControllerOn.forward();
//     _animationControllerOff.forward();
//   }

//   _scrollTo(int index) {
//     double screenWidth = MediaQuery.of(context).size.width;

//     RenderBox renderBox = _keys[index].currentContext.findRenderObject();
//     double size = renderBox.size.width;
//     double position = renderBox.localToGlobal(Offset.zero).dx;

//     double offset = (position + size / 2) - screenWidth / 2;

//     if (offset < 0) {
//       renderBox = _keys[0].currentContext.findRenderObject();
//       position = renderBox.localToGlobal(Offset.zero).dx;

//       if (position > offset) offset = position;
//     } else {
//       renderBox = _keys[labels.length - 1].currentContext.findRenderObject();
//       position = renderBox.localToGlobal(Offset.zero).dx;
//       size = renderBox.size.width;

//       if (position + size < screenWidth) screenWidth = position + size;

//       if (position + size - offset < screenWidth) {
//         offset = position + size - screenWidth;
//       }
//     }

//     _scrollController.animateTo(offset + _scrollController.offset,
//         duration: new Duration(milliseconds: 150), curve: Curves.easeInOut);
//   }

//   _getBackgroundColor(int index) {
//     if (index == _currentIndex) {
//       return _colorTweenBackgroundOn.value;
//     } else if (index == _prevControllerIndex) {
//       return _colorTweenBackgroundOff.value;
//     } else {
//       return _backgroundOff;
//     }
//   }

//   _getForegroundColor(int index) {
//     if (index == _currentIndex) {
//       return _colorTweenForegroundOn.value;
//     } else if (index == _prevControllerIndex) {
//       return _colorTweenForegroundOff.value;
//     } else {
//       return _foregroundOff;
//     }
//   }
// }


//   Widget _buildTitle() {
//     return Container(
//         width: 195,
//         height: 28,
//         child: Text(
//           "QR code scaner",
//           style: TextStyle(
//             fontWeight: FontWeight.w700,
//             fontSize: 24,
//             color: Colors.white,
//           ),
//         ));
//   }