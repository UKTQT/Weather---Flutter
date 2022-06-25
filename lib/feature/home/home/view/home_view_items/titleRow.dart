import 'package:flutter/material.dart';

import '../../viewModel/home_view_model.dart';
import '../../../../../core/extensions/color_extension.dart';

Column titleRow(BuildContext context, HomeViewModel _homeViewModel, int index) {
  return Column(children: [
    Text('Eskişehir',
        style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: context.whiteColor)),
    Text('${_homeViewModel.weatherItems?[index].description}',
        style: TextStyle(fontSize: 20, color: context.whiteColor))
  ]);
}
