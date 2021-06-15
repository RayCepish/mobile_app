import 'package:flutter/material.dart';

class DetailsOfLegue extends StatefulWidget {
  DetailsOfLegue({Key? key}) : super(key: key);

  @override
  _DetailsOfLegueState createState() => _DetailsOfLegueState();
}

class _DetailsOfLegueState extends State<DetailsOfLegue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 24, top: 27),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[900],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 14,
              top: 21,
            ),
            child: Container(
              height: 43,
              width: 243,
              child: Text(
                "BNB CUP 2021",
                style: TextStyle(color: Colors.grey, fontSize: 36),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Container(
                  child: Text(
                    "STAGE 4",
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                width: 130,
              ),
              Container(
                child: Text(
                  "06 Jun.- 07 Jun. 2021",
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
              )
            ],
          ), 
         
        ],
      ),
    );
  }
}
