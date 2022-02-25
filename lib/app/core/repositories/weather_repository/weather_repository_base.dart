import 'package:test_flutter_weather/app/core/network/API/model/current_weather.dart';
import 'package:test_flutter_weather/app/core/network/API/model/forecast_weather.dart';

abstract class WeatherRepositoryBase {
  Future<CurrentWeather> getTodayWeather(String city);
  Future<ForecastWeather> getForecastWeather(String city);
}
