import 'package:flutter/material.dart';
import 'package:havadurumu/core/constants/navigation_constant.dart';
import 'package:havadurumu/feature/home/home/view/home_view.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings path) {
    switch (path.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(
            widget: HomeView(), pageName: NavigationConstants.DEFAULT);

      default:
        return MaterialPageRoute(builder: (context) => HomeView());
    }
  }

  MaterialPageRoute normalNavigate(
      {required Widget widget, required String pageName}) {
    return MaterialPageRoute(
      builder: (context) => widget,
      settings: RouteSettings(name: pageName),
    );
  }

  MaterialPageRoute argsNavigate(
      {required Widget widget,
      required String pageName,
      dynamic navigateArguments}) {
    return MaterialPageRoute(
      builder: (context) => widget,
      settings: RouteSettings(name: pageName, arguments: navigateArguments),
    );
  }
}
