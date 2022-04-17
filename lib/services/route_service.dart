import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../controllers/bottom_nav_controller.dart';
import '../ui/bottom_nav/bottom_navigator.dart';

/// Route Management System
///
/// Initialize all pages routes names
@immutable
abstract class Routes {
  static const String bottomNav = '/bottom_nav';
}

/// Register pages as par Route Management
@immutable
abstract class RoutePages {
  static String initialPage = Routes.bottomNav;

  // Include all getPages with binding & middle-wares
  //
  // return page on user event click
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
