import 'package:flutter/cupertino.dart';

class Forecast {
  final IconData icon;
  final String time;
  final String weather;
  final String temperature;

  Forecast(
      {required this.icon,
      required this.time,
      required this.weather,
      required this.temperature});
}
