import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controllers/bottom_nav_controller.dart';
import '../../utils/dummy_data.dart';
import '../shared/profile_avatar.dart';

/// Main Page to display all 5 pages of home screen
class BottomNavigator extends StatelessWidget {
  const BottomNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        label: 'home',
        icon: SvgPicture.asset(
          'assets/images/home_light.svg',
          width: 25,
          height: 25,
        ),
        activeIcon: SvgPicture.asset(
          'assets/images/home_solid.svg',
          width: 25,
          height: 25,
        ),
      ),
      BottomNavigationBarItem(
        label: 'search',
        icon: SvgPicture.asset(
          'assets/images/search.svg',
          width: 25,
          height: 25,
        ),
      ),
      BottomNavigationBarItem(
          label: 'reels',
          icon: SvgPicture.asset(
            'assets/images/reels.svg',
            width: 23,
            height: 23,
          ),
          activeIcon: SvgPicture.asset(
            'assets/images/reels.svg',
            width: 25,
            height: 25,
            color: Colors.white,
          )),
      BottomNavigationBarItem(
        label: 'notification',
        icon: SvgPicture.asset(
          'assets/images/notification_light.svg',
          width: 25,
          height: 25,
        ),
        activeIcon: SvgPicture.asset(
          'assets/images/notification_solid.svg',
          width: 25,
          height: 25,
        ),
      ),
      BottomNavigationBarItem(
          label: 'profile',
          icon: ProfileAvatar(
            imageUrl: DummyRepo().profileAvatars[0],
            radius: 12,
          )),
    ];
  }
}
