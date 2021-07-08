import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constans.dart';

class BottomTabBar extends StatefulWidget {
  @override
  _BottomTabBarState createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  int selectedIndex = 0;
  bool isPressed = true;

  void updateTabSelection(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(374.74),
      height: ScreenUtil().setHeight(73.6),
      child: BottomNavigationBar(
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
                  icon: Icon(Icons.panorama_fish_eye,
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
                    Icons.panorama_fish_eye,
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
                    icon: Icon(Icons.panorama_fish_eye,
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
                      icon: Icon(Icons.panorama_fish_eye,
                          color: (selectedIndex == 3)
                              ? isSelectedIconColor
                              : colorForBottomIcons))),
              title: bottomAppBarTextForChatsButton),
        ],
        onTap: (index) {
          // print("1");
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
