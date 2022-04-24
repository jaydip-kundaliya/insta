import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../controllers/bottom_nav_controller.dart';
import '../controllers/stories_controller.dart';
import '../ui/bottom_nav/bottom_navigator.dart';
import '../ui/story/story_viewer.dart';

/// Route Management System
///
/// Initialize all pages routes names
@immutable
abstract class Routes {
  static const String bottomNav = '/bottom_nav';
  static const String storyPage = '/story_page';
}

/// Register pages as par Route Management
@immutable
abstract class RoutePages {
  static String initialPage = Routes.bottomNav;

  // Include all getPages with binding & middle-wares
  //
  // return page on user event click
  static List<GetPage<String>> routePages() {
    return <GetPage<String>>[
      GetPage<String>(
        name: Routes.bottomNav,
        page: () => const BottomNavigator(),
        binding: BottomNavigatorBinding(),
      ),
      GetPage<String>(
        name: Routes.storyPage,
        page: () => const StoryViewerPage(),
        binding: StoriesBinding(),
      )
    ];
  }
}
