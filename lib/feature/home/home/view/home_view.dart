import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:havadurumu/core/base/state/base_state.dart';
import 'package:havadurumu/core/base/view/base_view.dart';
import 'package:havadurumu/feature/home/home/viewModel/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController pageViewController = PageController();

    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, HomeViewModel _homeViewModel) {
        return RefreshIndicator(
          onRefresh: () async {},
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff2f58e1),
                  Color(0xff6aa9e8),
                ],
              ),
            ),
            child: Scaffold(
              body: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Container(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.82,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 50, left: 20, right: 20),
                          child: Observer(
                            builder: (_) {
                              return _homeViewModel.weatherItems!.isNotEmpty
                                  ? PageView.builder(
                                      itemCount: 7,
                                      controller: pageViewController,
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
                                                      fontSize: 35,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${_homeViewModel.weatherItems?[index].description}',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '${_homeViewModel.weatherItems?[index].degree} °',
                                                    style: TextStyle(
                                                      fontSize: 40,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${_homeViewModel.weatherItems?[index].date}',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white,
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
                                            Spacer(
                                              flex: 1,
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 6,
                                                    child: Container(
                                                      color: Colors.amber,
                                                      child: Column(
                                                        children: [
                                                          Text('Min'),
                                                          Text(
                                                              '${_homeViewModel.weatherItems?[index].min}')
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Expanded(
                                                    flex: 6,
                                                    child: Container(
                                                      color: Colors.amber,
                                                      child: Column(
                                                        children: [
                                                          Text('Min'),
                                                          Text(
                                                              '${_homeViewModel.weatherItems?[index].min}')
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Spacer(
                                              flex: 1,
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 6,
                                                    child: Container(
                                                      color: Colors.amber,
                                                      child: Column(
                                                        children: [
                                                          Text('Min'),
                                                          Text(
                                                              '${_homeViewModel.weatherItems?[index].min}')
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Expanded(
                                                    flex: 6,
                                                    child: Container(
                                                      color: Colors.amber,
                                                      child: Column(
                                                        children: [
                                                          Text('Min'),
                                                          Text(
                                                              '${_homeViewModel.weatherItems?[index].min}')
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Spacer(),
                                          ],
                                        );
                                      },
                                    )
                                  : CircularProgressIndicator();
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.18,
                      child: Expanded(
                        child: Observer(
                          builder: (_) {
                            return _homeViewModel.weatherItems!.isNotEmpty
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, top: 10, bottom: 10),
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          _homeViewModel.weatherItems?.length ??
                                              0,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.22,
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(30),
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  children: [
                                                    const Spacer(flex: 2),
                                                    Expanded(
                                                      flex: 5,
                                                      child: Text(
                                                        '${_homeViewModel.weatherItems?[index].day}',
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color.fromARGB(
                                                              255, 48, 67, 77),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 5,
                                                      child: Image(
                                                        image: NetworkImage(
                                                            '${_homeViewModel.weatherItems?[index].icon}'),
                                                      ),
                                                    ),
                                                    const Spacer(flex: 2),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                : CircularProgressIndicator();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
