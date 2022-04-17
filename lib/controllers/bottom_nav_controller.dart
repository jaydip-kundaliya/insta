import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/add_post/create_post_page.dart';
import '../ui/bottom_nav/bottom_navigator.dart';
import '../ui/feed/feed_page.dart';
import '../ui/notification/notification_page.dart';
import '../ui/profile/profile_page.dart';
import '../ui/search/search_page.dart';
import 'feed_controller.dart';

/// Get-X controller for control [BottomNavigator]
/// include 5 page & current index
class BottomNavController extends GetxController {
  /// function to call controller it-self
  ///
  /// Get-x find() function to get instance of controller
  static BottomNavController get bottomNavController => Get.find();

  // current UI page index
  RxInt currentIndex = 0.obs;

  // total 5 home UI page list
  final RxList<Widget> bottomPages = const <Widget>[
    FeedPage(),
    SearchPage(),
    CreatePostPage(),
    NotificationPage(),
    ProfilePage(),
  ].obs;

  // function to modify current UI page as pr user click
  void changeCurrentIndex(int index) {
    currentIndex.value = index;
  }
}

/// Get-x Binding to bind [BottomNavController] to [BottomNavigator]
class BottomNavigatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(() => BottomNavController());
    Get.lazyPut<FeedController>(() => FeedController());
  }
}
