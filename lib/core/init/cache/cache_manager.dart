import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  static final CacheManager _instance = CacheManager._init();
  static CacheManager get instance => _instance;

  SharedPreferences? _preferences;

  CacheManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }

  static Future prefrencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> setStringValue(String key, String value) async {
    await _preferences!.setString(key, value);
  }

  Future<void> setBoolValue(String key, bool value) async {
    await _preferences!.setBool(key, value);
  }

  String getStringValue(String key) => _preferences?.getString(key) ?? '';

  bool getBoolValue(String key) => _preferences!.getBool(key) ?? false;
}
