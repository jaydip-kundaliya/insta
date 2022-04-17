import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/add_post/create_post_page.dart';
import '../ui/feed/feed_page.dart';
import '../ui/notification/notification_page.dart';
import '../ui/profile/profile_page.dart';
import '../ui/search/search_page.dart';

class BottomNavController extends GetxController {
  static BottomNavController get bottomNavController => Get.find();

  RxInt currentIndex = 0.obs;
  final RxList<Widget> bottomPages = const <Widget>[
    FeedPage(),
    SearchPage(),
    CreatePostPage(),
    NotificationPage(),
    ProfilePage(),
  ].obs;

  void changeCurrentIndex(int index) {
    currentIndex.value = index;
  }
}

class BottomNavigatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(() => BottomNavController());
  }
}
