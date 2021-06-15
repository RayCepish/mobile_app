import 'dart:ui';

import 'package:flutter/material.dart';

import 'cards_with_details.dart';

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
      body: Stack(
        children: [
          Column(
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
              SizedBox(
                height: 20,
              ),
              CardsWithDetails(
                number: "1",
                title: "KievXpress",
                items: "400",
                widht: 110,
              ),
              SizedBox(
                height: 14,
              ),
              CardsWithDetails(
                number: "2",
                title: "KyivUnited 2",
                items: "380,90",
                widht: 80,
              ),
              SizedBox(
                height: 14,
              ),
              CardsWithDetails(
                number: "3",
                title: "Falcon Heavy",
                items: "348,29",
                widht: 70,
              ),
              SizedBox(
                height: 14,
              ),
              CardsWithDetails(
                number: "4",
                title: "Area 51",
                items: "309",
                widht: 140,
              ),
              SizedBox(
                height: 14,
              ),
              CardsWithDetails(
                number: "5",
                title: "Stalker",
                items: "219",
                widht: 145,
              ),
              SizedBox(
                height: 14,
              ),
              CardsWithDetails(
                number: "6",
                title: "KievXpress Lite",
                items: "198,32",
                widht: 60,
              ),
              SizedBox(
                height: 14,
              ),
              CardsWithDetails(
                number: "7",
                title: "UtraSpartans",
                items: "169",
                widht: 100,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
