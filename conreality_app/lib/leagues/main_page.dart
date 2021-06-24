import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'cards_of_leageus.dart';

class MainLeaguesPage extends StatefulWidget {
  MainLeaguesPage({Key? key}) : super(key: key);

  @override
  _MainLeaguesPageState createState() => _MainLeaguesPageState();
}

class _MainLeaguesPageState extends State<MainLeaguesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(),
              SizedBox(
                height: 10.h,
              ),
              _subTitle(),
              CardsOfLeageus(
                titleText: "Ukraine, Kyiv",
                nameOfLeague: "National Paintball  League of Ukraine",
                numberOfTeams: "35 ",
                startDate: "02 Jun. 2021",
              ),
              SizedBox(
                height: 30.h,
              ),
              _listOfAllLeagues(),
              SizedBox(
                height: 10.h,
              ),
              CardsOfLeageus(
                titleText: "Ukraine, Kyiv",
                nameOfLeague: "BNB CUP 2021",
                numberOfTeams: "52 ",
                startDate: "12 Jun. 2021",
              ),
              SizedBox(
                height: 20.h,
              ),
              CardsOfLeageus(
                titleText: "USA, New York",
                nameOfLeague: "American Paintball League",
                numberOfTeams: "134 ",
                startDate: "08 Aug.2021",
              ),
              SizedBox(
                height: 20.h,
              ),
              CardsOfLeageus(
                titleText: "German, Berlin",
                nameOfLeague: "German Centerflag League",
                numberOfTeams: "98 ",
                startDate: "20 Jul.2021",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _title() {
  return Padding(
    padding: const EdgeInsets.only(top: 38, left: 20),
    child: Container(
      height: 43,
      width: 142,
      child: Text(
        "Leagues",
        style: TextStyle(color: Colors.grey, fontSize: 36),
      ),
    ),
  );
}

Widget _subTitle() {
  return Padding(
    padding: const EdgeInsets.only(left: 20),
    child: Container(
      height: 40,
      width: 100,
      child: Text(
        "Your league",
        style: TextStyle(
            color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget _listOfAllLeagues() {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            Container(
              child: Text(
                "All Leageus  ",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              child: Text(
                "(36)",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              width: 180,
            ),
            Icon(
              Icons.filter_alt_rounded,
              color: Colors.white,
              size: 30.0,
            ),
          ],
        ),
      ),
    ],
  );
}
