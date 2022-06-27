import 'package:dio/dio.dart';

import '../cache/cache_manager.dart';

class NetworkManager {
  static final NetworkManager _instance = NetworkManager._init();
  static NetworkManager get instance => _instance;

  late final Dio _dio;
  Dio get dio => _dio;

  NetworkManager._init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.collectapi.com/weather/',
        headers: {
          'content-type': 'application/json',
          'authorization':
              'apikey 3YpwKq3Z7NViSpqNGsWmcE:4AqTlw0d003lF0OCI6OeGc' //Paste Weather Api apikey
        },
      ),
    );
  }
}
