import 'package:flutter/material.dart';
import 'package:test_flutter_weather/app/core/models/forecast.dart';
import 'package:test_flutter_weather/app/core/models/title.dart';
import 'package:test_flutter_weather/app/ui/widgets/forecast_list.dart';

class TitleListView extends StatelessWidget {
  TitleListView({
    Key? key,
    required this.titleList,
  }) : super(key: key);
  final TitleMainList titleList;
  List<Forecast> forecastList = [
    Forecast(
        icon: Icons.sunny, temperature: '16C', time: '16: 00', weather: 'good')
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(titleList.title),
        ListView.builder(itemBuilder: ((context, index) {
          return ForecastList(
            forecastList: forecastList[index],
          );
        }))
      ],
    );
  }
}
