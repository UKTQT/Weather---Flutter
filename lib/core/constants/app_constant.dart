class AppConstant {
  static final AppConstant _instance = AppConstant._init();
  static AppConstant get instance => _instance;

  AppConstant._init();

  //Main Constants
  final PROJECT_TITLE = 'Weather App';
  final PROJECT_LOGO_PATH = 'assets/images/marvel-logo.png';

  // Image Constants
  final NIGHT_CONS = 'assets/images/night.ico';
  final HUMIDITY_CONS = 'assets/images/humidity.png';
  final MIN_IMAGE_CONS = 'assets/images/down.png';
  final MAX_IMAGE_CONS = 'assets/images/up.png';
}
