import 'package:flutter/material.dart';

class PageOfArenaTeam extends StatefulWidget {
  PageOfArenaTeam({Key? key}) : super(key: key);

  @override
  _PageOfArenaTeamState createState() => _PageOfArenaTeamState();
}

class _PageOfArenaTeamState extends State<PageOfArenaTeam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
            onPressed: () => Navigator.of(context).pop(),
          ),
          SizedBox(
            width: 250,
          ),
          IconButton(
            icon: Icon(
              Icons.settings,
              size: 27,
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 107, top: 5),
                child: Container(
                  width: 160,
                  height: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/area51.png"),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 93, top: 180),
            child: Column(
              children: [
                Container(
                  width: 36,
                  height: 16,
                  child:
                      Text("Team", style: TextStyle(color: Colors.grey[800])),
                ),
                Container(
                  width: 188,
                  height: 27,
                ),
                Row(
                  children: [
                    Container(
                      width: 37,
                      height: 22,
                    ),
                    Container(
                      width: 32,
                      height: 18,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
