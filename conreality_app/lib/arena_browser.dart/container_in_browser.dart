import 'package:flutter/material.dart';

class ContainersInArenaBrowser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 4),
            child: Container(
                height: 198,
                width: 334,
                decoration: BoxDecoration(color: Colors.grey[800]),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: 39,
                            width: 106,
                            child: RaisedButton(
                              onPressed: () {},
                              child: const Text('LIKED',
                                  style: TextStyle(fontSize: 20)),
                              color: Colors.red,
                              textColor: Colors.white,
                              elevation: 5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
