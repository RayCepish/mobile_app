import 'package:flutter/material.dart';

class Four extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            Text(
              "Location Permission",
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
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Container(
                child: Text(
                  "App requires access to your location to function.",
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
