import 'package:flutter/material.dart';

import '../home_screen.dart';
import 'detailsLeague/details_legues.dart';

class CardsOfLeageus extends StatelessWidget {
  final String titleText;
  final String nameOfLeague;
  final String numberOfTeams;
  final String startDate;
  CardsOfLeageus({
    required this.titleText,
    required this.nameOfLeague,
    required this.numberOfTeams,
    required this.startDate,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsOfLegue(),
            ),
          );
        },
        child: Container(
          width: 310,
          height: 110,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.all(
              Radius.circular(7),
            ),
          ),
          child: Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 7, left: 9),
                    child: Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                          image: AssetImage("assets/images/leagues/first.png"),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(7),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 20),
                    child: Container(
                      width: 100,
                      height: 14,
                      child: Text(
                        titleText,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 17),
                    child: Container(
                      width: 190,
                      height: 50,
                      child: Text(
                        nameOfLeague,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                numberOfTeams,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "Teams",
                                style: TextStyle(color: Colors.grey),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text(
                              "Start: ",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              "02 Jun.2021 ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
