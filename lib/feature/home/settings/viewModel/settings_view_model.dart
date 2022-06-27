import 'package:flutter/material.dart';
import 'package:havadurumu/core/base/model/base_model.dart';

import 'package:mobx/mobx.dart';
part 'settings_view_model.g.dart';

class SettingsViewModel = _SettingsViewModelBase with _$SettingsViewModel;

abstract class _SettingsViewModelBase with Store, BaseViewModel {
  //final HomeService _homeService = HomeService();

  @override
  void init() {}

  @override
  void setContext(BuildContext context) => this.baseViewContext = context;
}
