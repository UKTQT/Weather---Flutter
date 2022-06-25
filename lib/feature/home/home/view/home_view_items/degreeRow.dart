import 'package:flutter/material.dart';

import '../../viewModel/home_view_model.dart';
import '../../../../../core/extensions/color_extension.dart';

Row degreeRow(HomeViewModel _homeViewModel, int index, BuildContext context) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Text('${_homeViewModel.weatherItems?[index].degree} °',
        style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: context.whiteColor)),
    Text('${_homeViewModel.weatherItems?[index].date}',
        style: TextStyle(fontSize: 20, color: context.whiteColor))
  ]);
}
