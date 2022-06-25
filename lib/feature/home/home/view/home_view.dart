import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:havadurumu/core/constants/app_constant.dart';

import '../viewModel/home_view_model.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/bottom_days_box/bottom_days_box.dart';
import '../../../../core/components/property_box/property_box.dart';
import '../../../../core/extensions/color_extension.dart';
import '../../../../core/extensions/padding_extension.dart';

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
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.82,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 50, left: 20, right: 20),
                      child: Observer(
                        builder: (_) {
                          return _homeViewModel.weatherItems!.isNotEmpty
                              ? PageView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: 7,
                                  controller: _pageViewController,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            children: [
                                              Text(
                                                'Eskişehir',
                                                style: TextStyle(
                                                  fontSize: 40,
                                                  fontWeight: FontWeight.bold,
                                                  color: context.whiteColor,
                                                ),
                                              ),
                                              Text(
                                                '${_homeViewModel.weatherItems?[index].description}',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: context.whiteColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '${_homeViewModel.weatherItems?[index].degree} °',
                                                style: TextStyle(
                                                  fontSize: 40,
                                                  fontWeight: FontWeight.bold,
                                                  color: context.whiteColor,
                                                ),
                                              ),
                                              Text(
                                                '${_homeViewModel.weatherItems?[index].date}',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: context.whiteColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Image(
                                            image: NetworkImage(
                                                '${_homeViewModel.weatherItems?[index].icon}'),
                                          ),
                                        ),
                                        SizedBox(
                                            height:
                                                context.mediumHeightPadding),
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 6,
                                                child: propertyBox(
                                                    homeViewModel:
                                                        _homeViewModel,
                                                    index: index,
                                                    bgColor:
                                                        context.propertyBox1,
                                                    imgUrl: AppConstant
                                                        .instance.NIGHT_CONS,
                                                    property: _homeViewModel
                                                        .weatherItems?[index]
                                                        .night,
                                                    textColor:
                                                        context.whiteColor),
                                              ),
                                              SizedBox(
                                                  width: context
                                                      .mediumWidthPadding2),
                                              Expanded(
                                                flex: 6,
                                                child: propertyBox(
                                                    homeViewModel:
                                                        _homeViewModel,
                                                    index: index,
                                                    bgColor:
                                                        context.propertyBox1,
                                                    imgUrl: AppConstant
                                                        .instance.HUMIDITY_CONS,
                                                    property: _homeViewModel
                                                        .weatherItems?[index]
                                                        .humidity,
                                                    textColor:
                                                        context.whiteColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                            height:
                                                context.mediumHeightPadding),
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 6,
                                                child: propertyBox(
                                                    homeViewModel:
                                                        _homeViewModel,
                                                    index: index,
                                                    bgColor:
                                                        context.propertyBox2,
                                                    imgUrl: AppConstant.instance
                                                        .MAX_IMAGE_CONS,
                                                    property: _homeViewModel
                                                        .weatherItems?[index]
                                                        .max,
                                                    textColor:
                                                        context.propertyBox1),
                                              ),
                                              SizedBox(
                                                  width: context
                                                      .mediumWidthPadding2),
                                              Expanded(
                                                flex: 6,
                                                child: propertyBox(
                                                  homeViewModel: _homeViewModel,
                                                  index: index,
                                                  bgColor: context.propertyBox2,
                                                  imgUrl: AppConstant
                                                      .instance.MIN_IMAGE_CONS,
                                                  property: _homeViewModel
                                                      .weatherItems?[index].min,
                                                  textColor:
                                                      context.propertyBox1,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                            height:
                                                context.mediumHeightPadding),
                                      ],
                                    );
                                  },
                                )
                              : const CircularProgressIndicator();
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.17,
                    child: bottomBox(_homeViewModel, _pageViewController),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

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
}
