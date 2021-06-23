import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reg_log_pages/onb/onb.dart';
 import 'dart:math' as math;
import '../home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'allow_location.dart';


class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => OnBoardingPage(),
        ),
      ),
    );
    _animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    final _curvedAnimation = CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
        reverseCurve: Curves.bounceOut);

    _animation =
        Tween<double>(begin: 0, end: 2 * math.pi).animate(_curvedAnimation)
          ..addStatusListener(
            (status) {
              if (status == AnimationStatus.completed) {
                _animationController.reverse();
              } else if (status == AnimationStatus.dismissed) {
                _animationController.forward();
              }
            },
          );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        body: Center(
          child: Container(
            width: 160,
            height: 160,
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: CenterWidget(
                    animation: _animation,
                  ),
                ),
                Align(alignment: Alignment.center, child: Container(
                  width: 93,
                  height: 121,
                  child: SidesWidgte()))
              ],
            ),
          ),
        )
        //   ],
        // ),
        );
  }
}

class CenterWidget extends AnimatedWidget {
  CenterWidget({
    Key? key,
    required Animation<double> animation,
  }) : super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Transform.rotate(
        angle: animation.value,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/side_logo_widget.png"),
            ),
          ),
        ));
  }
}

class SidesWidgte extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/images/center_logo_widget.png"),
        ),
      ),
    );
  }
}
