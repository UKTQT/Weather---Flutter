import 'package:flutter/material.dart';

import '../../../../../core/components/property_box/property_box.dart';
import '../../../../../core/constants/app_constant.dart';
import '../../viewModel/home_view_model.dart';
import '../../../../../core/extensions/color_extension.dart';
import '../../../../../core/extensions/padding_extension.dart';

Row propertyRow1(
    HomeViewModel _homeViewModel, int index, BuildContext context) {
  return Row(
    children: [
      Expanded(
        flex: 4,
        child: propertyBox(
            homeViewModel: _homeViewModel,
            index: index,
            bgColor: context.propertyBox1,
            imgUrl: AppConstant.instance.NIGHT_CONS,
            property: _homeViewModel.weatherItems?[index].night,
            textColor: context.whiteColor),
      ),
      SizedBox(width: context.mediumWidthPadding2),
      Expanded(
        flex: 4,
        child: propertyBox(
            homeViewModel: _homeViewModel,
            index: index,
            bgColor: context.propertyBox1,
            imgUrl: AppConstant.instance.HUMIDITY_CONS,
            property: _homeViewModel.weatherItems?[index].humidity,
            textColor: context.whiteColor),
      ),
      SizedBox(width: context.mediumWidthPadding2),
      Expanded(
        flex: 4,
        child: propertyBox(
            homeViewModel: _homeViewModel,
            index: index,
            bgColor: context.propertyBox2,
            imgUrl: AppConstant.instance.MAX_IMAGE_CONS,
            property: _homeViewModel.weatherItems?[index].max,
            textColor: context.propertyBox1),
      ),
      SizedBox(width: context.mediumWidthPadding2),
      Expanded(
        flex: 4,
        child: propertyBox(
            homeViewModel: _homeViewModel,
            index: index,
            bgColor: context.propertyBox2,
            imgUrl: AppConstant.instance.MIN_IMAGE_CONS,
            property: _homeViewModel.weatherItems?[index].min,
            textColor: context.propertyBox1),
      ),
    ],
  );
}
