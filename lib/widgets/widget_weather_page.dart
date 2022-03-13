import 'package:flutter/material.dart';

import '../ui/helper/helper_color.dart';

Widget widgetWeather(
        dynamic date,
        dynamic day,
        dynamic icon,
        dynamic degree,
        dynamic description,
        dynamic night,
        dynamic max,
        dynamic min,
        dynamic humidity) =>
    Container(
      color: HelperColor.bodyBgColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 50.0),
            child: Row(
              children: [
                Text('Eskişehir',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Row(
              children: [
                Text(date,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 15.0,
                    )),
                SizedBox(width: 10.0),
                Text(day,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120.0, left: 50.0),
            child: Row(
              children: [
                Text(degree + '°',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0,
                        fontWeight: FontWeight.w900))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Row(
              children: [
                Image(
                  errorBuilder: (context, error, stackTrace) =>
                      CircularProgressIndicator(),
                  image: NetworkImage(icon),
                  width: 30.0,
                ),
                SizedBox(width: 20.0),
                Text(description,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Text('Gece',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 10.0),
                        Text(night + '°',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ))
                      ],
                    )),
                Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Text('En Yüksek',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 10.0),
                        Text(max + '°',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ))
                      ],
                    )),
                Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Text('En Düşük',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 10.0),
                        Text(min + '°',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ))
                      ],
                    )),
                Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Text('Nem',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 10.0),
                        Text(humidity,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ))
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
