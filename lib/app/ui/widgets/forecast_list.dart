import 'package:flutter/material.dart';

import '../../core/models/forecast.dart';

class ForecastList extends StatelessWidget {
  const ForecastList({Key? key, required this.forecastList}) : super(key: key);
  final Forecast forecastList;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.wb_sunny,
                size: 70,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    forecastList.time,
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Clear',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
          const Text(
            '22°',
            style: TextStyle(fontSize: 50, color: Colors.blue),
          )
        ],
      ),
      const Divider(
        color: Colors.blue,
        height: 20,
        thickness: 2,
      ),
    ]);
  }
}
