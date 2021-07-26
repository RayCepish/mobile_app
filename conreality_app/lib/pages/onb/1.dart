import 'package:flutter/material.dart';

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            Text(
              "Create your own Maps",
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
                  "You can create your own custom maps for an arena, with unique objects, items and zones.",
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
