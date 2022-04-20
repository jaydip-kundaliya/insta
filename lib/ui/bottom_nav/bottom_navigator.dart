import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../controllers/bottom_nav_controller.dart';

/// Main Page to display all 5 pages of home screen
class BottomNavigator extends StatelessWidget {
  const BottomNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: BottomNavController.bottomNavController.currentIndex.value,
          children: BottomNavController.bottomNavController.bottomPages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex:
              BottomNavController.bottomNavController.currentIndex.value,
          items: _bottomNavigationBarItems(),
          type: BottomNavigationBarType.fixed,
          iconSize: 30,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (int value) {
            BottomNavController.bottomNavController.changeCurrentIndex(value);
          },
        ),
      ),
    );
  }

  // bottom navigation items list for display pages icons
  List<BottomNavigationBarItem> _bottomNavigationBarItems() {
    return const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        label: 'home',
        icon: Icon(Icons.home_outlined),
        activeIcon: Icon(Icons.home),
      ),
      BottomNavigationBarItem(
        label: 'search',
        icon: Icon(Icons.search),
      ),
      BottomNavigationBarItem(
        label: 'add_post',
        icon: Icon(FontAwesomeIcons.clapperboard),
      ),
      BottomNavigationBarItem(
        label: 'notification',
        icon: Icon(Icons.favorite_outline),
        activeIcon: Icon(Icons.favorite, size: 5),
      ),
      BottomNavigationBarItem(
        label: 'profile',
        icon: Icon(Icons.person_outline),
        activeIcon: Icon(Icons.person),
      ),
    ];
  }
}
