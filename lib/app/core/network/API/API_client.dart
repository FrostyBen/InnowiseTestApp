import 'package:test_flutter_weather/app/core/network/API/model/current_weather.dart';

import 'package:http/http.dart' as http;

class APIClient{
  Future<CurrentWeather> getWeather () async {
    var response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=53.893009&lon=27.567444&appid=67033552e6646e901e6110a12160cf68'));
    if (response.statusCode == 200){
      var data = response.body;
      final CurrentWeather jsonMap = CurrentWeather.fromRawJson(data);
    return jsonMap;
    }
    throw Exception();
  }
}
