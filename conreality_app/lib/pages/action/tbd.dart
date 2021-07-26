import 'package:flutter/material.dart';

class TBDOfActiion extends StatefulWidget {
  TBDOfActiion({Key? key}) : super(key: key);

  @override
  _TBDOfActiionState createState() => _TBDOfActiionState();
}

class _TBDOfActiionState extends State<TBDOfActiion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black),
      child: Center(
        child: Text(
          "nothing to see here",
          style: TextStyle(
            color: Colors.white,
            fontFamily: " TTSquares-Italic"
          ),
        ),
      ),
    );
  }
}
