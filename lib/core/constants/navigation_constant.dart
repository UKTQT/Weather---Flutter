class NavigationConstant {
  static NavigationConstant _instance = NavigationConstant._init();
  static NavigationConstant get instance => _instance;

  NavigationConstant._init();

  static const DEFAULT = '/';
  static const HOME_VIEW = '/home';
  static const SETTINGS_VIEW = '/settings';
}
