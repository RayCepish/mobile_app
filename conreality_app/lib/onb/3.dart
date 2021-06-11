import 'package:flutter/material.dart';

class Third extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            Text(
              "Game with Teams",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                child: Image.asset('assets/images/thirdPhoto.png'),
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Text(
                "You can take part in tournaments with \n your team, win and build the strongest \n team",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
