import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reg_log_pages/reg_part/registration.dart';
  
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
                height: 238.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 136.w,
                  ),
                  Container(
                    height: 101.h,
                    width: 101.w,
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
                height: 61.h,
              ),
              Container(
                height: 65.h,
                width: 335.w,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 15.h,
                          width: 61.w,
                          child: Text(
                            "ADDRESS",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      height: 40.h,
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
                      height: 60.h,
                    ),
              Container(
                width: 320.w,
                height: 54.h,
                child: RaisedButton(
                  onPressed: () {
                       Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpForm(),
                      ),
                    );
                  },
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
