import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../controllers/bottom_nav_controller.dart';
import '../ui/bottom_nav/bottom_navigator.dart';

@immutable
abstract class Routes {
  static const String bottomNav = '/bottom_nav';
}

@immutable
abstract class RoutePages {
  static String initialPage = Routes.bottomNav;

  static List<GetPage<dynamic>> routePages() {
    return <GetPage<dynamic>>[
      GetPage<dynamic>(
        name: Routes.bottomNav,
        page: () => const BottomNavigator(),
        binding: BottomNavigatorBinding(),
      )
    ];
  }
}
