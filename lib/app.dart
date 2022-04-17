import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'services/route_service.dart';

class InstagramCloneApp extends StatelessWidget {
  const InstagramCloneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: RoutePages.routePages(),
      initialRoute: RoutePages.initialPage,
    );
  }
}
