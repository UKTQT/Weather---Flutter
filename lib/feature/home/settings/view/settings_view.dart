import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../../home/viewModel/home_view_model.dart';
import '../viewModel/settings_view_model.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SettingsViewModel>(
        viewModel: SettingsViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder:
            (BuildContext context, SettingsViewModel _settingsViewModel) {
          return Container();
        });
  }
}
