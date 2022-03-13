import 'dart:convert';

import 'package:flutter/material.dart';

import '../ui/helper/helper_color.dart';
import '../ui/helper/helper_text.dart';
import '../ui/helper/json/turkey_citys.dart';

class SettingsBody extends StatefulWidget {
  const SettingsBody({Key? key}) : super(key: key);

  @override
  State<SettingsBody> createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  String? dropdownValue1 = 'eskişehir';
  String? dropdownValue2 = 'tr';
  @override
  Widget build(BuildContext context) {
    var data = TurkeyCityClass.turkey_city;

    return Scaffold(
      appBar: AppBar(
        title: Text('Ayarlar'),
        backgroundColor: HelperColor.appBarBgColor,
      ),
      body: Container(
          color: HelperColor.bodyBgColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 80.0),
                child: Row(
                  children: [
                    Text('Şehir: ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold)),
                    SizedBox(width: 20.0),
                    DropdownButton(
                      value: dropdownValue1,
                      elevation: 16,
                      style:
                          const TextStyle(color: Colors.black, fontSize: 20.0),
                      underline: Container(
                        height: 2,
                        color: Colors.white,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue1 = newValue;
                          HelperText.weatherDataSettings
                              .putIfAbsent('city', () => 'newValue.toString()');
                        });
                      },
                      items: data.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 80.0),
                child: Row(
                  children: [
                    Text('Sistem Dili: ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold)),
                    SizedBox(width: 20.0),
                    DropdownButton(
                      value: dropdownValue2,
                      elevation: 16,
                      style:
                          const TextStyle(color: Colors.black, fontSize: 20.0),
                      underline: Container(
                        height: 3,
                        color: Colors.white,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue2 = newValue;
                        });
                      },
                      items: ['tr', 'en']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
