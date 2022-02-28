import 'package:flutter/material.dart';
import 'package:test_flutter_weather/app/core/network/API/model/forecast_weather.dart';


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
                    height: MediaQuery.of(context).size.height * 0.13,
                    width: MediaQuery.of(context).size.height * 0.13,
                  ),
                   SizedBox(
                    width: MediaQuery.of(context).size.width *0.01,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        element.dtTxt!.toLocal().hour.toString() + ':00',
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        element.weather!.first.main!,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                (element.main!.temp!.toInt() - 273).toString() + '°C',
                style: const TextStyle(fontSize: 50, color: Colors.blue),
              )
            ],
          );
        },
      ).toList(),
     
    ]);
  }
}
