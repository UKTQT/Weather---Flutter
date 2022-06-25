import 'package:flutter/cupertino.dart';
import 'package:havadurumu/core/base/model/base_model.dart';
import 'package:havadurumu/feature/home/home/model/home_model.dart';
import 'package:havadurumu/feature/home/home/service/home_service.dart';
import 'package:mobx/mobx.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  final HomeService _homeService = HomeService();

  @override
  void init() {
    fetchWeather();
  }

  @override
  void setContext(BuildContext context) => this.baseViewContext = context;

  @observable
  bool isLoading = false;

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
