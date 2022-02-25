import 'package:test_flutter_weather/app/core/network/API/model/current_weather.dart';

import 'package:http/http.dart' as http;
import 'package:test_flutter_weather/app/core/network/API/model/forecast_weather.dart';

class APIClient{
  Future<CurrentWeather> getWeather () async {
    var weatherResponse = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=53.893009&lon=27.567444&appid=67033552e6646e901e6110a12160cf68'));
    if (weatherResponse.statusCode == 200){
      var weatherData = weatherResponse.body;
      final CurrentWeather weatherJsonMap = CurrentWeather.fromRawJson(weatherData);
    return weatherJsonMap;
    }
    throw Exception();
  }

  Future<ForecastWeather> getForecast()async{
    var forecastResponse = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/forecast?lat=53.893009&lon=27.567444&appid=67033552e6646e901e6110a12160cf68'));
    if (forecastResponse.statusCode == 200){
      var forecastData = forecastResponse.body;
      final ForecastWeather forecastJsonMap = ForecastWeather.fromRawJson(forecastData);
      return forecastJsonMap; 
    }
    throw Exception();
  }
}

