import 'package:flutter/material.dart';

class EnterManually extends StatefulWidget {

  @override
  _EnterManuallyState createState() => _EnterManuallyState();
}

class _EnterManuallyState extends State<EnterManually> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 133, top: 188, right: 133, ),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/Vector.png"))
              ),
            ),
          ),
          Container(
            width: 274,
            height: 81,
            child: Text(
              "Please let me see your location so you can effectively use the app's features for a fun game "
            ),
          ),

        ],
      ),
    );
  }
}