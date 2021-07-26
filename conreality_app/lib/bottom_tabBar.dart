import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reg_log_pages/pages/action/action.dart';
import 'package:reg_log_pages/pages/arena/google_map.dart';
import 'package:reg_log_pages/pages/profile/userProfile.dart';
import 'package:reg_log_pages/pages/qr/scan.dart';
import 'constans.dart';

class BottomTabBar extends StatefulWidget {
  @override
  _BottomTabBarState createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  int selectedIndex = 0;
  bool isPressed = true;
  List<Widget> tabs = <Widget>[
    UserProfile(),
    GoogleMapScreen(location: null),
    ActionMenuPage(),
    ScannerQR(),
  ];
  void updateTabSelection(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        backgroundColor: backgroundArenaBrowserPageBottomAppBar,
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: Container(
                width: ScreenUtil().setWidth(37),
                height: ScreenUtil().setHeight(40),
                child: IconButton(
                  onPressed: () {
                    updateTabSelection(0);
                  },
                  icon: Icon(Icons.crop_square,
                      color: (selectedIndex == 0)
                          ? isSelectedIconColor
                          : colorForBottomIcons),
                ),
              ),
              title: (selectedIndex == 0)
                  ? bottomAppBarTextForProfileButtonWithSelected
                  : bottomAppBarTextForProfileButton),
          BottomNavigationBarItem(
              icon: Container(
                width: ScreenUtil().setWidth(37),
                height: ScreenUtil().setHeight(40),
                child: IconButton(
                  onPressed: () {
                    updateTabSelection(1);
                  },
                  icon: Icon(
                    Icons.crop_square,
                    color: (selectedIndex == 1)
                        ? isSelectedIconColor
                        : colorForBottomIcons,
                  ),
                ),
              ),
              title: (selectedIndex == 1)
                  ? bottomAppBarTextForArenaButtonWithSelected
                  : bottomAppBarTextForArenaButton),
          BottomNavigationBarItem(
              icon: Container(
                width: ScreenUtil().setWidth(37),
                height: ScreenUtil().setHeight(40),
                child: IconButton(
                    onPressed: () {
                      updateTabSelection(2);
                    },
                    icon: Icon(Icons.crop_square,
                        color: (selectedIndex == 2)
                            ? isSelectedIconColor
                            : colorForBottomIcons)),
              ),
              title: (selectedIndex == 2)
                  ? bottomAppBarTextForGamesButtonWithSelected
                  : bottomAppBarTextForGamesButton),
          BottomNavigationBarItem(
              icon: Container(
                width: ScreenUtil().setWidth(37),
                height: ScreenUtil().setHeight(40),
                child: IconButton(
                  onPressed: () {
                    updateTabSelection(3);
                  },
                  icon: Icon(Icons.crop_square,
                      color: (selectedIndex == 3)
                          ? isSelectedIconColor
                          : colorForBottomIcons),
                ),
              ),
              title: bottomAppBarTextForChatsButton),
        ],
        onTap: (index) {
          setState(
            () {
              selectedIndex = index;
            },
          );
        },
      ),
    );
  }
}
