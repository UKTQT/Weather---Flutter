import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/constants/navigation_constant.dart';
import '../service/splash_service.dart';
import '../../../../core/base/model/base_model.dart';
part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel {
  final SplashService _splashService = SplashService();

  @override
  void setContext(BuildContext context) => this.baseViewContext = context;

  @override
  void init() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      militaryGateControl();
    });
  }

  @action
  void militaryGateControl() {
    Future.delayed(Duration(seconds: 1), () {
      navigation.navigateToPage(path: NavigationConstants.HOME_VIEW);
    });
  }
}
