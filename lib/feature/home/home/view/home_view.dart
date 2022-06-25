import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../viewModel/home_view_model.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/extensions/color_extension.dart';
import '../../../../core/extensions/padding_extension.dart';

import 'home_view_items/bottomBox.dart';
import 'home_view_items/degreeRow.dart';
import 'home_view_items/propertyRow1.dart';
import 'home_view_items/propertyRow2.dart';
import 'home_view_items/titleRow.dart';
import 'home_view_items/weatherImage.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController _pageViewController = PageController();

    return BaseView<HomeViewModel>(
        viewModel: HomeViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, HomeViewModel _homeViewModel) {
          return Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    context.themeLinearColor1,
                    context.themeLinearColor2
                  ])),
              child: Scaffold(
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.endTop,
                  floatingActionButton: SizedBox(
                      width: 35,
                      child: FloatingActionButton(
                          backgroundColor: context.whiteColor,
                          onPressed: () {},
                          child: Icon(Icons.settings,
                              color: context.themeLinearColor1))),
                  body: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Column(children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.82,
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 50, left: 20, right: 20),
                                child: Observer(builder: (_) {
                                  return _homeViewModel.weatherItems!.isNotEmpty
                                      ? PageView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: 7,
                                          controller: _pageViewController,
                                          itemBuilder: (context, index) {
                                            return Column(children: [
                                              Expanded(
                                                  flex: 2,
                                                  child: titleRow(context,
                                                      _homeViewModel, index)),
                                              Expanded(
                                                  flex: 1,
                                                  child: degreeRow(
                                                      _homeViewModel,
                                                      index,
                                                      context)),
                                              Expanded(
                                                  flex: 4,
                                                  child: weatherImage(
                                                      _homeViewModel, index)),
                                              SizedBox(
                                                  height: context
                                                      .mediumHeightPadding),
                                              Expanded(
                                                  flex: 1,
                                                  child: propertyRow1(
                                                      _homeViewModel,
                                                      index,
                                                      context)),
                                              SizedBox(
                                                  height: context
                                                      .mediumHeightPadding),
                                              Expanded(
                                                  flex: 1,
                                                  child: propertyRow2(
                                                      _homeViewModel,
                                                      index,
                                                      context)),
                                              SizedBox(
                                                  height: context
                                                      .mediumHeightPadding)
                                            ]);
                                          })
                                      : const Center(
                                          child: CircularProgressIndicator(
                                              color: Colors.white));
                                }))),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.17,
                            child:
                                bottomBox(_homeViewModel, _pageViewController))
                      ]))));
        });
  }
}
