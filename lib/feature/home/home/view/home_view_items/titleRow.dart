import 'package:flutter/material.dart';

import '../../../../../core/init/cache/cache_manager.dart';
import '../../viewModel/home_view_model.dart';
import '../../../../../core/extensions/color_extension.dart';
import '../../../../../core/extensions/padding_extension.dart';

Column titleRow(BuildContext context, HomeViewModel _homeViewModel, int index) {
  return Column(children: [
    Text(CacheManager.instance.getStringValue('cache_city'),
        style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: context.whiteColor)),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('${_homeViewModel.weatherItems?[index].day}',
            style: TextStyle(fontSize: 20, color: context.whiteColor)),
        SizedBox(
          width: context.mediumWidthPadding,
        ),
        Text(' - ', style: TextStyle(fontSize: 20, color: context.whiteColor)),
        SizedBox(
          width: context.mediumWidthPadding,
        ),
        Text('${_homeViewModel.weatherItems?[index].description}',
            style: TextStyle(fontSize: 20, color: context.whiteColor)),
      ],
    )
  ]);
}
