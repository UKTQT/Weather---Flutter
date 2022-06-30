import 'package:flutter/material.dart';

import '../../../feature/home/home/viewModel/home_view_model.dart';

Container propertyBox(
    {required HomeViewModel homeViewModel,
    required int index,
    required Color bgColor,
    required String imgUrl,
    required String? property,
    required Color textColor}) {
  return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(14)),
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Column(children: [
            Expanded(flex: 7, child: Image(image: AssetImage(imgUrl))),
            Expanded(
              flex: 5,
              child: Text(
                property!,
                style: TextStyle(color: textColor, fontSize: 20),
              ),
            ),
          ])));
}
