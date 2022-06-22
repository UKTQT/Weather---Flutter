import 'package:flutter/material.dart';
import 'package:havadurumu/core/base/view/base_view.dart';
import 'package:havadurumu/feature/home/home/viewModel/home_view_model.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  HomeViewModel? viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, HomeViewModel _homeViewModel) {
        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: _homeViewModel.weatherItems!.length ?? 1,
          itemBuilder: (context, index) {
            return Text('${_homeViewModel.weatherItems?[index].day}');
          },
        );
      },
    );
  }
}
