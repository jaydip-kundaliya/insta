import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'services/route_service.dart';
import 'utils/app_theme.dart';

/// Application Start-up Point
///
/// Material Page with initial route
class InstagramCloneApp extends StatelessWidget {
  const InstagramCloneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// flutter screen util
    ///
    /// For responsive UI
    return ScreenUtilInit(
      builder: (_) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          getPages: RoutePages.routePages(),
          initialRoute: RoutePages.initialPage,
        );
      },
    );
  }
}
