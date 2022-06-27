import 'package:dio/dio.dart';
import 'dart:io';

import '../../../../core/init/cache/cache_manager.dart';
import '../model/home_model.dart';
import '../../../../core/init/network/network_manager.dart';

abstract class IHomeService {
  late final Dio _networkManagerDio;

  IHomeService() {
    _networkManagerDio = NetworkManager.instance.dio;
  }

  Future<List<HomeResult>?> fetchWeather();
}

enum _HomeEnums { getWeather }

class HomeService extends IHomeService {
  @override
  Future<List<HomeResult>?> fetchWeather() async {
    try {
      final response = await _networkManagerDio.get(
        _HomeEnums.getWeather.name,
        queryParameters: {
          'data.lang': CacheManager.instance.getStringValue('cache_lang'),
          'data.city': CacheManager.instance.getStringValue('cache_city'),
        },
      );
      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;
        return HomeModel.fromJson(_datas).result;
      }
    } on DioError catch (e) {}
    return null;
  }
}
