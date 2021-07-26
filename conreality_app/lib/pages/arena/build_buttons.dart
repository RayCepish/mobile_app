import 'package:flutter/material.dart';


  Widget _buildButtons() {
    return Column(
      children: [
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 20,
            ),
            Container(
              width: 100,
              height: 50,
              child: RaisedButton(
                color: Colors.red[800],
                shape: RoundedRectangleBorder(),
                onPressed: () {},
                child: Text(
                  "FAVORITE",
                  style: TextStyle(
                      fontFamily: "TTSquares-Italic",
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white,
                      height: 1.16),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              width: 100,
              height: 50,
              child: RaisedButton(
                color: Colors.red[800],
                shape: RoundedRectangleBorder(),
                onPressed: () {},
                child: Text(
                  "ARENAS",
                  style: TextStyle(
                      fontFamily: "TTSquares-Italic",
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white,
                      height: 1.16),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              width: 100,
              height: 50,
              child: RaisedButton(
                color: Colors.red[800],
                shape: RoundedRectangleBorder(),
                onPressed: () {},
                child: Text(
                  "GAMES",
                  style: TextStyle(
                      fontFamily: "TTSquares-Italic",
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white,
                      height: 1.16),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ],
    );
  }

