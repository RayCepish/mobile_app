import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmAdress extends StatefulWidget {
  @override
  _ConfirmAdressState createState() => _ConfirmAdressState();
}

class _ConfirmAdressState extends State<ConfirmAdress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 238,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 136,
                  ),
                  Container(
                    height: 101,
                    width: 101,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/images/Vector.png"),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 61,
              ),
              Container(
                height: 65,
                width: 335,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 15,
                          width: 61,
                          child: Text(
                            "ADDRESS",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(
                          Radius.circular(3),
                        ),
                      ),
                      child: TextFormField(
                         textAlign: TextAlign.center, 
                        decoration: InputDecoration(
                           labelText: 'Páričkova 170, 821 09 Bratislava, Slovakia',  contentPadding: EdgeInsets.only(left: 13, right: 55) 
                        ),
                      ),
                    ),
                  ],
                ),
              ),
               SizedBox(
                      height: 60,
                    ),
              Container(
                width: 320,
                height: 54,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("CONFIRM"),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}
