import 'package:flutter/material.dart';

import '../../extensions/color_extension.dart';
import '../../../feature/home/home/viewModel/home_view_model.dart';

Padding bottomDaysBox(BuildContext context, PageController _pageViewController,
    int index, HomeViewModel _homeViewModel) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: SizedBox(
      width: MediaQuery.of(context).size.width * 0.17,
      child: GestureDetector(
        onTap: () {
          _pageViewController.animateToPage(index,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut);
        },
        child: Container(
          decoration: BoxDecoration(
              color: context.propertyBox1,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF000000),
                  offset: Offset.zero,
                  blurRadius: 1,
                  spreadRadius: 0.0,
                  blurStyle: BlurStyle.normal,
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Spacer(flex: 2),
                Expanded(
                  flex: 5,
                  child: Text(
                    '${_homeViewModel.weatherItems?[index].day}',
                    style: TextStyle(
                      fontSize: 18,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
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
    ),
  );
}
