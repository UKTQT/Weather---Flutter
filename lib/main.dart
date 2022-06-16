import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'pages/settings.dart';
import 'widgets/widget_weather_page.dart';
import 'ui/helper/helper_color.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Weather App',
      home: const MyHomePage(
        title: 'Flutter Weather Appp',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget? body; //Body null safety
  List<dynamic> data = []; // Weather data null safety

  @override
  void initState() {
    getJsonData();
    super.initState();
  }

  Future getJsonData() async {
    var response = await http.get(
        Uri.parse(
            'https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=eskişehir'), //Paste Weather Api url
        headers: {
          'content-type': 'application/json',
          'authorization':
              'apikey ................................' //Paste Weather Api apikey
        });

    setState(() {
      var convertDatatoJson = json.decode(response.body);

      if (response.statusCode == 200) {
        //if response not null
        data = convertDatatoJson['result'];
        body = DefaultTabController(
          initialIndex: 0,
          length: 5,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: HelperColor.appBarBgColor,
              title: Text('Flutter Weather App'),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: PopupMenuButton(
                      color: HelperColor.appBarPopupMenuItemBgColor,
                      child: Icon(
                        Icons.clear_all,
                        color: Colors.white,
                        size: 35.0,
                      ),
                      itemBuilder: (context) => [
                            const PopupMenuItem(
                                value: 1,
                                child: Text(
                                  'Ayarlar',
                                  style: TextStyle(color: Colors.white),
                                ))
                          ],
                      onSelected: (choice) {
                        switch (choice) {
                          case 1:
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => SettingsBody())));
                            break;
                        }
                      }),
                ),
              ],
              bottom: TabBar(
                  isScrollable: true,
                  tabs: List<Widget>.generate(5, (int index) {
                    return Tab(
                      child: Text(data[index]['day']),
                    );
                  })),
            ),
            body: TabBarView(
                children: List<Widget>.generate(5, (int index) {
              return widgetWeather(
                data[index]['date'],
                data[index]['day'],
                data[index]['icon'],
                data[index]['degree'],
                data[index]['description'],
                data[index]['night'],
                data[index]['max'],
                data[index]['min'],
                data[index]['humidity'],
              );
            })),
          ),
        );
      } else {
        // if response null
        body = Center(child: CircularProgressIndicator());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return body ?? Center(child: CircularProgressIndicator()); //if body null
  }
}
