import 'package:flutter/material.dart';

import '../../../../core/constants/app_constant.dart';
import '../../../../core/constants/navigation_constant.dart';
import '../../../../core/extensions/color_extension.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/init/cache/cache_manager.dart';
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
                            Navigator.pushNamedAndRemoveUntil(context,
                                NavigationConstants.DEFAULT, (route) => false);
                          },
                          icon: const Icon(Icons.arrow_back_ios)),
                      title: Text(AppConstant.instance.SETTINGS_TITLE)),
                  body: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: context.highWidthPadding2),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(AppConstant.instance.SETTINGS_CITY_TITLE,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: context.whiteColor)),
                                SizedBox(height: context.lowHeightPadding),
                                cityDropDown(context),
                                SizedBox(height: context.mediumHeightPadding2),
                                Text(AppConstant.instance.SETTINGS_LANG_TITLE,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: context.whiteColor)),
                                SizedBox(height: context.lowHeightPadding),
                                langDropDown(context),
                                SizedBox(height: context.highHeightPadding),
                                Text(AppConstant.instance.SETTINGS_DESC,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              ])))));
        });
  }

  SizedBox cityDropDown(BuildContext context) {
    return SizedBox(
      child: Container(
        color: context.whiteColor,
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 3,
                  color: context.whiteColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: context.whiteColor))),
          isExpanded: true,
          icon: Icon(
            Icons.arrow_downward,
            color: context.blackColor,
          ),
          style: TextStyle(
            color: context.blackColor,
            fontSize: 20.0,
          ),
          value: CacheManager.instance.getStringValue('cache_city'),
          menuMaxHeight: MediaQuery.of(context).size.height * 0.5,
          onChanged: (valueCity) {
            CacheManager.instance.setStringValue('cache_city', valueCity!);
          },
          items:
              AppConstant.instance.TURKISH_CITIES.map<DropdownMenuItem<String>>(
            (String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            },
          ).toList(),
        ),
      ),
    );
  }

  SizedBox langDropDown(BuildContext context) {
    return SizedBox(
      child: Container(
        color: context.whiteColor,
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 3,
                  color: context.whiteColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: context.whiteColor))),
          isExpanded: true,
          icon: Icon(
            Icons.arrow_downward,
            color: context.blackColor,
          ),
          style: TextStyle(
            color: context.blackColor,
            fontSize: 20.0,
          ),
          value: CacheManager.instance.getStringValue('cache_lang'),
          menuMaxHeight: MediaQuery.of(context).size.height * 0.5,
          onChanged: (valueLang) {
            CacheManager.instance.setStringValue('cache_lang', valueLang!);
          },
          items: ['tr', 'en'].map<DropdownMenuItem<String>>(
            (String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
