import 'package:test_flutter_weather/app/core/bloc/weather_bloc/weatherbloc_bloc.dart';

import 'package:test_flutter_weather/app/core/network/API/API_client.dart';
import 'package:test_flutter_weather/app/core/network/API/model/current_weather.dart';
import 'package:test_flutter_weather/app/core/network/API/model/forecast_weather.dart';
import 'package:test_flutter_weather/app/core/repositories/weather_repository/weather_repository_base.dart';
import 'package:geolocator/geolocator.dart';
class WeatherRepositoryImpl extends WeatherRepositoryBase {
  @override
  Future<CurrentWeather> getTodayWeather()async {
    return  APIClient().getWeather (await _determinePosition());
  }

  Future <ForecastWeather> getForecastWeather()async {
    return APIClient().getForecast(await _determinePosition());

  }


  

 
  


Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 

 
  return await Geolocator.getCurrentPosition();
}
}
