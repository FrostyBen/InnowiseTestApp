
import '../../models/today_weather.dart';

abstract class WeatherRepositoryBase{
  TodayWeather getTodayWeather (String city);
}