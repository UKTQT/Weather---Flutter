import 'package:connectivity_plus/connectivity_plus.dart';

enum ConnectivityResults { on, off }

abstract class IConnectivityManager {
  bool checkNetworkFirstTime();
}

class ConnectivityManager extends IConnectivityManager {
  var connectivityResult = (Connectivity().checkConnectivity());

  void deneme() {
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
  }

  @override
  bool checkNetworkFirstTime() {
    // TODO: implement checkNetworkFirstTime
    throw UnimplementedError();
  }
}
