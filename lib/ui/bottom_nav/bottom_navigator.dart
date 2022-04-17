import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/bottom_nav_controller.dart';

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
          onTap: (int value) {
            BottomNavController.bottomNavController.changeCurrentIndex(value);
          },
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _bottomNavigationBarItems() {
    return const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        label: 'home',
        icon: Icon(Icons.home),
      ),
      BottomNavigationBarItem(
        label: 'search',
        icon: Icon(Icons.search),
      ),
      BottomNavigationBarItem(
        label: 'add_post',
        icon: Icon(Icons.add_box_outlined),
      ),
      BottomNavigationBarItem(
        label: 'notification',
        icon: Icon(Icons.notifications),
      ),
      BottomNavigationBarItem(
        label: 'profile',
        icon: Icon(Icons.person),
      ),
    ];
  }
}
