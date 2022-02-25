import 'package:flutter/material.dart';
import 'package:test_flutter_weather/app/core/network/API/model/forecast_weather.dart';

import '../../core/models/forecast.dart';

class ForecastList extends StatelessWidget {
  const ForecastList({Key? key, required this.title, required this.elements})
      : super(key: key);
  final String title;
  final List<ListElement> elements;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
       const Divider(
        color: Colors.blue,
        height: 20,
        thickness: 2,
      ),
      Text(title),
      ...elements.map<Widget>(
        (element) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                   Image.asset(
                    'assets/${element.weather!.first.icon}.png',
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        element.dtTxt!.toLocal().hour.toString() + ':00',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        element.weather!.first.main!,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                (element.main!.temp!.toInt() - 273).toString() + '°C',
                style: TextStyle(fontSize: 50, color: Colors.blue),
              )
            ],
          );
        },
      ).toList(),
     
    ]);
  }
}
