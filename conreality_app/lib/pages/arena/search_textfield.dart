import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Positioned(
          top: 39,
          right: 83,
          left: 20,
          child: Container(
            width: 272.0,
            height: 50,
            child: TextField(
              cursorColor: Colors.black,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.go,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[800],
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2.0),
                ),
                hintText: "Search",
                hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Positioned(
          top: 39,
          right: 20,
          child: Container(
            width: 50,
            height: 50,
            child: RaisedButton(
              onPressed: () {},
              child: Container(
                child: Text(
                  "FIL TER",
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                  style: TextStyle(color: Colors.red, fontSize: 10),
                ),
              ),
              color: Colors.grey[800],
            ),
          ),
        ),
      ],
    );
  }
}
