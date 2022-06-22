import 'package:dio/src/dio.dart';
import 'package:havadurumu/core/init/network/network_manager.dart';

abstract class IHomeService {
  late final Dio _networkManagerDio;

  IHomeService() {
    _networkManagerDio = NetworkManager.instance.dio;
  }
}
