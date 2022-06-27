import 'package:flutter/material.dart';

import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/constants/app_constant.dart';
import 'core/extensions/color_extension.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstant.instance.PROJECT_TITLE,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
      theme: ThemeData(
        scaffoldBackgroundColor: context.transparentColor,
        appBarTheme: AppBarTheme(
          color: context.transparentColor,
        ),
      ),
    );
  }
}
