import 'package:flutter/material.dart';
import 'package:reg_log_pages/leagues/arenas_teams/arenas_teams.dart';

class CardsWithDetails extends StatelessWidget {
  final String number;
  final String title;
  final String items;
  final double widht;
  CardsWithDetails({
    required this.items,
    required this.number,
    required this.title,
    required this.widht
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14),  
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PageOfArenaTeam(),
            ),
          );
        },
        child: Container(
          width: 346,
          height: 50,
          child: Row(
            children: [ 
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, right: 10),
                    child: Container(
                      width: 8,
                      height: 16,
                      child: Text(
                        number,
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                width: 310,
                height: 50,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 15),
                      child: Container(
                        child: Text(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: widht,
                    ),
                    Container(
                      child: Text(
                        items,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        " items",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
