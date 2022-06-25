import 'package:flutter/material.dart';

import '../../viewModel/home_view_model.dart';

Image weatherImage(HomeViewModel _homeViewModel, int index) {
  return Image(
      image: NetworkImage('${_homeViewModel.weatherItems?[index].icon}'));
}
