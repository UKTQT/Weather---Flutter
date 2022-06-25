import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/components/bottom_days_box/bottom_days_box.dart';
import '../../viewModel/home_view_model.dart';

Expanded bottomBox(
    HomeViewModel _homeViewModel, PageController _pageViewController) {
  return Expanded(child: Observer(builder: (_) {
    return _homeViewModel.weatherItems!.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.only(left: 8, top: 10, bottom: 10),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _homeViewModel.weatherItems?.length ?? 0,
                itemBuilder: (context, index) {
                  return bottomDaysBox(
                      context, _pageViewController, index, _homeViewModel);
                }))
        : const CircularProgressIndicator();
  }));
}
