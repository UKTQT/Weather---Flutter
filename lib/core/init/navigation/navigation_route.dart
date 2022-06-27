import 'package:flutter/material.dart';
import 'package:havadurumu/feature/home/settings/view/settings_view.dart';

import '../../constants/navigation_constant.dart';
import '../../../feature/home/home/view/home_view.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings path) {
    switch (path.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(
            widget: const HomeView(), pageName: NavigationConstants.DEFAULT);
      case NavigationConstants.SETTINGS_VIEW:
        return normalNavigate(
            widget: const SettingsView(),
            pageName: NavigationConstants.SETTINGS_VIEW);

      default:
        return MaterialPageRoute(builder: (context) => const HomeView());
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
