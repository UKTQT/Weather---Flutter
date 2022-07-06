import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/app_constant.dart';
import '../../../../core/extensions/color_extension.dart';
import '../viewModel/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: SplashViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SplashViewModel SplashViewModel) {
        return splashScaffold(context: context);
      },
    );
  }

  Scaffold splashScaffold({required BuildContext context}) {
    return Scaffold(
      backgroundColor: context.propertyBox2,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CircularProgressIndicator(color: context.propertyBox1),
            ),
          ],
        ),
      ),
    );
  }
}
