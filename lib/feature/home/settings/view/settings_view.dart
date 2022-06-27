import 'package:flutter/material.dart';
import 'package:havadurumu/core/constants/app_constant.dart';
import 'package:havadurumu/core/constants/navigation_constant.dart';

import '../../../../core/extensions/color_extension.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/base/view/base_view.dart';
import '../viewModel/settings_view_model.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SettingsViewModel>(
      viewModel: SettingsViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder:
          (BuildContext context, SettingsViewModel _settingsViewModel) {
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
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, NavigationConstants.DEFAULT, (route) => false);
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              title: const Text('Ayarlar'),
            ),
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.mediumWidthPadding2,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Şehir Seçimi',
                      style: ThemeData.dark().textTheme.titleLarge,
                    ),
                    SizedBox(
                      height: context.lowHeightPadding,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.10,
                      width: MediaQuery.of(context).size.width,
                      child: DropdownButton<String>(
                        icon: Icon(Icons.arrow_downward),
                        value: AppConstant.instance.TURKISH_CITIES[31],
                        onChanged: (value) {},
                        items: AppConstant.instance.TURKISH_CITIES
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      height: context.mediumHeightPadding2,
                    ),
                    Text(
                      'Dil Seçimi',
                      style: ThemeData.dark().textTheme.titleLarge,
                    ),
                    SizedBox(
                      height: context.lowHeightPadding,
                    ),
                    Container(
                      color: Colors.red,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.10,
                        child: TextFormField(),
                      ),
                    ),
                    SizedBox(
                      height: context.highHeightPadding,
                    ),
                    Text('Seçim yapıldığı an kaydedilir.'),
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
