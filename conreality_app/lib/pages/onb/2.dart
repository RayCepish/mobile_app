import 'package:flutter/material.dart';

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            Text(
              "Enhance your strategy",
              style: TextStyle(
                  fontFamily: "TTSquares-Italic",
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                child: Image.asset('assets/images/prototype/Photo Frame.png'),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 15),
              child: Container(
                child: Text(
                  "Track location of your teammates on minimap and discuss tactics with them during the game to get the superior position.",
                  style: TextStyle(
                      fontFamily: "TTSquares-Italic",
                      color: Colors.white,
                      fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// {
//                               pageController.animateToPage(3 - 1,
//                                   duration: Duration(milliseconds: 400),
//                                   curve: Curves.bounceIn);
//                             },