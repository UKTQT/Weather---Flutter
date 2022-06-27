import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_model.dart';
import '../../../../core/init/cache/cache_manager.dart';
import '../model/home_model.dart';
import '../service/home_service.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  final HomeService _homeService = HomeService();

  @override
  void init() async {
    await _cacheStart();
    fetchWeather();
  }

  @override
  void setContext(BuildContext context) => this.baseViewContext = context;

  @observable
  bool isLoading = false;

  Future<void> _cacheStart() async {
    //First Run Cache Settings
    await CacheManager.prefrencesInit();
    if (CacheManager.instance.getStringValue('cache_city').isEmpty &&
        CacheManager.instance.getStringValue('cache_lang').isEmpty) {
      await CacheManager.instance.setStringValue('cache_city', 'Ankara');
      await CacheManager.instance.setStringValue('cache_lang', 'tr');
    }
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @observable
  bool? selected;

  @observable
  List<HomeResult>? weatherItems = [];

  @action
  Future<List<HomeResult>?> fetchWeather() async {
    changeLoading();
    weatherItems = await _homeService.fetchWeather() ?? [];
    changeLoading();
  }
}
