import 'package:flutter/material.dart';

import '../../../../../core/init/cache/cache_manager.dart';
import '../../viewModel/home_view_model.dart';
import '../../../../../core/extensions/color_extension.dart';

Column titleRow(BuildContext context, HomeViewModel _homeViewModel, int index) {
  return Column(children: [
    Text(CacheManager.instance.getStringValue('cache_city'),
        style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: context.whiteColor)),
    Text('${_homeViewModel.weatherItems?[index].description}',
        style: TextStyle(fontSize: 20, color: context.whiteColor))
  ]);
}
