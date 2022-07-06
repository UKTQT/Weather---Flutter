import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mobx/mobx.dart';

enum ConnectivityResults { on, off }

abstract class IConnectivityManager {
  Future<bool?> checkNetworkStatus();
}

class ConnectivityManager extends IConnectivityManager {
  static final ConnectivityManager _instance = ConnectivityManager._init();
  static ConnectivityManager get instance => _instance;

  ConnectivityManager._init() {
    checkNetworkStatus();
  }

  @observable
  bool? connectivityStatus;

  @override
  @action
  Future<bool?> checkNetworkStatus() async {
    //var connectivityResult = await (Connectivity().checkConnectivity());
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      switch (result) {
        case ConnectivityResult.wifi:
        case ConnectivityResult.mobile:
          connectivityStatus = true;
          break;
        case ConnectivityResult.none:
          connectivityStatus = false;
      }
    });

    return null;
  }

  /* void deneme() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      switch (result) {
        case ConnectivityResult.bluetooth:
        case ConnectivityResult.wifi:
        case ConnectivityResult.ethernet:
        case ConnectivityResult.mobile:
        case ConnectivityResult.none:
          return print('başarılı connect ${result}');
      }
    });
  } */
}
