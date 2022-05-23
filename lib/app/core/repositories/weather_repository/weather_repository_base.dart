import 'package:test_flutter_weather/app/core/network/API/model/current_weather.dart';

abstract class WeatherRepositoryBase {
  Future<dynamic> getTodayWeather();
  Future<dynamic> getForecastWeather();
}
