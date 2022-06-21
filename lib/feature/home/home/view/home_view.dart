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
        viewModel = model;
      },
      onPageBuilder: (context, value) {
        return Container();
      },
    );
  }
}
