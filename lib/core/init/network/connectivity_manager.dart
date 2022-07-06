import 'package:connectivity_plus/connectivity_plus.dart';

abstract class IConnectivityManager {
  void checkNetworkFirstTime() {}
}

class ConnectivityManager extends IConnectivityManager {
  var connectivityResult = (Connectivity().checkConnectivity());
}
