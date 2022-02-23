import 'package:test_flutter_weather/app/core/bloc/weather_bloc/weatherbloc_bloc.dart';
import 'package:test_flutter_weather/app/core/models/today_weather.dart';
import 'package:test_flutter_weather/app/core/network/API/API_client.dart';
import 'package:test_flutter_weather/app/core/network/API/model/current_weather.dart';
import 'package:test_flutter_weather/app/core/repositories/weather_repository/weather_repository_base.dart';

class WeatherRepositoryImpl extends WeatherRepositoryBase{
  @override
  Future <CurrentWeather> getTodayWeather(String city) {
    return APIClient().getWeather();
  }
}
